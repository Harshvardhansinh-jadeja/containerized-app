"use server";
import {RegisterSchema} from "@/schemas";
import * as z from "zod";
import bcrypt from "bcryptjs";
import {db} from "@/lib/db";
import {getUserByEmail} from "@/data/user";
export const register = async (values: z.infer<typeof RegisterSchema>) => {
  const validatedFields = RegisterSchema.safeParse(values);

  if (!validatedFields.success) {
    return {error: "Invalid Fields"};
  }

  const {email, name, password} = validatedFields.data;

  const hashedPassword = await bcrypt.hash(password, 10);
  const existingEmail = await getUserByEmail(email);

  if (existingEmail) {
    return {error: "Email already in use!"};
  }
  await db.user.create({
    data: {
      name,
      email,
      password: hashedPassword,
    },
  });

  return {success: "User created!"};
};
