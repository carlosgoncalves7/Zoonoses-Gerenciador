import { useState, useEffect } from "react";
import axios from "axios";

export default function Dashboard() {

    const [animais, setAnimais] = useState([])

    const fetchData = async () => {
        try {
            const response = await axios.get("http://localhost:8000/animal.api.php")
            const data = await response.data;

            setAnimais(data)

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
                <span className="text-xl text-blue-950 font-bold">Lista de animais cadastrados</span>
                <button className="bg-blue-700 text-gray-50 font-bold px-4 py-2 rounded-md ml-auto hover:bg-blue-600 transition-colors duration-200 cursor-pointer">Novo animal</button>
            </header>
            <table className=" border-collapse border border-gray-300 w-full">
                <colgroup>
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                    <col />
                </colgroup>
                <thead>
                    <tr className="text-left">
                        <th className="px-2 py-3"><span>Nome Animal:</span></th>
                        <th className="px-2 py-3"><span>Raça:</span></th>
                        <th className="px-2 py-3"><span>Espécie:</span></th>
                        <th className="px-2 py-3"><span>Idade:</span></th>
                        <th className="px-2 py-3"><span>Peso:</span></th>
                        <th className="px-2 py-3"><span>Nome Tutor:</span></th>
                        <th className="px-2 py-3"><span>Alterar:</span></th>
                    </tr>
                </thead>
                <tbody>
                    {
                        animais.map((animal, index) => (
                            <tr key={index}
                                className="h-12.5 py-2 text-blue-950 border-t border-gray-300 hover:bg-blue-600 hover:text-gray-50 transition-colors duration-200 cursor-pointer"
                            >
                                {console.log(animal)}
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.nome_animal}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.raca}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.especie}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.idade} anos</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.peso}Kg</span>
                                </td>
                                <td className="px-2 py-2">
                                    <span className="text-base font-medium text-current">{animal.tutor}</span>
                                </td>
                                <td className="px-2 py-2">
                                    <button>
                                        <span className="text-base font-medium text-current">
                                            Editar</span>
                                    </button>
                                </td>
                            </tr>
                        ))
                    }
                </tbody>
            </table>
        </>
    )
}