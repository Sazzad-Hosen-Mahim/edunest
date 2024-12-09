import Pagination from "@/components/Pagination";
import Table from "@/components/Table";
import TableSearch from "@/components/TableSearch";
import Image from "next/image";
import FormContainer from '@/components/FormContainer';
import { ITEM_PER_PAGE } from "@/lib/settings";
import prisma from "@/lib/prisma";
import { Class, Exam, Prisma, Subject, Teacher } from "@prisma/client";
import { getAuthDetails } from "@/lib/utils";

type ExamList = Exam & {
  lesson: {
    subject: Subject,
    class: Class,
    teacher: Teacher
  }
}




const ExamListPage = async ({
  searchParams,
}: {
  searchParams: { [key: string]: string | undefined }
}) => {

  const { role, userId } = await getAuthDetails()
  console.log("Role: ", role, "userID: ", userId,);

  const columns = [
    {
      header: "Subject",
      accessor: "subject",
    },
    {
      header: "Class",
      accessor: "class",
      className: "hidden md:table-cell",
    },

    {
      header: "Teacher",
      accessor: "teacher",
    },
    {
      header: "Date",
      accessor: "date",
      className: "hidden md:table-cell",
    },
    ...(role === "admin" || role === "teacher" ? [
      {
        header: "Actions",
        accessor: "actions",
      }] : []),
  ];

  const renderRow = (item: ExamList) => (
    <tr
      key={item.id}
      className="border-b border-gray-200 even:bg-slate-100 text-sm hover:bg-edunestPurpleLight"
    >
      <td className=" py-4 px-2">{item.lesson.subject.name}</td>
      <td className="hidden md:table-cell py-4 px-2">{item.lesson.class.name}</td>
      <td className="">{item.lesson.teacher.name + " " + item.lesson.teacher.surname}</td>
      <td className="hidden md:table-cell py-4 px-2">{new Intl.DateTimeFormat("en-US").format(item.startTime)}</td>
      <td>
        <div className="flex items-center gap-2">

          {(role === "admin" || role === "teacher") && (
            <>
              <FormContainer table="exam" type="update" data={item} />
              <FormContainer table="exam" type="delete" id={item.id} />
            </>
          )}
        </div>
      </td>
    </tr>
  );

  const { page, ...queryParams } = searchParams;

  const p = page ? parseInt(page) : 1;

  //URL PARAMS CONDITION

  const query: Prisma.ExamWhereInput = {}

  query.lesson = {};
  if (queryParams) {
    for (const [key, value] of Object.entries(queryParams)) {
      if (value !== undefined) {
        switch (key) {
          case "search":
            query.lesson.subject = {
              name: { contains: value, mode: "insensitive" }
            }
            break;
          case "teacherId":
            query.lesson.teacherId = value
            break;
          case "classId":
            query.lesson.classId = parseInt(value)
            break;
          default:
            break;
        }
      }
    }
  }

  console.log("Query object: ", query)

  // ROLE CONDITIONS 
  switch (role) {
    case "admin":
      break;
    case "teacher":
      query.lesson.teacherId = userId;
    case "student":
      query.lesson.class = {
        students: {
          some: {
            id: userId,
          },
        },
      };
    case "parent":
      query.lesson.class = {
        students: {
          some: {
            parentId: userId,
          },
        },
      };
    default:
      break;
  }

  const [data, count] = await prisma.$transaction([
    prisma.exam.findMany({
      where: query,
      include: {
        lesson: {
          select: {
            subject: { select: { name: true } },
            teacher: { select: { name: true, surname: true } },
            class: { select: { name: true } },
          }
        }
      },
      take: ITEM_PER_PAGE,
      skip: ITEM_PER_PAGE * (p - 1)
    }),
    prisma.exam.count({ where: query })
  ])

  console.log(data)
  return (
    <div className="bg-white p-4 rounded-md flex-1 m-4 mt-0">
      {/* Top */}
      <div className="flex items-center justify-between">
        <h1 className="hidden md:block text-lg fond-semibold">All Exams</h1>
        <div className="flex flex-col md:flex-row items-center gap-4  w-full md:md:w-auto">
          <TableSearch />
          <div className="flex items-center gap-4 self-end">
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-edunestYellow">
              <Image src="/filter.png" alt="" width={14} height={14} />
            </button>
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-edunestYellow">
              <Image src="/sort.png" alt="" width={14} height={14} />
            </button>
            {(role === "admin" || role === "teacher") && (
              <FormContainer table="exam" type="create" />

            )}
          </div>
        </div>
      </div>
      {/* List */}
      <div className="">
        <Table columns={columns} renderRow={renderRow} data={data} />
      </div>
      {/* Pagination */}
      <Pagination page={p} count={count} />
    </div>
  );
};

export default ExamListPage;
