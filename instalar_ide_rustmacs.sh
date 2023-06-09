#!/bin/bash

# EN ESTE SCRIPT INCRUSTADO EL REPOSITORIO https://github.com/rksm/emacs-rust-config.git

# El primer argumento será el directorio donde se instalará la configuración emacs para rust
if [ -z "$1" ]
  then
    echo "El primer argumento debe ser el directorio de instalación"
    exit 1
   else
    dir_instalacion=$(readlink -f $1)
fi
echo "dir_instalacion: " $dir_instalacion

# Encontramos el fin del script y el inicio del archivo incrustado
SCRIPT_END=$( awk '
  BEGIN { err=1; }
  /^\w*___END_OF_SHELL_SCRIPT___\w*$/ { print NR+1; err=0; exit 0; }
  END { if (err==1) print "?"; }
' "$0" )

# Comprobaci�n de error
if [ "$SCRIPT_END" == '?' ]
then
   echo "Can\'t find embedded file"
   exit 1
fi

# Extracci�n del archivo incrustado en el directorio de instalacion
tail -n +$SCRIPT_END $0 >"$dir_instalacion/repo.tar.gz"

# Entramos al directorio de instalacion y descomprimimos el repo
echo "Entrando al directorio de instalación " $dir_instalacion "..."
cd $dir_instalacion
tar xf "repo.tar.gz"
rm "repo.tar.gz"

# Creamos el script lanzador de emacs
echo "Creando lanzador de emacs configurado para Rust"
echo '#!/bin/sh' > ide_rustmacs.sh
echo "emacs -q --load $(pwd)/emacs-rust-config-master/standalone.el --no-window-system" '$1' >> ide_rustmacs.sh
chmod +x ide_rustmacs.sh

# Creamos un enlace simbólico en /bin para poder invocar el script más facilmente
echo "Creando enlace simbólico en /bin"
ln -s $(pwd)/ide_rustmacs.sh /bin/ide_rustmacs  

exit 0
# Here's the end of the script followed by the embedded file
___END_OF_SHELL_SCRIPT___
� }�`d �=ks�6����W ���ZQoY;Jӎb+���k+�v�/$�k�`	ж6��������K��U�{y�]�����Ӊ0�@Hc�]˞s*$�kBRפwY�9�,����6���n������=�F�ݪ7Z�F�E��f����^�����P�9�3�6u�K��m!��o^�$��-������/�éi�Sb�|N(q�k������p�T�$��)Q����&#ŚG�&��*"�`�̤�D�V�� ���Mfԝ���k��nv�Zk6m
%��$�7lז�e;���������!hX �!�r9�X�f���&��R�����L`��yX4��U���:���(ȦP���4�NdMMӐ�pl!�`����}�yQ*J�|�(�*)b�A���K��h�X�%�9�&�QU�Ok!����������f]�C�-EY`_�Ա������ׄ�<pMB]2PS�yH�����丽����4m�Z���R��s�J�a2���,
U2�$�2���S�j�Wa����=τ�J�3�������5�ORlv��!� ��:S��r67<��_R<;�8��_����Qm�0`�.�f��^1� rF%�e$� L�9u�����1���c��܉�D���$�Qe�L�#/��
GH>�|&f��%��Jd��j��Ĳa8��ǞΤq����If0�V��N��vfOf�5[@=��g��K���97U9+�s`���|{�8Z��(Mb	3�s��GZ8j�[��5��^�����X��æ^��C0�
ƪH	i�P1�@y#�7��]+�� ��X0ap�p9��B�4�2����R�%����PzgzcgK6�Q�C;lwf��נ ��g�a�Ք	�1Ƙ9�a��A^�S��HL%ɹc�����C�@�j������,&>w���t_�d�9�!�@J��|��x�]:�E�&�aѹ�,�)G4�`;�`H�B�Y4p$qm��0Y���h"�$r�P����s�Hd�YΑ��[H���h��p�~��䒺�@k?����3���̥X�m��HI&��=��}A��n���������a�[?$�jw�B:_���s�����З(����|�Vǿ	����@��D PtJ44�p����Amp3�>�� [Qobͤ���Ը#kG%���TU�:�ĶT�J��!��k�dxQ��c��G���
z�@'�Ҟ@1�jAIx�գ�äH���"c*�"	% Q��bM��IV��1*S�ޜza�����z���;�����6l���-H?GH�����|P���=2&��`
�YLflr����|����F��;6q� jM���p*?J5B��A�?"�[� ����U�����f1$j�'q�p�@�v�E��O�϶'E+�H�?����&�������x��h�|bL
�X��b��f"h{��Qւ2,P7f�?5��1�x9�Ռ�kT��.�^ �1�3�땊�Դ]��	=���u�񿡠�(\��؁i�]Mtk.	���!P�A�TU�E�
��z��i@
\�%��
�*�^=2|�f�*9��Y�K)n���U^�R��/��`�Kf��#�{ t��_\���Ս-l�*9����"+u
ce��}.��lֽffg�	�mF��ϝ�����1u�.'��B��h�����)[
R�;7�S�f8�_��2�n0��Ŷj�s9c��iT�x���:����h����w��@^H6�)r�5^���_�8ـF����-�2�BT/)v�#��!4�J�*��$Ԯ+`�z����c{Z��M�3��-�4�U 3�@�	�����h]�8�6a�L���W�٫mh��ɅS���'�w@N���)�[���%A�����"h�a-�@�b(Lu˪�W�c�%���y_���:?�?Qd�=�O��÷�n�#�-n��H�>����#V�D��m�a>gЅ6�_t��Y�����+��@+p�)YMfTU��?�d=} -�}���?�Y�ǉ

