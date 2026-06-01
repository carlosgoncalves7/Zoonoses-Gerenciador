import { useState, useEffect } from "react";
import { useNavigate, NavLink } from "react-router";
import axios from "axios";
import { Email, Password } from "../components/IconNav"

import hero from "../assets/hero.png"

export default function Login() {

    const [data, setData] = useState();
    const [form, setForm] = useState({
        email: "",
        senha: "",
    })

    let navigate = useNavigate();

    const handleChange = (e) => {
        const { name, value } = e.target
        setForm(prev => ({ ...prev, [name]: value }))
    }


    const handleSubmit = async (e) => {
        e.preventDefault();

        try {
            const response = await axios.post("http://localhost:8000/validacao_login.php", JSON.stringify(form))
            const data = await response.data;

            if (data.authentication) {
                navigate('/home');
            }

            console.log(data)
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }

    return (
        <section className="h-screen w-full bg-blue-50 flex flex-row justify-center items-center">
            <div className="px-10 py-10 w-140 flex items-center">
                <form onSubmit={handleSubmit}
                    className="flex flex-col px-4 py-8 w-120 gap-6">
                    <div className="flex flex-col gap-7">
                        <h1 className="text-4xl font-extrabold leading-8 text-blue-700"
                        >Unidade de Vigilância em <span className="text-orange-500">Zoonoses</span></h1>
                        <span className="text-2xl text-blue-950 font-bold"
                        >Acesse com Login</span>
                    </div>
                    <div className="flex flex-col gap-2">
                        <label htmlFor="email"
                            className="text-base text-blue-950 font-bold"
                        >Email</label>
                        <div className="flex items-center">
                            <div className="flex items-center justify-center h-12.5 py-3 px-2 bg-blue-400 border-2 border-blue-800">
                                <Email />
                            </div>
                            <input type="text"
                                name="email"
                                value={form.email}
                                onChange={handleChange}
                                placeholder="insira seu email"
                                className="bg-[#F9FEFF] h-12.5 w-full pl-2 py-3 pr-4 border-2 border-l-0 border-blue-700 focus:outline-none placeholder:text-blue-800 placeholder:text-[14px] placeholder:font-semibold active:bg-blue-50"
                            />
                        </div>
                    </div>
                    <div className="flex flex-col gap-2">
                        <label htmlFor="senha"
                            className="text-base text-blue-950 font-bold"
                        >Senha</label>
                        <div className="flex items-center">
                            <div className="flex items-center justify-center h-12.5 py-3 px-2 bg-blue-400 border-2 border-blue-800">
                                <Password />
                            </div>
                            <input type="text"
                                name="senha"
                                value={form.senha}
                                onChange={handleChange}
                                placeholder="insira sua senha"
                                className="bg-[#F9FEFF] h-12.5 w-full pl-2 py-3 pr-4 border-2 border-l-0 border-blue-700 focus:outline-none placeholder:text-blue-800 placeholder:text-[14px] placeholder:font-semibold"
                            />
                        </div>
                    </div>
                    <button type="submit"
                        className="bg-blue-600 px-8 py-4 text-[#F1F1F1] font-bold text-lg transition-all hover:bg-blue-400 rounded-md cursor-pointer"
                    >Entrar</button>
                </form >
            </div >
        </section>
    )
}