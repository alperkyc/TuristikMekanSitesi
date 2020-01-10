<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Place;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;

class Place1Type extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('category',EntityType::class,[
                'class' =>Category::class,
                'choice_label' =>'title',
            ])
            ->add('title',TextType::class,array('label' => 'Place Adı'))
            ->add('keywords')
            ->add('description')
            ->add('image',FileType::class,[
                'label' =>'Place Main Image',
                'mapped' =>false,
                'required'=>false,
                'constraints' => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => [
                            'image/*',
                        ],
                        'mimeTypesMessage' => 'Please upload a valid PDF document',
                    ])
                ],
            ])
            ->add('star',ChoiceType::class, [
                'choices'  => [
                    '1 Star' => '1',
                    '2 Star' => '2',
                    '3 Star' => '3',
                    '4 Star' => '4',
                    '5 Star' => '5',
                ],
            ])
            ->add('adress')
            ->add('phone')
            ->add('fax')
            ->add('email')
            ->add('city',ChoiceType::class, [
                'choices'  => [
                    'Ankara'=> 'Ankara',
                    'Karabük'=> 'Karabük',
                    'Istanbul' => 'Istanbul',
                    'Paris' => 'Paris',
                    'Londra' => 'Londra',
                    'Barcelona' => 'Barcelona'
                ],
            ])
            ->add('country',ChoiceType::class, [
                'choices'  => [
                    'Turkiye'=> 'Turkiye',
                    'Ispanya' => 'Ispanya',
                    'Yunanistan' => 'Yunanistan',
                    'Rusya' => 'Rusya',
                    'Fransa' => 'Fransa'
                ],
            ])
            ->add('location')
            /*->add('status',ChoiceType::class, [
                'choices'  => [
                    'True'=> 'True',
                    'False' => 'False'

                ],
            ])*/
            /*->add('created_at')
            ->add('updated_at')*/
            ->add('detail', CKEditorType::class, array(
                'config' => array(
                    'uiColor' => '#ffffff',
                    //...
                ),
            ))
            /*->add('userid')*/

        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Place::class,
        ]);
    }
}
