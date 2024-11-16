import Menu from "@/components/Menu";
import Navbar from "@/components/Navbar";
import Image from "next/image";
import Link from "next/link";

export default function DashboardLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <div className="h-screen flex">
      {/* Left  */}
      <div className="p-3 w-[15%] md:w-[8%] lg:w-[16%] xl:w-[15%] ">
        <Link href="/" className="flex gap-2">
          <Image src="/logo.png" alt="logo" width={32} height={32}></Image>
          <span className="hidden lg:block font-bold">Edunest</span>
        </Link>
        <Menu />
      </div>
      {/* Right  */}
      <div className="w-[85%] md:w-[92%] lg:w-[84%] xl:w-[85%] bg-[#F7F8FA] overflow-scroll">
        <Navbar />
        {children}
      </div>
    </div>
  );
}
