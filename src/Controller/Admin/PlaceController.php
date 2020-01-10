<?php

namespace App\Controller\Admin;

use App\Entity\Place;
use App\Form\PlaceType;
use App\Repository\PlaceRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/place")
 */
class PlaceController extends AbstractController
{
    /**
     * @Route("/", name="admin_place_index", methods={"GET"})
     */
    public function index(PlaceRepository $placeRepository): Response
    {
        $places=$placeRepository->getAllPlaces();
        return $this->render('admin/place/index.html.twig', [
            'places' => $places,
        ]);
    }

    /**
     * @Route("/new", name="admin_place_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $place = new Place();
        $form = $this->createForm(PlaceType::class, $place);
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
            $entityManager->persist($place);
            $entityManager->flush();

            return $this->redirectToRoute('admin_place_index');
        }

        return $this->render('admin/place/new.html.twig', [
            'place' => $place,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_place_show", methods={"GET"})
     */
    public function show(Place $place): Response
    {
        return $this->render('admin/place/show.html.twig', [
            'place' => $place,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="admin_place_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Place $place): Response
    {
        $form = $this->createForm(PlaceType::class, $place);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            //************file upload **********
            /** @var file $file */
            $file = $form['image']->getData();

            // this condition is needed because the 'brochure' field is not required
            // so the PDF file must be processed only when a file is uploaded
            if ($file) {
                $fileName = $this->genareteUniqueFileName().'.'.$file->guessExtension();

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

            return $this->redirectToRoute('admin_place_index');
        }

        return $this->render('admin/place/edit.html.twig', [
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
     * @Route("/{id}", name="admin_place_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Place $place): Response
    {
        if ($this->isCsrfTokenValid('delete'.$place->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($place);
            $entityManager->flush();
        }

        return $this->redirectToRoute('admin_place_index');
    }

}
