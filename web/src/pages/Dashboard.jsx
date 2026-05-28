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
            <h1>Pagina DashBoard</h1>
            {/* <button className="border px-6 py-1 bg-gray-300"
                onClick={handleClick}>Buscar</button> */}
            <main className="h-screen w-full flex flex-col gap-4">
                {
                    animais.map((animal, index) => (
                        <button key={index}
                        className="border px-4 py-1"
                        >   
                        {console.log(animal)}
                            <p>{animal.nome_animal}</p>
                            <p>{animal.nome_tutor}</p>
                            <p>{animal.nome_funcionario}</p>
                        </button>
                    ))
                }

            </main>
        </>
    )
}