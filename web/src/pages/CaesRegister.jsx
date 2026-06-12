import { useState, useEffect } from "react";
import axios from "axios";
import { Outlet, NavLink } from "react-router"

export default function RegistroCaes() {

    const [caes, setCaes] = useState(null);
    const [loading, setLoading] = useState(false);

    const fetchData = async () => {

        setLoading(true);

        try {
            const response = await axios.get("http://localhost:8000/caes.api.php")
            const data = await response.data;
            if (!data) {
                throw new Error('Erro ao buscar os dados');
                return;
            }
            setCaes(data)

        } catch (error) {
            console.error("Error fetching data:", error);
        } finally {
            setLoading(false);
        }
    }


    useEffect(() => {
        fetchData();
    }, [])

    return (
        <>
            <header className="flex flex-row justify-between items-center px-3 py-2 mb-3">
                <span className="text-xl text-blue-950 font-bold">Lista de Caes</span>
                <button
                    className="bg-blue-700 text-gray-50 font-bold px-4 py-2 rounded-md ml-auto hover:bg-blue-600 transition-colors duration-200 cursor-pointer">
                    Novo Cachorro</button>
            </header>
            <table className=" border-collapse border border-gray-300 w-full">
                <colgroup>
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                    {/* <col /> */}
                </colgroup>
                <thead>
                    <tr className="text-left border border-gray-300">
                        <th className="px-2 py-3"><span>Nome Animal:</span></th>
                        <th className="px-2 py-3"><span>Raça:</span></th>
                        <th className="px-2 py-3"><span>Idade:</span></th>
                        <th className="px-2 py-3"><span>Sexo:</span></th>
                        <th className="px-2 py-3"><span>Peso:</span></th>
                        <th className="px-2 py-3"><span>Nome Tutor:</span></th>
                        {/* <th className="px-2 py-3"><span>Alterar:</span></th> */}
                    </tr>
                </thead>
                <tbody>
                    {
                        caes ? caes.map((animal, index) => (
                            <tr key={index}
                                className="h-12.5 py-2 text-blue-950 border-t border-gray-300 hover:bg-blue-600 hover:text-gray-50 transition-colors duration-200 cursor-pointer"
                            >
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.nome}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.raca}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.idade} anos</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.sexo}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.peso}Kg</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.tutor ? animal.tutor : "N/A"}</span>
                                </td>
                                {/* <td className="px-2 py-2">
                                    <button>
                                        <span className="text-base font-medium text-current">
                                            Editar</span>
                                    </button>
                                </td> */}
                            </tr>
                        )) : <tr><td colSpan="8" className="text-center py-4 text-gray-500">Nenhum cão cadastrado</td></tr>
                    }
                </tbody>
            </table>
        </>
    )
}