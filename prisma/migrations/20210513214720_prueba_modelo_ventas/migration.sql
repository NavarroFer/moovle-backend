/*
  Warnings:

  - Added the required column `idCategoria` to the `producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unitario` to the `producto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
CREATE SEQUENCE "producto_id_seq";
ALTER TABLE "producto" ADD COLUMN     "idCategoria" BIGINT NOT NULL,
ADD COLUMN     "unitario" DOUBLE PRECISION NOT NULL,
ALTER COLUMN "id" SET DEFAULT nextval('producto_id_seq');
ALTER SEQUENCE "producto_id_seq" OWNED BY "producto"."id";

-- CreateTable
CREATE TABLE "productoDeVenta" (
    "id" BIGSERIAL NOT NULL,
    "idVenta" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categoria" (
    "id" BIGSERIAL NOT NULL,
    "nombre" VARCHAR(40),
    "idOpcionCategoria" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "opcionCategoria" (
    "id" BIGSERIAL NOT NULL,
    "nombreOpcion" VARCHAR(40) NOT NULL,
    "idOpcionValores" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "opcionValores" (
    "id" BIGSERIAL NOT NULL,
    "valor" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "venta" (
    "id" BIGSERIAL NOT NULL,
    "nombre" VARCHAR(30) NOT NULL,
    "apellido" VARCHAR(30) NOT NULL,
    "domicilio" VARCHAR(30) NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "descuento" DOUBLE PRECISION NOT NULL,
    "totalPagado" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fechaTerminaPagar" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_opcionValoresToproducto" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_opcionValoresToproducto_AB_unique" ON "_opcionValoresToproducto"("A", "B");

-- CreateIndex
CREATE INDEX "_opcionValoresToproducto_B_index" ON "_opcionValoresToproducto"("B");

-- AddForeignKey
ALTER TABLE "productoDeVenta" ADD FOREIGN KEY ("idVenta") REFERENCES "venta"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categoria" ADD FOREIGN KEY ("idOpcionCategoria") REFERENCES "opcionCategoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "opcionCategoria" ADD FOREIGN KEY ("idOpcionValores") REFERENCES "opcionValores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_opcionValoresToproducto" ADD FOREIGN KEY ("A") REFERENCES "opcionValores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_opcionValoresToproducto" ADD FOREIGN KEY ("B") REFERENCES "producto"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "producto" ADD FOREIGN KEY ("idCategoria") REFERENCES "categoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;
