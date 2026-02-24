package com.abhishek.complaintbox.repository;

import com.abhishek.complaintbox.model.Complaint;
import com.abhishek.complaintbox.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

    // User-specific queries
    List<Complaint> findByUserOrderByCreatedAtDesc(User user);
    long countByUser(User user);
    long countByUserAndStatus(User user, String status);
    
    
    
    @Query("SELECT DISTINCT c FROM Complaint c LEFT JOIN FETCH c.user ORDER BY c.createdAt DESC")
    List<Complaint> findAllComplaintsDistinct();
    
    

    // Admin: all complaints
    List<Complaint> findAllByOrderByCreatedAtDesc();
    long countByStatus(String status);

    // Admin: search by user name (case-insensitive)
    @Query("SELECT c FROM Complaint c WHERE LOWER(c.user.name) LIKE LOWER(CONCAT('%', :name, '%')) ORDER BY c.createdAt DESC")
    List<Complaint> searchByUserName(@Param("name") String name);

    // Admin: search by subject (case-insensitive)
    @Query("SELECT c FROM Complaint c WHERE LOWER(c.subject) LIKE LOWER(CONCAT('%', :subject, '%')) ORDER BY c.createdAt DESC")
    List<Complaint> searchBySubject(@Param("subject") String subject);

    // Admin: search by category
    List<Complaint> findByCategoryOrderByCreatedAtDesc(String category);

    // Admin: combined search
    @Query("SELECT c FROM Complaint c WHERE " +
           "(:name IS NULL OR LOWER(c.user.name) LIKE LOWER(CONCAT('%', :name, '%'))) AND " +
           "(:subject IS NULL OR LOWER(c.subject) LIKE LOWER(CONCAT('%', :subject, '%'))) AND " +
           "(:category IS NULL OR c.category = :category) " +
           "ORDER BY c.createdAt DESC")
    List<Complaint> searchComplaints(@Param("name") String name,
                                     @Param("subject") String subject,
                                     @Param("category") String category);
}
