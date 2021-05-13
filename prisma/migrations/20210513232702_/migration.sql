/*
  Warnings:

  - You are about to drop the column `tipoVenta` on the `productoDeVenta` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[idTipoVenta]` on the table `productoDeVenta` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idTipoVenta` to the `productoDeVenta` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "productoDeVenta" DROP COLUMN "tipoVenta",
ADD COLUMN     "idTipoVenta" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "tipoVenta" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "productoDeVenta_idTipoVenta_unique" ON "productoDeVenta"("idTipoVenta");

-- AddForeignKey
ALTER TABLE "productoDeVenta" ADD FOREIGN KEY ("idTipoVenta") REFERENCES "tipoVenta"("id") ON DELETE CASCADE ON UPDATE CASCADE;
