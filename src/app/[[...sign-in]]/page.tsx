'use client'

import * as Clerk from '@clerk/elements/common'
import * as SignIn from '@clerk/elements/sign-in'
import { useUser } from '@clerk/nextjs'
import Image from 'next/image'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'


const LoginPage = () => {
    const { isLoaded, isSignedIn, user } = useUser()

    const [username, setUsername] = useState('admin')
    const [password, setPassword] = useState('admin')

    const router = useRouter()

    useEffect(() => {
        const role = user?.publicMetadata.role;

        if (role) {
            router.push(`/${role}`)
        }
    }, [user, router])

    return (
        <div className='h-screen flex items-center justify-center bg-edunestSkyLight'>
            <SignIn.Root>
                <SignIn.Step name='start' className='bg-white p-12 rounded-md shadow-2xl flex flex-col gap-2' >
                    <h1 className='text-xl font-bold flex items-center gap-2 mx-auto my-2'>
                        <Image src="/logo.png" alt='' width={24} height={24} />
                        Edunest
                    </h1>
                    <h2 className='text-gray-400 mx-auto my-2'>Sign in to your account</h2>

                    <Clerk.GlobalError className='text-xs text-red-400' />
                    <Clerk.Field name="identifier" className='flex flex-col gap-2'>
                        <Clerk.Label className='text-xs text-gray-500'>Username</Clerk.Label>
                        <Clerk.Input type='text' value={username}
                            onChange={(e) => setUsername(e.target.value)} required className='p-2 rounded-md ring-1 ring-gray-300' />
                        <Clerk.FieldError className='text-xs text-red-500' />
                    </Clerk.Field>
                    <Clerk.Field name="password" className='flex flex-col gap-2'>
                        <Clerk.Label className='text-xs text-gray-500'>Password</Clerk.Label>
                        <Clerk.Input type='password' value={password}
                            onChange={(e) => setPassword(e.target.value)} required className='p-2 rounded-md ring-1 ring-gray-300' />
                        <Clerk.FieldError className='text-xs text-red-500' />
                    </Clerk.Field>
                    <SignIn.Action submit className='bg-blue-500 w-full p-2 mt-5 text-center text-white rounded-md shadow-lg hover:bg-blue-400 hover:shadow-sm hover:text-black'>Sign in</SignIn.Action>
                </SignIn.Step>
            </SignIn.Root>
        </div>
    )
}

export default LoginPage