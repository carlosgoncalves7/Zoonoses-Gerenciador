import { NavLink } from "react-router"

export default function Header() {

    return (
        <header>
            <nav>
                <NavLink to="/home">Home</NavLink>
                <NavLink to="register">Registrar Animal</NavLink>
                <NavLink to="about">Quem Somos</NavLink>
                <NavLink to="dashboard">DashBoard</NavLink>
            </nav>
        </header>
    )
}