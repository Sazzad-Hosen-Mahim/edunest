import Pagination from "@/components/Pagination";
import Table from "@/components/Table";
import TableSearch from "@/components/TableSearch";
import { role, examsData } from "@/lib/data";
import Image from "next/image";
import Link from "next/link";
import  FormModal  from '@/components/FormModal';

type Exam = {
  id: number;
  subject: string;
  class: string;
  teacher: string;
  date: string;
};

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
  {
    header: "Actions",
    accessor: "actions",
  },
];

const ExamListPage = () => {
  const renderRow = (item: Exam) => (
    <tr
      key={item.id}
      className="border-b border-gray-200 even:bg-slate-100 text-sm hover:bg-edunestPurpleLight"
    >
      <td className=" py-4 px-2">{item.subject}</td>
      <td className="hidden md:table-cell py-4 px-2">{item.class}</td>
      <td className="">{item.teacher}</td>
      <td className="hidden md:table-cell py-4 px-2">{item.date}</td>
      <td>
        <div className="flex items-center gap-2">
          
          {role === "admin" && (
            <>
            <FormModal table="exam" type="update" data={item} /> 
            <FormModal table="exam" type="delete" id={item.id} /> 
            </>
          )}
        </div>
      </td>
    </tr>
  );
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
            {role === "admin" && (
            <FormModal table="exam" type="create" /> 

            )}
          </div>
        </div>
      </div>
      {/* List */}
      <div className="">
        <Table columns={columns} renderRow={renderRow} data={examsData} />
      </div>
      {/* Pagination */}
      <Pagination />
    </div>
  );
};

export default ExamListPage;
