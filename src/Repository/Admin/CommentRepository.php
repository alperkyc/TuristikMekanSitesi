<?php

namespace App\Repository\Admin;

use App\Entity\Admin\Comment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\DBAL\DBALException;

/**
 * @method Comment|null find($id, $lockMode = null, $lockVersion = null)
 * @method Comment|null findOneBy(array $criteria, array $orderBy = null)
 * @method Comment[]    findAll()
 * @method Comment[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Comment::class);
    }

    // /**
    //  * @return Comment[] Returns an array of Comment objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Comment
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */



    //**********LEFT JOIN WITH SQL ************
    public function getAllComments():array
    {
        $conn=$this->getEntityManager()->getConnection();
        $sql='
            SELECT c.*,u.name,u.surname,p.title FROM comment c
            JOIN user u ON u.id = c.userid
            JOIN place p ON p.id=c.placeid
            ORDER BY c.id DESC
        ';
        try {
            $stmt = $conn->prepare($sql);
        } catch (DBALException $e) {
        }
        $stmt->execute();

        //returns an array of arrays(raw data set)
        return $stmt->fetchAll();
    }

        //****LEFT JOIN WITH DOCTRINE *******
    public function getAllCommentsUser($userid):array
    {
        $qb=$this->createQueryBuilder('c')
            ->select('c.id,c.placeid,c.rate,c.subject,c.comment,c.created_at,c.status,p.title')
            ->leftJoin('App\Entity\Place','p','WITH','p.id=c.placeid')
            ->where('c.userid = :userid')
            ->setParameter('userid',$userid)
            ->orderBy('c.id','DESC');

        $query=$qb->getQuery();
        return $query->execute();

    }
}
