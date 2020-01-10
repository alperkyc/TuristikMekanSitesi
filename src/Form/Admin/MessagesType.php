<?php

namespace App\Form\Admin;

use App\Entity\Admin\Messages;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MessagesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname')
            ->add('surname')
            ->add('email')
            ->add('phone')
            ->add('message')
            ->add('status',ChoiceType::class, [
                'choices'  => [
                    'Read'=> 'Read',
                    'New' => 'New',
                    'Answered' => 'Answered'

                ],
            ])
            ->add('ip')
            ->add('note')
            /*->add('created_at')
            ->add('updated_at')*/
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Messages::class,
        ]);
    }
}
