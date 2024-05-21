import {db} from "@/lib/db";

// get user with it's email
export const getUserByEmail = async (email: string) => {
  try {
    const user = await db.user.findUnique({
      where: {email},
    });
    return user;
  } catch (error) {
    return null;
  }
};

export const getUserById = async (id: string) => {
  try {
    const user = await db.user.findUnique({
      where: {
        id,
      },
    });
    return user;
  } catch (error) {
    return null;
  }
};
