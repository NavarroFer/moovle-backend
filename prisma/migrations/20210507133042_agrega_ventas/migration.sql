-- CreateTable
CREATE TABLE "usuario" (
    "nombre" VARCHAR(30)[],
    "apellido" VARCHAR(30) NOT NULL,
    "user" VARCHAR(20) NOT NULL,
    "password" VARCHAR(20) NOT NULL,

    PRIMARY KEY ("user")
);

-- CreateTable
CREATE TABLE "producto" (
    "id" BIGINT NOT NULL,
    "nombre" VARCHAR(40),
    "descripcion" VARCHAR(255),

    PRIMARY KEY ("id")
);
