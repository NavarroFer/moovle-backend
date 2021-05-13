/*
  Warnings:

  - You are about to drop the column `idOpcionCategoria` on the `productoDeVentaOpciones` table. All the data in the column will be lost.
  - You are about to drop the column `idOpcionCatValor` on the `productoDeVentaOpciones` table. All the data in the column will be lost.
  - Added the required column `idOpcionCat` to the `productoDeVentaOpciones` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "productoDeVentaOpciones" DROP CONSTRAINT "productoDeVentaOpciones_idOpcionCatValor_idValor_fkey";

-- DropForeignKey
ALTER TABLE "productoDeVentaOpciones" DROP CONSTRAINT "productoDeVentaOpciones_idOpcionCategoria_fkey";

-- AlterTable
ALTER TABLE "productoDeVentaOpciones" DROP COLUMN "idOpcionCategoria",
DROP COLUMN "idOpcionCatValor",
ADD COLUMN     "idOpcionCat" BIGINT NOT NULL;

-- AddForeignKey
ALTER TABLE "productoDeVentaOpciones" ADD FOREIGN KEY ("idOpcionCat", "idValor") REFERENCES "opcionCatValores"("idOpcionCat", "idValor") ON DELETE CASCADE ON UPDATE CASCADE;
