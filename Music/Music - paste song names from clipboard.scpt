JsOsaDAS1.001.00bplist00�VscriptoR / /   P a s t e   s o n g   n a m e s   f r o m   c l i p b o a r d . 
 / /   U s a g e :   C o p y   l i s t   o f   s o n g   n a m e s   f r o m   s p r e a d s h e e t s   o r   t e x t   e d i t o r s   a n d   r u n   t h i s   s c r i p t . 
 / /       T e x t   E d i t o r s :   S o n g   n a m e s   a r e   d e l i m i t e d   b y   n e w l i n e s .   O p t i o n a l l y ,   a r t i s t   n a m e s   a f t e r   t a b   c h a r a c t e r s . 
 / /       S p r e a d s h e e t s :   W r i t e   s o n g   n a m e s   i n   e a c h   r o w s .   s e c o n d   c o l u m n s   f o r   a r t i s t   n a m e s   o p t i o n a l l y . 
 
 / /  �ep0nf�T0�0�0�0�0�0�0�0�0K0�0�0�0�0�0Y0� 
 / /  O0De� :  0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0K0�f�T0�0�0�0�0�0�0�0W0f00S0n0�0�0�0�0�0�[��L0Y0�0 
 / /      0�0�0�0�0�0�0�0�0�O0FX4T :  f�T0nS:R0�0oe9�L00�0֊S�0n_�0k0�0�0�0�0�0�T0�c[�0g0M0�0 
 / /      0�0�0�0�0�0�0�0�0nX4T :  �L0T0h0kf�T0�QeR�0 20�0�0�v�0k0�0�0�0�0�0�T0�c[�0g0M0�0 
 
 f u n c t i o n   g e t C l i p b o a r d ( )   { 
 	 a p p   =   A p p l i c a t i o n ( ' S y s t e m   E v e n t s ' ) ;     
 	 a p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ;     
 	 r e t u r n   a p p . t h e C l i p b o a r d ( ) ; 
 } 
 
 f u n c t i o n   g e t S e l e c t e d S o n g s ( )   { 
 	 a p p   =   A p p l i c a t i o n ( " M u s i c " ) ; 
 	 r e t u r n   a p p . b r o w s e r W i n d o w s [ 0 ] . s e l e c t i o n ( ) ; 
 } 
 
 f u n c t i o n   m a i n ( )   { 
 	 v a r   n a m e L i s t   =   g e t C l i p b o a r d ( ) . s p l i t ( / \ r \ n ? | \ n / g ) ; 
 	 v a r   s o n g s   =   g e t S e l e c t e d S o n g s ( ) ; 
 	 
 	 f o r   ( v a r   i   =   0 ;   i   <   M a t h . m i n ( n a m e L i s t . l e n g t h ,   s o n g s . l e n g t h ) ;   i + + )   { 
 	 	 v a r   s o n g   =   s o n g s [ i ] ; 
 	 	 v a r   n a m e s   =   n a m e L i s t [ i ] . s p l i t ( / \ t / ) ; 
 	 	 i f   ( n a m e s . l e n g t h   >   0 )   { 
 	 	 	 s o n g . n a m e   =   n a m e s [ 0 ] ; 
 	 	 } 
 	 	 i f   ( n a m e s . l e n g t h   >   1 )   { 
 	 	 	 s o n g . a r t i s t   =   n a m e s [ 1 ] ; 
 	 	 } 
 	 } 
 } 
 
 m a i n ( ) ; 
                              �jscr  ��ޭ