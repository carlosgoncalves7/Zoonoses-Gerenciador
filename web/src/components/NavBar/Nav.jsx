import { NavLink } from "react-router"
import { Dog, Cat, Book, CheckSquare, Hourglass, SignOut } from "../IconNav"
import Link from "./Link"

export default function Nav() {

    return (
        <nav className="flex flex-col gap-5 ">
            <Link href="dashboard" svg={""}>
                Dashboard
            </Link>
            <Link href="cadastro" svg={""}>
                Registrar Cadastro
            </Link>
            <Link href="caes" svg={<Dog />}>
                Book Cães
            </Link>
            <Link href="gatos" svg={<Cat />}>
                Book Gatos
            </Link>
            <Link href="procedimentos" svg={<Book />}>
                Procedimentos
            </Link>
            <Link href="castrados" svg={<CheckSquare />}>
                Castrados
            </Link>
            <Link href="quemsou" svg={<CheckSquare />}>
                Quem Sou
            </Link>
            <Link href="/" svg={<SignOut />}>
                Sair
            </Link>
            {/* <NavLink to="caes-register"
                    className={({isActive}) => isActive ? linkStyle.active : linkStyle.default}>
                    <div className={boxStyle.default}>
                        <Dog />
                        <span className="text-base ">Registro de Cães</span>
                    </div>
                </NavLink>
                <NavLink to="cat-register"
                className={({isActive}) => isActive ? linkStyle.active : linkStyle.default}>
                    <div className={boxStyle.default}>
                        <Cat />
                        <span className="text-base">Registro de Gatos</span>
                    </div>
                </NavLink>
                <NavLink to="cadastro"
                className={({isActive}) => isActive ? linkStyle.active : linkStyle.default}>
                    <div className={boxStyle.default}>
                        <Book />
                        <span className="text-base">Consultar Cadastro</span>
                    </div>
                </NavLink>
                <NavLink to="castrados"
                className={({isActive}) => isActive ? linkStyle.active : linkStyle.default}>
                    <div className={boxStyle.default}>
                        <CheckSquare />
                        <span className="text-base">Castrados</span>
                    </div>
                </NavLink>
                <NavLink to="fila-de-espera"
                className={({isActive}) => isActive ? linkStyle.active : linkStyle.default}>
                    <div className={boxStyle.default}>
                        <Hourglass />
                        <span className="text-base">Espera</span>
                    </div>
                </NavLink>
            <NavLink to="/"
            className="px-4 py-2.5 border-t border-t-blue-50 text-[#FFF]">
                <div className="flex flex-row gap-2 text-">
                    <SignOut />
                    <span className="text-base">Sair</span>
                </div>
            </NavLink> */}
        </nav>
    )
}