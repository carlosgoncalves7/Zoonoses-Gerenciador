import { Outlet } from "react-router"
import Header from "../components/Header"
export default function Home(){

    return(
        <>
        <Header />
        <h1>Pagina Home!</h1>
        <main><Outlet/></main>
        </>
    )
}