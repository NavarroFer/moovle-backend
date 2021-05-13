/*
  Warnings:

  - Added the required column `comentario` to the `productoDeVenta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fechaFabricado` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fechaEntregado` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estado` to the `venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `comentario` to the `venta` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "productoDeVenta" ADD COLUMN     "comentario" VARCHAR(127) NOT NULL;

-- AlterTable
ALTER TABLE "venta" ADD COLUMN     "fechaFabricado" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "fechaEntregado" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "estado" INTEGER NOT NULL,
ADD COLUMN     "comentario" VARCHAR(255) NOT NULL;

-- CreateTable
CREATE TABLE "entrega" (
    "id" BIGSERIAL NOT NULL,
    "idVenta" BIGINT NOT NULL,
    "fechaEntrega" TIMESTAMP(3) NOT NULL,
    "horaMin" TIMESTAMP(3) NOT NULL,
    "horaMax" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "entrega" ADD FOREIGN KEY ("idVenta") REFERENCES "venta"("id") ON DELETE CASCADE ON UPDATE CASCADE;
