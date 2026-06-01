import { useState, useEffect } from "react"
import { useNavigate, NavLink } from "react-router"


export default function DogForm() {
    const [nome, setNome] = useState("");
    const [email, setEmail] = useState("");
    const [senha, setSenha] = useState("");
    
    const [data, setData] = useState({
        name: "",
        email: "",
        password: ""
    })

    let navigate = useNavigate();

    const handleName = (e) => {
        setNome(e.target.value)
        console.log(nome)
    }

    const handleEmail = (e) => {
        setEmail(e.target.value)
        console.log(email)
    }

    const handleSenha = (e) => {
        setSenha(e.target.value)
        console.log(senha)
    }

    return (
        <>
        <h1>Pagina registro dog</h1>
        </>
    )
}