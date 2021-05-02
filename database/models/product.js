const { Sequelize } = require("..");

module.exports = (sequelize, DataTypes) => {
  
  const Product = sequelize.define(
    "Product",
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      description: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      // price:{
      // },
      Enabled: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 1,
      }
    },
    {
      tableName: "Product",
      timestamps: false,
    }
  );

  return Product;


};
