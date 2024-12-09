import { z } from "zod";

export const subjectSchema = z.object({
  id: z.coerce.number().optional(),
  name: z.string().min(1, { message: "Subject name is required!!" }),
  teachers: z.array(z.string()),
});

export type SubjectSchema = z.infer<typeof subjectSchema>;

export const classSchema = z.object({
  id: z.coerce.number().optional(),
  name: z.string().min(1, { message: "Subject name is required!!" }),
  capacity: z.coerce.number().min(1, { message: "Capacity is required!!" }),
  gradeId: z.coerce.number().min(1, { message: "Grade id is required!!" }),
  supervisorId: z.coerce.string().optional(),
});

export type ClassSchema = z.infer<typeof classSchema>;

export const teacherSchema = z.object({
  id: z.string().optional(),
  username: z
    .string()
    .min(3, { message: "Username must be at least 3 characters" })
    .max(20, { message: "Username can not be long more than 20 characters" }),
  password: z
    .string()
    .min(6, { message: "Password must be at least 6 characters" })
    .optional()
    .or(z.literal("")),
  name: z.string().min(1, { message: "First name is required" }),
  surname: z.string().min(1, { message: "Last name is required" }),
  email: z
    .string()
    .email({ message: "Invalid email address" })
    .optional()
    .or(z.literal("")),
  phone: z.string().optional(),
  address: z.string(),
  img: z.string().optional(),
  bloodType: z.string().min(1, { message: "Blood Group is required" }),
  birthday: z.coerce.date({ message: "Birthday is required" }),
  sex: z.enum(["MALE", "FEMALE"], { message: "Sex is required" }),
  subjects: z.array(z.string()).optional(),
});

export type TeacherSchema = z.infer<typeof teacherSchema>;
