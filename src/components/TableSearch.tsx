import Image from "next/image"

const TableSearch = () => {
  return (
    <div className="w-full md:w-auto p-2 flex items-center gap-2 text-sm rounded-full ring-[2px] ring-gray-300 px-2">
      <Image src="/search.png" alt="" width={14} height={14} />
      <input
        type="text"
        placeholder="Search..."
        className="w-[200px] p-1 bg-transparent outline-none"
      />
    </div>
  )
}

export default TableSearch