,�5p�v�Ʋ,��^���d��j���HPxDJ�O�8[]1:�a���:a���k���0�A2��D�!V�0�aʪ(�
̕U$�pı5����4���54҆��~~iJ@.}L�`Qi"�6��z4�X��h FY��Lָ6��49��<�]�p�,�%����>	��]����*M6����ve��p��Q+��٦y����nl�MG;5~�D�.�d}j����S(W�����?J:���3�t󅃜PoK�Q���x	m&*,�"��ٔP,��s�7�͒�1Q��FE�������\)Ri�*�X��=���߭0�J�d� �����O�6�	rK}�����0|3]5���[��z�R3�d#VZ6�KJH&5�0��=�!֜D��a�%2�>d����j�w�2lmr�8z�?bVi41U� D�� ��:jm$�rxh*$�JaKA3��!k��3����4��"Ũh{����ZS�<PB&��b��l�`��ՠ/ƖQ�<B��
��I�Q��*�~�5#����X5�b�q0U�=��*j��`T�u�.h��j��+OP�6�I�뻉�\o����ڢWf�Z�):�9y�5�d�q�p�,KLJ)H�X�>����J����>�.o	�B��qJ�+�� U�!L��ڍ�D�+%������Ϧ6z1���d@!0W5e/`��z''ǯ���m��J����S{JW�UL�^/\T�(
��l5R��1�^�/�C��8Z��f�F�+f?�~8Fh� +�]�?z����Xs[���G���U��������b�?>�*�g�S�4��5��Qotr��>���������:$nh�	&ƴP�>���N�H<��2e�D� ����|��E|>f��^��:skR�pK�Qo�m���T��bD��%����,`�7�{HE2v��`�?V���_YDN�c�M)�S��
%�����dN�!t"p+R�*�����[��AĢ��C�)_����Ly�
���N2�R{�� ��?a�8(M9����F���R|��g����h���He��,R���,+CyG�sR�,�"�@���]�Qb�� o��@m1���ֆ�t�o ̾�9]y˾c�Iq5Q��N��-C)���G���b��(T��OmܨVO��T���݊�:��!�;t���ǣ�:JzY�8/ad����ِ�C��n`�>T�������c�|ƴ��[�vz�#�
�^� ÕRo}Ru���<Pn�"�2�3��Zs{���� ��+�O���;�z�sML��=9�'8��6�dx48�|�p:AcU����v����4W��Bp���f������p�?r.d�V;_��d�Ǘ΃��R��z��]�N3���xN����ۋ�)<'h��H8��}�=�<�e�h"<+��˯݌	��u�Цem�2������a����� �+/F���x�9p�0T�+��`{�G.��G��ә�9���b�z���zǘJw�����ݓO�Ua�0J�	�X`��w�@&R�������)~����;n}[�g%Ȥ���b�@o��/���~�����0�W�Le�������a=��}@��#�>�s�赻G�{����N�+@����>��$d����bY�H��ۍ5�o�s��^ ����G���_�P�$o.s�6d��9.�f.#M�7����}���^ ��W#N؝�3�v�|"�j���!��5�kT��K��X/G-@a0��	�[=!˺��L��A6���OW2�Z@���j�����aN���4�WC�;F4��B�_�w����o��`������M@6�7Ǐ��J������� M����3]�l����ݪv���?�����ؽ�T��as���=��/�F����jX�? ��@o=��z���-9}_�+�_pg�>�*
��\~[*�,�jhq(3���JcW�C=�LD[.H����ȧ����J�4�JV!��g>ޫ��~v/#U�7���덜��i��q#\��������F(�u��ǯݜ2�#���if+#U��6����9��vZ��O�������'z��i�����/��#����̱^�� PNIo�g��"��?����D˅&��A���+�;BF����dB�Le���7��V#���H���#����J�O�i	��E��I�����-���r�d���Ҭ�6��9�����+<o���4���n������^`��F<� �;i o �G�����Ph�v���?�,� ���=rЈ�|�Y4ɧ�z.ۿ$d���y�oR����?�N��w/�&�-��
oV� ���!���K�\��5rH����'��?t��ûtף������������v<��x���,�����;w�K�]��^F*�w����[�nN���4���h>�i�� ]9��6�19�����a��29h'���<�Ӂǝ�ͦ ��������n~��~ ��7F|y8� ��c����Րn����Y�������N�.u kM	P���Ǟ���r�^B��W�l��0i�Cx�t����H��n��N~�g?���_�h �! } ����+�<���G�a�����>;+*��Z�љ!�Ԫ�_����A6������H��[[�����H�����4�G,��^̏<}Ȩ�[��3��������nws�/���[(�c�ߊ�*xy��$<�����/�=}x����>(u���W������7���t��VN������G<>�������i�
9���d��:������� H��������}A��?�����H#s�v�ϖ{�B��D�?���.	QF}�c?W�<������X��s]��t����^ M�ǡ�z�G�r����z��v��o!����S���q�������I�G�Z�����ϟ}_I)9|z%��w��p��	�R�
�����Y��N���ziV~�^%y�eQG0�&z��䓪~v��S|Ҩ�����0���Q|A�:��/���7��/�ퟻ����������@��_0�����.���R����-�����+�d��vƷ?��s�/��c?�.�mw)��'�-��y D������oc�g-#��;���v7�q?�&����k���) }`v ����Ro��w�>U�x�7��_���ݠ��a���H���G�������������k��M�6�}�)��@��?�lW�2R鿽��kvr��H��G�x|���n9����˹P��M �M��������3$��RF������i���H���x��Bv���P�K�d�X��&�9���_��/ki�����W��/������~6���}O2��w�lW�)H����?������������7�������6^鯎�T��r��{������N��s������������ÿ��,��C��?YM�����?�|�o?���G�����w �ϴ+�潡_��/s���@���yv����F�������c�~�Y���T����x����H���w������]�����]���Q̵�o���iϡc��@i�u������;�����3 ap���@����u�xep͂ ��w��/�G��}����ʤX�k�"��x�ے=+A&J���mG�����ǔ�*�7��hu�9�����X>���ݏ|��7�L<��J�����V'���H��%��K����������'����}����]vkd�R����;�����@���G<������//�"إ�w�����<��o�I���	����ߝ|�/����z��C�g��}�]����K>g��������c��I��7���9��v|�_��=��QW��F�n�b./�W�*<��oCt�2R��͍��f~��~`'�?�x�����*E�����H��K� z��H�h�ewrm�й�?~<h�����j&�/����2<�]�D)�߬����V'�����mߞ�$i֛�U".�c��V��-Ȍ�l� S����b��n�Ɍ�SV!��.��|	�XR۵�)�oGL9�l��-� ��,��B~��`�\I�̉e;L���1R�S˪�Q���(���؅��	�Q���X�(ڱ�vX&W-�i �X�
2C�¿L5�Ǝ-fb�B�;8a.��vԀ��r0�ں����R<�Pv�*�v��-�.���"�Jcr�2U��l"1�-�8��dk��"�+FE������u9�o��j �娆QbF��cv��K��x W����Uy�ͬB�o�������ŀ/ɻ��_�ǃcR�_�7(��Go�ߏ`\��F���7������B�xw1��$�dx��d8������������kHwv>"'���2�,0�j8���NGo��zx2�V!o��3��d�'��������y������ �?�lφgo.�����lT�R!�~�r��r��꿇�_������b���#����x ��P��듁.
ut��V�q�����Ju�\(��v��� (���F��3l�����>+�ʋQ�����B��K�7�=v'�8W�@���������������.ǃ�	�u����կ͚r�<(��S`*S�����sR�����?0	r����?��#<C�z����h��3�n�*L���ʜB�jR���^{L}!�t��t��'�C9��m�� ��C< �  