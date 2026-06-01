import { useState, useEffect } from "react"
import { useNavigate, NavLink } from "react-router"


export default function TutorRegister() {
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
        <form>
            <h1>Realize seu Cadastro</h1>
            <label htmlFor="name">Nome Completo:</label>
            <input 
            type="text" 
            name="name"
            value={nome} 
            onChange={handleName} />

            <label htmlFor="email">Email</label>
            <input type="email"
            name="email"
            value={email}
            onChange={handleEmail}
            />

            <label htmlFor="senha">Senha</label>
            <input 
            type="senha"
            name="senha"
            value={senha}
            onChange={handleSenha}
            />
        </form>
    )
}