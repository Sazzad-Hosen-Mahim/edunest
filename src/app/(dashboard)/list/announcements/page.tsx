import Pagination from "@/components/Pagination";
import Table from "@/components/Table";
import TableSearch from "@/components/TableSearch";
import { role, announcementsData } from "@/lib/data";
import Image from "next/image";
import Link from "next/link";
import FormModal from '@/components/FormModal';

type Announcement = {
  id: number;
  title: string;
  class: string;
  date: string;
};

const columns = [
  {
    header: "Title",
    accessor: "title",
  },
  {
    header: "Class",
    accessor: "class",
  },
  {
    header: "Date",
    accessor: "date",
  },
  {
    header: "Actions",
    accessor: "actions",
  },
];

const AnnouncementListPage = () => {
  const renderRow = (item: Announcement) => (
    <tr
      key={item.id}
      className="border-b border-gray-200 even:bg-slate-100 text-sm hover:bg-edunestPurpleLight"
    >
      <td className="p-4">{item.title}</td>
      <td>{item.class}</td>
      <td className="">{item.date}</td>
      <td>
        <div className="flex items-center gap-2">

          {role === "admin" && (
            <>
              <FormModal table="announcement" type="update" data={item} />
              <FormModal table="announcement" type="delete" id={item.id} />
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
        <h1 className="hidden md:block text-lg fond-semibold">
          All Announcements
        </h1>
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
              <FormModal table="announcement" type="create" />
            )}
          </div>
        </div>
      </div>
      {/* List */}
      <div className="">
        <Table
          columns={columns}
          renderRow={renderRow}
          data={announcementsData}
        />
      </div>
      {/* Pagination */}
      <Pagination />
    </div>
  );
};

export default AnnouncementListPage;
