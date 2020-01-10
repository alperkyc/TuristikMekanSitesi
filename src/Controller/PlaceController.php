<?php

namespace App\Controller;

use App\Entity\Place;
use App\Form\Place1Type;
use App\Form\PlaceType;
use App\Repository\PlaceRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/user/places")
 */
class PlaceController extends AbstractController
{
    /**
     * @Route("/", name="user_place_index", methods={"GET"})
     */
    public function index(PlaceRepository $placeRepository): Response
    {
        $user=$this->getUser(); //get Login user data


        return $this->render('place/index.html.twig', [
            'places' => $placeRepository->findBy(['userid'=>$user->getId()]),
        ]);
    }

    /**
     * @Route("/new", name="user_place_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $place = new Place();
        $form = $this->createForm(Place1Type::class, $place);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            /** @var file $file */
            $file = $form['image']->getData();

            // this condition is needed because the 'brochure' field is not required
            // so the PDF file must be processed only when a file is uploaded
            if ($file) {
                $fileName = $this->genareteUniqueFileName() . '.'. $file->guessExtension();

                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('images_directory'),
                        $fileName

                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                // updates the 'filename' property to store the PDF file name
                // instead of its contents
                $place->setImage($fileName);
            }
            //************file end upload **********

            $user=$this->getUser(); //get Login user data
            $place->setUserid($user->getId());
            $place->setStatus('New');


            $entityManager->persist($place);
            $entityManager->flush();

            return $this->redirectToRoute('user_place_index');
        }

        return $this->render('place/new.html.twig', [
            'place' => $place,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="user_place_show", methods={"GET"})
     */
    public function show(Place $place): Response
    {
        return $this->render('place/show.html.twig', [
            'place' => $place,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="user_place_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Place $place): Response
    {
        $form = $this->createForm(Place1Type::class, $place);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /** @var file $file */
            $file = $form['image']->getData();

            // this condition is needed because the 'brochure' field is not required
            // so the PDF file must be processed only when a file is uploaded
            if ($file) {
                $fileName = $this->genareteUniqueFileName() . '.'. $file->guessExtension();

                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('images_directory'),
                        $fileName

                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                // updates the 'filename' property to store the PDF file name
                // instead of its contents
                $place->setImage($fileName);
            }
            //************file end upload **********

            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('user_place_index');
        }

        return $this->render('place/edit.html.twig', [
            'place' => $place,
            'form' => $form->createView(),
        ]);
    }

    /*
     * @return string
      */
    private function genareteUniqueFileName(){
        return md5(uniqid());
    }


    /**
     * @Route("/{id}", name="user_place_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Place $place): Response
    {
        if ($this->isCsrfTokenValid('delete'.$place->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($place);
            $entityManager->flush();
        }

        return $this->redirectToRoute('user_place_index');
    }
}
