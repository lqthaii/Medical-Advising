package repository;

import model.Image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageRepository {
    BaseRepository baseRepository = new BaseRepository();
    public Image getImage(int id){
        String sql = "select * from image where id=?";
        PreparedStatement preparedStatement =null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                byte[] imageData = resultSet.getBytes("Image_Data");
                String imageFileName = resultSet.getString("Image_File_Name");
                return new Image(id,imageData,imageFileName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
