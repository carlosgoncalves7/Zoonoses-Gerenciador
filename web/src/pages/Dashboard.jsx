import { useState, useEffect } from "react";
import axios from "axios";

export const ViewsCard = ({title, value,className, ...props}) => {
    return (
        <div className={"bg-blue-900 flex flex-col justify-between px-5 py-4 rounded-[10px] hover:bg-blue-800 hover:cursor-pointer transition-colors" + " "+ className}>
            <span className="inline-block text-xl text-[#FFF] text-[18px] font-medium">{title}</span>
            <p className="block text-[32px] text-[#FFF] font-bold text-end ">{value}</p>
        </div>
    )
}

export default function Dashboard() {
    const [animais, setAnimais] = useState([])

    // const fetchData = async () => {
    //     try {
    //         const response = await axios.get("http://localhost:8000/animal.api.php")
    //         const data = await response.data;
    //         if(!data){
    //             setAnimais(false);
    //             return;
    //         }
    //         setAnimais(data)

    //     } catch (error) {
    //         console.error("Error fetching data:", error);
    //     }
    // }
    // useEffect(() => {
    //     fetchData();
    // }, [])

    return (
        <>
            <header className="flex flex-row justify-between items-center px-3 py-2 mb-3">
                <span className="text-[18px] text-blue-950 font-bold">Bem-Vindo ao Book</span>
            </header>
            <section>

                <div className="w-[720px] grid grid-cols-12 grid-rows-2 gap-[24px] bg-orange-500">

                    <ViewsCard 
                    title={"Total de Cães cadastrados"} 
                    value={24} 
                    className={"col-span-4"}/>
                    <ViewsCard 
                    title={"Total de Gatos cadastrados"} 
                    value={24} 
                    className={"col-span-4"}/>
                    <ViewsCard 
                    title={"Total de animais cadastrados"} 
                    value={24} 
                    className={"col-span-4"}/>
                    <ViewsCard 
                    title={"Castrações realizadas"} 
                    value={24} 
                    className={"col-span-4"}/>
                    <ViewsCard 
                    title={"Procedimentos realizados"} 
                    value={24} 
                    className={"col-span-8"}/>

                </div>

            </section>
        </>
    )
}