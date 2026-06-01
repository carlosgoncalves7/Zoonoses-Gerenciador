import { Outlet } from "react-router"

import Aside from "../components/NavBar/Aside"

export default function Home(){

    return(
        <main className="w-full min-h-screen flex flex-row">
        <Aside />
        <section className="w-full py-20 px-9"><Outlet/></section>
        </main>
    )
}