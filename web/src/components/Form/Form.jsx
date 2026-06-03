import { useState, useEffect } from "react"
import axios from ''
import Input from "./Input"

export default function Form() {

    const [data, setData] = useState({
        name: "",
        cpf: "",
        rg: "",
        email: "",
        telefone: "",
        endereco: "",
        animal: {
            animalName: "",
            especie: "",
            raca: "",
            cor: "",
            idade: "",
            sexo: ""
        }
    })

    const handleTutor = (e) => {
        const { name, value } = e.target

        setData({
            ...data,
            [name]: value
        })
    }

    const handleAnimal = (e) => {
        const { name, value } = e.target

        setData((prev) => ({
            ...prev, // Mantem as propriedades de data
            animal: {
                ...prev.animal, // Mantem as outras propriedades do animal
                [name]: value // atualiza a propriedade especidicada
            }
        }))
    }



    useEffect(() => {
        console.log(data)
    }, [data])

    return (
        <form className="w-full flex flex-col gap-y-6">
            <div>
                <h1 className="text-2xl text-blue-950 font-semibold mb-2">Dados Tutor</h1>
                <div className="w-full grid grid-cols-2 gap-x-4 gap-y-4">

                    <Input label={"Nome Completo:"} name={"name"} placeholder={"Nome completo"}
                        value={data.name} onChange={handleTutor} />

                    <Input label={"CPF:"} name={"cpf"} placeholder={"000.000.000-00"}
                        value={data.cpf} onChange={handleTutor} />

                    <Input label={"RG N°:"} name={"rg"} placeholder={"00.000.000-0"}
                        value={data.rg} onChange={handleTutor} />

                    <Input label={"Email"} name={"email"} placeholder={"Digite seu email"}
                        value={data.email} onChange={handleTutor} />

                    <Input label={"Telefone/Contato:"} name={"telefone"} placeholder={"00 00000-0000"}
                        value={data.telefone} onChange={handleTutor} />

                    <Input label={"Endereço:"} name={"endereco"} placeholder={"Rua ou logradouro, n°, bairro"}
                        value={data.endereco} onChange={handleTutor} />

                </div>
            </div>
            <div>
                <h1 className="text-2xl text-blue-950 font-semibold mb-2">Dados Cachorro/Gato</h1>
                <div className="w-full grid grid-cols-2 gap-x-4 gap-y-4">

                    <Input label={"Nome:"} name={"animalName"}
                        value={data.animal.animalName} onChange={handleAnimal}
                        placeholder={"nome do animal"} />

                    {/* <Input label={"Espécie:"} name={"especie"}
                        value={data.animal.name} onChange={handleAnimal}
                        placeholder={"espécie do animal"} /> */}

                    <div className="flex flex-col">
                        <label
                            className="text-sm font-semibold text-blue-950 mb-2 block">
                            Espécie:
                        </label>

                        <select defaultValue={"insira especie"} value={data.animal.especie} onChange={handleAnimal}
                            className="bg-[#F9FEFF] h-12.5 w-full px-2 py-3 pr-4 
                        border-2 border-blue-700 rounded-lg
                        text-blue-950 font-semibold 
                        focus:outline-none active:bg-blue-50"
                            name="especie">
                            <option value="Cachorro">Cachorro</option>
                            <option value="Gato">Gato</option>
                        </select>
                    </div>


                    <Input label={"Raça:"} name={"raca"} placeholder={"raça do animal"}
                        value={data.animal.raca} onChange={handleAnimal} />

                    <Input label={"Cor:"} name={"cor"}
                        value={data.animal.cor} onChange={handleAnimal}
                        placeholder={"cor do animal"} />

                    <Input label={"Idade:"} name={"idade"} placeholder={"idade do animal"}
                        value={data.animal.idade} onChange={handleAnimal} />

                    <div className="flex flex-col">
                        <label
                            className="text-sm font-semibold text-blue-950 mb-2 block">
                            Sexo:
                        </label>

                        <select value={data.animal.sexo} onChange={handleAnimal}
                            className="bg-[#F9FEFF] h-12.5 w-full px-2 py-3 pr-4 
                        border-2 border-blue-700 rounded-lg
                        text-blue-950 font-semibold 
                        focus:outline-none active:bg-blue-50"
                            id="sexo" name="sexo">
                            <option value="Macho">Macho</option>
                            <option value="Fêmea">Fêmea</option>
                        </select>
                    </div>

                    {/* <Input label={"Sexo:"} name={"sexo"} placeholder={"macho ou Fêmea"}
                        value={data.animal.sexo} onChange={handleAnimal} /> */}

                </div>
            </div>
            <div className="w-full flex items-center justify-end">
                <button type="submit" className="w-[300px] bg-blue-700 text-[#FFF] font-semibold px-6 py-4 rounded-lg hover:bg-blue-800 transition-colors hover:cursor-pointer">Enviar</button>
            </div>
        </form>
    )
}