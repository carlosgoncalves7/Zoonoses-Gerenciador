import { useState, useEffect } from "react";
import axios from "axios";

export default function Procedimentos() {

    const [procedimentos, setProcedimentos] = useState([])

    const fetchData = async () => {
        try {
            const response = await axios.get("http://localhost:8000/procedimentos.api.php")
            const data = await response.data;
            if (!data) {
                setProcedimentos(false);
                return;
            }
            setProcedimentos(data)

        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }
    useEffect(() => {
        fetchData();
    }, [])


    return (
        <>
            <header className="flex flex-row justify-between items-center px-3 py-2 mb-3">
                <span className="text-xl text-blue-950 font-bold">Lista de Procedimentos</span>
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
                    <tr className="text-left">
                        <th className="px-2 py-3"><span>Nome Procedimento:</span></th>
                        <th className="px-2 py-3"><span>Descrição:</span></th>
                        <th className="px-2 py-3"><span>Nome Animal:</span></th>
                        <th className="px-2 py-3"><span>Sexo:</span></th>
                        <th className="px-2 py-3"><span>Veterinario:</span></th>
                        <th className="px-2 py-3"><span>Data:</span></th>
                        {/* <th className="px-2 py-3"><span>Alterar:</span></th> */}
                    </tr>
                </thead>
                <tbody>
                    {
                        procedimentos ? procedimentos.map((proced, index) => (
                            <tr key={proced.id_procedimento}
                                className="h-12.5 py-2 text-blue-950 border-t border-gray-300 hover:bg-blue-600 hover:text-gray-50 transition-colors duration-200 cursor-pointer"
                            >
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.nome_procedimento}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.descricao}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.nome}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.sexo}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.veterinario}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{proced.data}</span>
                                </td>
                                {/* <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.tutor ? animal.tutor : "N/A"}</span>
                                </td> */}
                                {/* <td className="px-2 py-2">
                                    <button>
                                        <span className="text-base font-medium text-current">
                                            Editar</span>
                                    </button>
                                </td> */}
                            </tr>
                        )) : <tr><td colSpan="8" className="text-center py-4 text-gray-500">Nenhum procedimento encontrado!</td></tr>
                    }
                </tbody>
            </table>
        </>
    )
}