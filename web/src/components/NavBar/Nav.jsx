import { NavLink } from "react-router"
import { Dog, Cat, Book, CheckSquare, Hourglass, SignOut } from "../IconNav"


export default function Nav() {
    
    const linkStyle = {
        default: "px-4 py-3 rounded-lg bg-blue-50 border-2 border-blue-600  text-blue-700",
        active: "px-4 py-3 rounded-lg bg-blue-700 border-2 border-blue-600  text-blue-50"
    }

    const boxStyle = {
        default: "flex flex-row items-center justify-items-start gap-2"
    }

    const linkOut = {
        default: ""
    }
    // className={({ isActive }) =>
    //     `px-4 py-2 rounded ${isActive ? "bg-blue-500 text-white" : "text-gray-600"}`
    //   }

    return (
        <nav className="flex flex-col gap-5 ">
            <NavLink to="caes-register"
                className={(isActive) => isActive ? linkStyle.active : linkStyle.default}>
                <div className={boxStyle.default}>
                    <Dog />
                    <span className="text-base font-bold">Registro de Cães</span>
                </div>
            </NavLink>
            <NavLink 
            className={(isActive) => isActive ? linkStyle.active : linkStyle.default}>
                <div className={boxStyle.default}>
                    <Cat />
                    <span>Registro de Gatos</span>
                </div>
            </NavLink>
            <NavLink
            className={(isActive) => isActive ? linkStyle.active : linkStyle.default}>
                <div className={boxStyle.default}>
                    <Book />
                    <span>Consultar Cadastro</span>
                </div>
            </NavLink>
            <NavLink
            className={(isActive) => isActive ? linkStyle.active : linkStyle.default}>
                <div className={boxStyle.default}>
                    <CheckSquare />
                    <span>Castrados</span>
                </div>
            </NavLink>
            <NavLink
            className={(isActive) => isActive ? linkStyle.active : linkStyle.default}>
                <div className={boxStyle.default}>
                    <Hourglass />
                    <span>Espera</span>
                </div>
            </NavLink>
            <NavLink
            className={linkOut}>
                <div>
                    <SignOut />
                    <span>Sair</span>
                </div>
            </NavLink>
        </nav>
    )
}