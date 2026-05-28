import { useState, useEffect } from "react";
import { useNavigate, NavLink } from "react-router";
import axios from "axios";

export default function Login() {

    const [data, setData] = useState();
    const [form, setForm] = useState({
        email: "",
        senha:"",
    })

    let navigate = useNavigate();

    const handleChange = (e) => {
        const { name, value } = e.target
        setForm(prev => ({...prev, [name]: value}))
    }


    const handleSubmit = async (e) => {
        e.preventDefault();
        
        console.log(form)
        try {
        const response = await axios.post("http://localhost:8000/api.php", JSON.stringify(form))
        const data = await response.data;

        if(data.sucesso){
            navigate('/home');
        }
        
        console.log(data)
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }

    return (
        <>
            <form onSubmit={handleSubmit}
            className="flex flex-col px-4 py-8"
            >
                <h1>Acesse com Login</h1>
                
                <label htmlFor="email">Email</label>
                <input type="text"
                    name="email"
                    value={form.email}
                    className="px-2 py-1 outline"
                    onChange={handleChange}
                />

                <label htmlFor="senha">Senha</label>
                <input type="text"
                    name="senha"
                    className="px-2 p-1 outline"
                    value={form.senha}
                    onChange={handleChange}
                />

                <button type="submit">Entrar</button>
            </form>
                <NavLink to="register">Nao possui cadastro? Realize aqui</NavLink>
        </>
    )
}