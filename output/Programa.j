.class public Programa
.super java/lang/Object

.field public static _sc Ljava/util/Scanner;

.method public <init>()V
	aload_0
	invokenonvirtual java/lang/Object/<init>()V
	return
.end method

.method static <clinit>()V
	.limit stack 3
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
	putstatic Programa/_sc Ljava/util/Scanner;
	return
.end method

.method public static fat(I)I
	.limit stack 20
	.limit locals 2

	iconst_1
	istore 1
l0:
	iload 1
	iload 0
	imul
	istore 1
	iload 0
	iconst_1
	isub
	istore 0
	iload 0
	iconst_0
	if_icmpgt l0
	goto l1
l1:
	iload 1
	ireturn
.end method

.method public static main([Ljava/lang/String;)V
	.limit stack 20
	.limit locals 3

	iconst_5
	invokestatic Programa/fat(I)I
	istore 1
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 1
	invokevirtual java/io/PrintStream/println(I)V
	return
	return
.end method
