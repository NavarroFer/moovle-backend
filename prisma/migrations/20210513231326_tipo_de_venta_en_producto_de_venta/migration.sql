/*
  Warnings:

  - You are about to drop the column `apellido` on the `venta` table. All the data in the column will be lost.
  - Added the required column `unitarioEspecial` to the `productoDeVenta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoVenta` to the `productoDeVenta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telefono` to the `venta` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "productoDeVenta" ADD COLUMN     "unitarioEspecial" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "tipoVenta" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "venta" DROP COLUMN "apellido",
ADD COLUMN     "telefono" VARCHAR(30) NOT NULL;
