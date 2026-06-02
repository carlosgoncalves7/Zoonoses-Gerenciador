import { NavLink } from "react-router"
import Nav from "./Nav"
export default function Header() {

    return (
        <aside className="bg-blue-800 h-screen min-w-65 py-10 px-5 sticky top-0 left-0">
            <Nav/>
        </aside>
    )
}