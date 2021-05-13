/*
  Warnings:

  - You are about to drop the `_opcionValoresToproducto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `opcionValores` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `idProducto` to the `productoDeVenta` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_opcionValoresToproducto" DROP CONSTRAINT "_opcionValoresToproducto_A_fkey";

-- DropForeignKey
ALTER TABLE "_opcionValoresToproducto" DROP CONSTRAINT "_opcionValoresToproducto_B_fkey";

-- DropForeignKey
ALTER TABLE "opcionCategoria" DROP CONSTRAINT "opcionCategoria_idOpcionValores_fkey";

-- AlterTable
ALTER TABLE "productoDeVenta" ADD COLUMN     "idProducto" BIGINT NOT NULL;

-- DropTable
DROP TABLE "_opcionValoresToproducto";

-- DropTable
DROP TABLE "opcionValores";

-- CreateTable
CREATE TABLE "opcionCatValores" (
    "idOpcionCat" BIGINT NOT NULL,
    "idValor" BIGINT NOT NULL,
    "nombre" TEXT NOT NULL,

    PRIMARY KEY ("idOpcionCat","idValor")
);

-- CreateTable
CREATE TABLE "productoDeVentaOpciones" (
    "id" BIGSERIAL NOT NULL,
    "idProductoDeVenta" BIGINT NOT NULL,
    "idOpcionCategoria" BIGINT NOT NULL,
    "idOpcionCatValor" BIGINT NOT NULL,
    "idValor" BIGINT NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "opcionCatValores" ADD FOREIGN KEY ("idOpcionCat") REFERENCES "opcionCategoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productoDeVentaOpciones" ADD FOREIGN KEY ("idProductoDeVenta") REFERENCES "productoDeVenta"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productoDeVentaOpciones" ADD FOREIGN KEY ("idOpcionCategoria") REFERENCES "opcionCategoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productoDeVentaOpciones" ADD FOREIGN KEY ("idOpcionCatValor", "idValor") REFERENCES "opcionCatValores"("idOpcionCat", "idValor") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productoDeVenta" ADD FOREIGN KEY ("idProducto") REFERENCES "producto"("id") ON DELETE CASCADE ON UPDATE CASCADE;
