import { useState } from 'react'
import { Outlet } from 'react-router'

import Header from './components/Header'
import Form from './components/Register'
import Login from './components/Login'

function App() {
  
  return (
    <>
      <main>
        <Outlet />
      </main>

    </>
  )
}

export default App
