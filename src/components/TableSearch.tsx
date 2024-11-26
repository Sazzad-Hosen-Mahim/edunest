"use client"

import Image from "next/image"
import { useRouter } from "next/navigation"

const TableSearch = () => {

  const router = useRouter();

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const value = (e.currentTarget[0] as HTMLInputElement).value
    const params = new URLSearchParams(window.location.search);
    params.set("search", value)
    router.push(`${window.location.pathname}?${params}`)
  }
  return (
    <form onSubmit={handleSubmit} className="w-full md:w-auto p-2 flex items-center gap-2 text-sm rounded-full ring-[2px] ring-gray-300 px-2">
      <Image src="/search.png" alt="" width={14} height={14} />
      <input
        type="text"
        placeholder="Search..."
        className="w-[200px] p-0 bg-transparent outline-none"
      />
    </form>
  )
}

export default TableSearch