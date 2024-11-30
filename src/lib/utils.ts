import { auth } from "@clerk/nextjs/server";

export const getAuthDetails = async (): Promise<{
  role?: string;
  userId?: string;
}> => {
  const { sessionClaims, userId } = await auth();
  const role = (sessionClaims?.metadata as { role?: string })?.role;
  return { role, userId: userId ?? undefined };
};
