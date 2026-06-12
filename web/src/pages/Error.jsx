import { NavLink } from "react-router"

export default function Error() {

    return (
        <>
            <h1>Foi Mal! Caminho errado!!!!</h1>
            <NavLink to="/home">Voltar a Home</NavLink>
        </>
    )
}