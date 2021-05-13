/*
  Warnings:

  - You are about to drop the column `idOpcionCategoria` on the `categoria` table. All the data in the column will be lost.
  - Added the required column `idCategoria` to the `opcionCategoria` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "categoria" DROP CONSTRAINT "categoria_idOpcionCategoria_fkey";

-- AlterTable
ALTER TABLE "categoria" DROP COLUMN "idOpcionCategoria";

-- AlterTable
ALTER TABLE "opcionCategoria" ADD COLUMN     "idCategoria" BIGINT NOT NULL;

-- AddForeignKey
ALTER TABLE "opcionCategoria" ADD FOREIGN KEY ("idCategoria") REFERENCES "categoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;
