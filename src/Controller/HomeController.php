<?php

namespace App\Controller;

use App\Entity\Admin\Messages;
use App\Entity\Place;
use App\Form\Admin\MessagesType;
use App\Repository\Admin\CommentRepository;
use App\Repository\PlaceRepository;
use App\Repository\SettingRepository;
use App\Repository\ImageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Symfony\Component\Mailer\Bridge\Google\Smtp\GmailTransport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(SettingRepository $settingRepository, PlaceRepository $placeRepository)
    {
        $data = $settingRepository->findOneBy(['id' => 1]);
        /*findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)*/
        $slider = $placeRepository->findBy([], ['title' => 'ASC'], 5);
        $places = $placeRepository->findBy([], ['title' => 'DESC'], 4);
        $newplaces = $placeRepository->findBy([], ['id' => 'DESC'], 10);


        return $this->render('home/index.html.twig', [
            'data' => $data,
            'controller_name' => 'HomeController',
            'slider' => $slider,
            'places'=>$places,
            'newplaces'=>$newplaces,
        ]);
    }

    /**
     * @Route("/sosyalmedya", name="home_sosyalmedya")
     */
    public function sosyalmedya(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();


        return $this->render('home/header.html.twig', [
            'data' => $data,
            'controller_name' => 'HomeController',

        ]);
    }

    /**
     * @Route("/{id}", name="place_show",requirements={"id":"\d+"})
     */
    public function show(Place $place,$id,ImageRepository $imageRepository,CommentRepository $commentRepository): Response
    {
        $images = $imageRepository->findBy(['place'=> $id]);
        $comments=$commentRepository->findBy(['placeid'=> $id,'status'=>'True']);

        return $this->render('home/placeshow.html.twig', [
            'images' => $images,
            'comments' => $comments,
            'place' => $place,
        ]);
    }

    /**
     * @Route("/about", name="home_about")
     */
    public function about(SettingRepository $settingRepository)
    {
        $data = $settingRepository->findAll();


        return $this->render('home/aboutus.html.twig', [
            'data' => $data,


        ]);
    }

    /**
     * @Route("/contact", name="home_contact",methods={"GET","POST"})
     */
    public function contact(SettingRepository $settingRepository, Request $request)
    {
        $message = new Messages();
        $form = $this->createForm(MessagesType::class, $message);
        $form->handleRequest($request);

        $submittedToken = $request->request->get('token');
        $setting = $settingRepository->findAll();

        if ($form->isSubmitted()) {
            if ($this->isCsrfTokenValid('form-messeage', $submittedToken)) {
                $entityManager = $this->getDoctrine()->getManager();
                $message->setStatus('New');
                $message->setIp($_SERVER['REMOTE_ADDR']);
                $entityManager->persist($message);
                $entityManager->flush();
                $this->addFlash('success', 'Mesajınız başarıyla gönderilmiştir');
                //******************SEND MAIL*****************
                $email = (new Email())
                    ->from($setting[0]->getSmtpemail())
                    ->to($form['email']->getData())
                    ->subject('NereyeGitmeliyim.com Your Request')
                    ->html("Dear " . $form['firstname']->getData() . " <br>
                            <p>We will evaluate your requests and contact you as soon possible </p>
                            Thank You  for your messages<br>
                            =====================================
                            <br>" . $setting[0]->getCompany() . " <br>
                            Adress: " . $setting[0]->getAdress() . "<br>
                            Phone : " . $setting[0]->getPhone() . "<br>"
                    );
                $transport = new GmailTransport($setting[0]->getSmtpemail(), $setting[0]->getSmtppassword());
                $mailer = new Mailer($transport);
                $mailer->send($email);
                return $this->redirectToRoute('home_contact');
            }
        }


        $data = $settingRepository->findAll();
        return $this->render('home/contact.html.twig', [
            'data' => $data,
            'form' => $form->createView(),


        ]);
    }


}
