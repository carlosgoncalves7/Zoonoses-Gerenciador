import { Outlet } from "react-router"

import Aside from "../components/NavBar/Aside"

export default function Home() {

    return (
        <main className="grid grid-cols-[min(260px)_minmax(0,1fr)] grid-rows-[min(50px)_minmax(0,1fr)] w-full min-h-screen">
            <Aside className={"col-span-1"} />
            <header className="w-full bg-blue-700 px-16 py-4 text-[#FFF] text-[16px] font-semibold row-span-1 flex items-center justify-start">
                <span>Unidade de Vigilância em Zoonoses</span>
            </header>
            <section className="w-full py-6 px-9 col-start-2"><Outlet /></section>
        </main>
    )
}