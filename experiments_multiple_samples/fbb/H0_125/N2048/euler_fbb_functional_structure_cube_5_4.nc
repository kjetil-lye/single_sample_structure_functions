CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110727        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?�c�<�+?�`��Ո?�k��L�?��R6�R?��E��@qH���@
7�
o9�@�&a�@�+�c�@ݧLW4w@"{j{fi@&gZ]���@*��q��Z@/Y�n�9�@2/Z��U�@4�9�#�@7�j�,�W@:�&��QX@>
	�.p@@�}�Ə.@B�vG�@DrD^L}?@Fr�ԥ��@H����\@J��̙b@M'^���@Od)����@P�#�`�@R4��B�@S�Y	�i@T�k�qt�@VT�g��@W�����!@YVG�#~@Z�'$�]e@\�5�J�@^6I�@�@_�a�_@`�F.�b�@a�s���@b�ˌm�@c�d �:Y@d�S��t@e���z>�@f��ȸ�@g���1��@hˣȜ6H@i��e�@k��p;)@l/[8@m\/��@n�1fƌ@o��*���@p�*��Yz@q%O��0J@q�^;�F@rrY=S�@sA�tu@s�B��y@t{��=��@u/����@u� �yL�@v���
D&        ?U�幍��?��$��v!?���Z�5?·փ��?��N��
�?�Y|��y?�$㿊Z?������@�CS%�@�����@
��=e@ l����@&�^����@.���M�@4N)�&��@:Z�;�		@@���@E +)S@J-����@PO�G.@S`~��@W3��/�@[�S[y�@`,N��*�@b��0{�@e���`D@i)���@l�ފ�Q@pM��@rl�F+0T@t�V-x@w0�H��@y�ǿ�>�@|�C�D@�]`��@�|�qy��@�5��"��@�
�:��7@����f�@�	���@�5���C@���ْQ@���(@�;�?`�@���N6T�@���<~�@�uU�7��@��Z�@���
4�
@�U{-��@�V:	��@��0� �*@��7��@�� ��	�@��1��@� �p+��@�Flwz�@�xEv�s�@��o�i�@�0��n>@�X�(^��@���o@��@�/�(�̌        ?wX<J�!�?�C��U%�?��s@�w�?�<T �|?�йn=E?� ���^H?�=����@af&�#@�k��@2oO'�@l��t�@%��X�@-bq�p�5@3|�2��@9b]����@@B���lu@D���ە@I���[c@OZ5ǝ5@Sŧ���@V�k�>R=@[����@_��IY�@b�	g�-@e���W@h�h��4�@l0�xa�@o�L��@r���@t4���J�@v�d�b@y�a���@{�W�ڱJ@~���vg1@���?HSi@�U���<�@���e75�@��Q��-M@����A�@��k+�s�@��̼~��@����80@@���;4@�(y��@�S���_@������\@��R��@�IXP*)�@���~��@�5��BF�@�±��[�@�_}���v@�e��-�@��e�s@���_�U"@����#��@�����F&@��)�N�,@��q#0�@�������@���)��0@�J��L@�FF��        @`}�iB@E	�Q��@`�Mg&@rZ{��O(@�@R���@�鵮�X�@���Ќ9Z@��+O@�'�J~�@���O"�@���w@��PC<»@���as&@��=�P@��H�EV@�E��E��@��"�*@���b.U@«'���@ĸ\d��@��F�q`�@� �}
@@�z�2��@���5@�?��@ѓ|W���@���"|@�c����@�ߦMX�@�i,���@� a6�D�@ڥk ��@�Xa�m�@�J�/�@���j�-@��F%y�@��=:�*@���A�f�@���++�,@��YB�@��3����@�j��)u@���(@�?M�@�g���ls@떾_�,�@�̙"�߸@�	B;��@�L�`ƨ@�K����@�􎫥@�	�Ƒ@�Q5|�B�@�"
���@��\�f�@�xw\���@�7�rr�@��j�1��@���� @��O�l�@�]�V�oz@�1x|�}e@�	BЕx	        ?a�WM��?���ϧ�?��ts�#?�'ȸ#�?�����w?ݾ ?W71?�R.Z�"!?�l��E�c?��+C�?�e�G�Lc@K����@\��g�@	�l}1@��]\��@N��cw�@i>�]�H@�q���@��:�@ Z��aǨ@"����Y@%	��K�@'�E��k9@*z��Ia�@-~��N��@0Z�/��:@2z(��7@3�TŇ�@5�̲��@7��<I@9����@<,Sy��2@>���}H@@{kn#��@A���'Mv@C��\�@D|N� A�@E�b���@Gn��s��@H�Yo��2@J��Q���@LJ*�c@N�C��e@O�L'�՝@PנS��@QͅO@/�@R�qW:(@Sс��f�@T�Ԫ���@U��e�N@W�iy�y@X=�X�4@Yn4:֘@Z��75��@[��`\�@]6�u�@^��e� @_�g�w��@`�)����@aeG��@@b$��a��@b�H�z2*@c�T��8@d��D{        ?FT�	x?�5��P{?�?ai\��?�K�n�̟?ѕ����?�F�k�?�^b��X?��9Tl@ QW�pz�@خ��-@�E5&W�@�!�В@�m�:�@%Eͯ�_@+ɽu["v@1�Mk#U{@6��'OF�@<gQ!��@A9���@D�)N��1@IM-� W@M�{�w��@Qz� |@T`XQ;@W�Skm�@[̻��N@^���LL@a�S7h�@c�pҎ�C@f<&�q @h�9�E`@k�lo(Z@n���iiP@p��q��@r��)b@@t����8�@v~|:QeS@x��"|�@z���bp@}��hl@�Jwb��@�ĥkMz@�f�d�j�@��9�	�@�Q��5"@��.WH@���'\u @�=��>�@�	t��~@��*3��@��ʗ�6D@�� ��Ey@���D@����@�C��F$%@�u���4�@��|��+@������ @�Tf��B@���c �@�(q �N@��6�[��@�1r��
        ?U@����?�~�:��?��/_=?��ɽ	&?�� �o�?�� ���?�/"ל?��Iǹ�@�-��Z@�3M�؆@rD���@$���(@$K�c��!@+��e*�@2�Q�ÿH@8g�J&Yb@?���xy@D:D�(��@I�??�@@O̟k��@S�fS�D@W��~��@\�zCk@a*T��,@dQr�d�6@gۿs�@k����+@pz6�4�@r��V�#@u,\hQ�@x�݇�@{@:��Bn@~��ܞк@�4�{6m�@�6�kt�@�]ӏ8� @��ߐ[�@�$�O���@�ƭ�"Yu@��O�$-:@�E�ʾP�@���x�@�����s@�D����@�\�̭^@���7��@����C@�A��N�@�@�:ѵ@�m�<�@��žr%@��nt�#@�H>H�/�@��~�%_@�!{��i�@����D �@�6����@��ݳ��O@��� ���@�&�YL=@��	�@�ǒ���@��A��n�        ?�a���|�@]3���@6�K��&@LH4�6�@[D`���R@f�e@�@q�z��@w��t��@����ܚ@����J��@�!�IQX�@��@f�@��� ���@�R�����@�����P�@�CO�Q@��Ի��@���Z#@����!@�;��c��@�����@������@�L����3@���K�3�@�;���k�@��)���>@���x�U-@��k�w�@lx�F�@�3��^�Q@��_�7p�@��rg7@ɴ����@˱�2�@��w='�d@��:�}?@��~:n�@�4S9:A@�c[���@Ԝ#���@����K�@�+L���~@؁�g��@��Z� �@�M��G �@�í[Z�w@�DQ�8}O@��|U��@ೝ��GC@��=�@�\��A�@�:(�^@�3���@��L�5L@��EU��@�򬒔��@��4�BS@���(�*�@�
X밚@�s��@�96�?�I@�][i���@�p        ?��Lk���?�U��/�?�m��̉?ں�vRȬ?�s�I��?�K(�'1?�i*C��r@���&�@��T&�e@-BH��@�����@�6��b@K�S�t�@ ��e�L@"��Yg�@%��@�c@(�U͌3$@,!
��s�@/���l2@1�-���@3���.��@5ݮA%��@8���M�@:y�U�`@<��m�E�@?��e�@A'+����@B��C&@DG�!C;@E�I�a��@GB��2�T@H�Fb^�@J�S�8�@L��	��6@Nc�9>�t@P*��\��@Q,-�S�@R5�ԙi@SH^���@Tcp���"@U�Q����@V�#�{&�@W�
�Ǌ�@Y)+�rx@Zq��(�R@[ßҧۘ@]5��W7@^��[H@_��NQ�@`���`@ax7b�6@b>�U�H�@c
�i���@cۑU��R@d�S����@e���N�@fk|S�@gO�W��@h8�\{�>@i&uh��@j�g��@k����@l(R�w�        ?O�'�1�?�5��6��?�ʾ��?����ė?Ϧȩ��?�[;yB?������Y?�	��s*?����V�+@���.�P@����j@V�2��@ �����@%�ޏ�Y�@,z�����@2zb���@7�� @=���mQ�@B����jF@F��M^d@K�S�g6@P�%��@S�SD5�q@W��c	e�@[�C��5@`B�ef�c@bޞ@��]@e�`4��@h���p%@lt;��� @p#��;׻@r9��$�@t{')��/@v��@y�[c�W�@|^�[�)?@d,m���@�O<a�۪@��.�|@���`g��@��K �@������@�	��@�U��.��@��<tpk@�(39�e�@���b=�@��g���@�d}�K�@����["Z@���q��N@�D|�1j�@�
�1b�@�䛆9��@�ҟ��#'@��V�@��4�1@�wF1��@�-�ϫ-�@�Y��:��@��ƒ�{s@��_j:�@�!����        ?CB
�1~�?r 3h꺒?�+�n:�?��<<��?����b�?;YF��?�i�B8�?�R��-+?�ev�-�]?�u�p��W@fg��@ߺ��L@ ��D@ �ݳ�P@&��6���@-ۆX�@3m0zd�I@8�j��q�@?Sd!�=�@Cw�U�J�@G�V�K&@L����Z�@Qg�����@T�u;H�.@Xa�/i@\}����@`��8&�@cq��@e�� ���@h�����@k�*�4�@oj	��s�@q�����@s������@u��2@��@w�M���@z`�ū@|�h��@�Jw}�@�:Y��e�@��x|_@@�I�Z�,�@����h@��w�V�%@�t}���@�V#���@�LЪڠ@�X�y�L@��w�&��@�٠Q�\7@�)��@�4L���^@�s@�)��@��;O�1�@�jYLz�@�x��o�@���E�|@�e��l͊@��tp4�@���磠@����`η@�m�P�*�@�L��̨        ?�!tC�P�@+<��"��@Eކf�I@X&98��O@e�q/.�	@q=L�8"7@y-��\}*@�Xs���@��l���@�@\�@�5[��[l@�4'A���@���Q[�5@�tW��3@�\q}K�S@�6�SG�@�IHd �@�������@�m�svM@�o�6Y�5@�p-��@��iލ��@��AQw	w@�3t��@�����ml@�^�c�!!@��87��@���@�M��0@ű :�9�@�_"c�f�@���@��` ��@�����.�@�Ӡ�:�K@�pp���q@р�cI�@қ��K�@��a*ra@��%h@�)�L�|�@�nM��%@ؾ-�@�c��F�@ۀ(Ke�@��b!t@�q.�w@���BH]�@��bӵQ@��±Y@�s��T@�Qz~E;q@�6H���<@�!�ҝ.�@�b����@��Y���@�
��}^�@����@����@�-���^�@�F1J���@�eQ�	@�U!>�        ?b����c�?�o�r2ZK?�Y܉m��?��rW�26?�w����?်�5�?�Q��0?�4"s?�M�ǣ�?�YG*�t/@�h�($@367�|@<V�\]@g_��G@v�h��B@�~�=@o�5�s@@\�5��@!˩�}g�@$X[���@&�݅�b�@)<s*�@+�۱1�r@.ݑ��m@1�8	�@2�Fl�RC@4}(V��@6b�T�{@8d	QU�@:�wVa�d@<��z�}L@?��d�@@�Rg�@B��ř@Cr0�S@D޳�MC@F[�RN@G���5@I��D��D@K4��@L�	��b@N�1f!8@PR�>�X�@QL5�!��@RN�E_�$@SZ���@Tp���-�@U�Ǩ�`�@V����S�@W����j@Y3�c�;@Z�q	y��@[���rc�@]?�~k�@^��[�{@`V&�G@`����@a���4��@b�&��X�@c]��t�@dA�
@e+Ѷ�0@f@�[        ?GB;?�$�?�l��]�"?����e?�ЭH?�Zڿ��>?ڌ!H~��?�
k�g8?�@= ?�?���Se@��(px@C���@7�*H@�	��w@!��
c�E@'�#m�@-�.mK�@3���E�@8�0q�@=�?Y*Ny@BF}����@F#�P�]_@J��f��?@O���gF�@R��d3�@U�>%ԫ@Y��[M�@\�{@:�@`��S�@b��Br��@eK{��Y@g�����D@j�!�ʪF@n@-��@p�^�@B@r},9!�-@ti`����@vu�h�m�@x�$+ �@z�*��L/@}c��e�@��}o@�Wኆ��@���F�@�FF�Ծ�@��G�~+*@�0�ˢ�@�8H�K��@����%@��#XZS-@��vXp�~@�qqU�@��i���@���1��R@��R'�y\@��M�*@�#Ƕ]I@�g��=T@��j۹@���0%�@�wtGY�P@�����@�f�m�6@�����        ?C�eP?�B?v���t=�?�
넡�?�ٵ:�H?��O䨱?Ѽ�*�4?�7���d?���k�|�?��^�j١@�g�r@{�I@=��s�@���o��@$9v��X�@+�oߔ�[@2l�>f�@8(���mf@?'E�7@�@Cȟ��@H�Ƕ7�@N�؃�o&@R������@V�M8=�x@[7$��7@`+�cGR@cW7t�)@fK�(��p@i���@m�WM��@q%e�Vm�@s��oZr@v1z�g6[@yf<�@|)�����@�?zu7�@��'��@��?�
�@�����*@��`3�s@�%Cį�@��f1�s�@�P�B��@�rGk(�@��=��Q@�"b����@��j&���@���s��@�a?4f�4@�O�b�D@�Tߵ-
@�s�C�t@��c�jr@��S��<@�2k��@�t���]�@��� ��@� ڍ�A�@��W��Z@��3
��@���F
E�@�g�z�C@��<H<��@�9Mu�bp        ?�+�;@�x��@5GI5qݬ@J���@YA��2�@d���@n�й�1@u�)ќ�@|�,�3D�@���CwJD@�K�14M�@���`��@�,6�PV�@�^��W�@�ޜ ��@��<!!@���=	c�@�(qe��@��i��@�3~�U�@���ƿa@��Xŵ�@�)�$D�@�� `Y@�ʄ��^
@���l��6@��?<�0@�8�7;�@��8ӌ@�1wX�4�@�����?�@�]P&�@�ڄ�R��@�jiC1�@��dE15@���.�M@ʉ�� ||@�dπ"2@�Q��=�J@�)��@�2���D@�F���l7@�dʖ��@ԋ�	§@ս��vs@��	��[�@�?���F"@ِ�l�!�@��B�1{�@�T�~�@�ǿ�0W�@�FC���[@�hNk�;@@�3�(�@�٣��@��$�^@��w��@䡄�K�k@�[�82/@悏�o�/@�~RLny@�Կ��@�G��D        ?���ޥ��?���9�?���E�<�?厨�U�.?�'X'Y?�a�H�@��ǃҾ@��d�@[���I�@���W�@G�����@"Q�x*2t@%�ˬ�.�@)��,%�@-�HD�@0���H�@3L�z��@5�G�@8_��uȧ@;%T��Q@>�h=�@@��=�@B@E[��v@C��.�b�@E֨x��@Gǵby�<@I�y�d�T@K�1i:4@N5�Ȕ2	@PGvs���@Q���G@RǓ��r�@T4�	�`@U{��~�I@V���a@Xdj	��@Y�B�up�@[�5�\t�@]#[X�&@^���C�@`G�Y��P@a-3;/�@b���g�@c3��2�@dkz�@ey����@f��-i�@g)��,(]@hE��C�@@ij�g��@j�Kv}Y@k͒���@m�{��E@nU�̊;=@o���|!�@p�mgЎf@q3�:
tR@q������@r��[
E�@sg(�h��@t,Xm�qt@t�'pbF+@uĆ3�h8        ?r"WT�?��(�7�7?ĠJ���M?�N�Kc�?�q���?�{���@ �&�|H@���@�:�@��.*�k@!ӯ�b/@&����գ@.O=:�.b@3�N��X�@9b
"��@@3��@D1z�r$�@I�7B�@N����g�@R�..���@Vk][�tZ@Z�7��@_��@���@b�m㶋<@e��Z(@i$�m�P@l�3B���@p�5�>l�@r�4���@uX��\��@x@*r@{��$�@~RJ0�� @��phG4�@���&�ۊ@��㼔�@���X��@�Zi6�@��cJ��@��Nl�@����p�@�2d-�#@��KA�Z�@��q���@�R�H�ܕ@�=07>
�@�C�R�׉@�f���a�@�����@��r�[�@�C�+�M[@��a1XZ@��}-��@�eC�~@�篚2��@�|r�@�"�q�g8@�ی�93 @��`����@�C6�Ԯ�@�<�F��}@�?� �a�@�MHf5|        ?�P�ݎc�?��$|�T�?�R����?��8Կh�?�����@ nh�s�#@�Wh���@����(@s�焫@�ONZ�@":�Dk1�@&��
��@,f^�ۖ@1qB���@5<u �j�@9�6���,@>��Z��-@BI�:c6�@E��$�A�@Ie;Im_@M���Ȼ�@Q6Sp���@Sߛ�9@Vә
.K&@Zx���@]�Ri"`@`̔�f�@b�g?�K�@eCjb�@g�=�4�X@j}c�l^�@mgD���.@pC�z{�@q��팳@s�$�#�@u����v�@w�b���L@y�/͆@@{��5��@~F�)�@�^apf�@����@���k��@�kŌ/,�@���c@�k�`rj�@��ek�@��K��Q�@�_el�we@�%Ns$V.@��@^:@��)�*�@��!|y@���Q�@��b��y�@��rX}/@�/����@�W|
�@���8.�@��t�ƅ.@�g�c�a@�W��ڏ@�����        @X�����@E;�k��@a�Y����@tL2���@�7xt]@�rz0��@��[���{@��=R�@�6Kt7��@����,@�=au4�A@�Md��@�%C�!]x@��r%���@�'����@�B+]�{@��y+�@ý�T���@�
�%̕]@�w�o�~�@�Iᇢ�@͹�&�'@�H����)@�ƻю	@�W�i��@�������@ִ���)@؀�]x8�@�`�� U�@�T���8T@�]$8� @�<��r�l@�T��<�O@�wVY�@���!��@��y���e@�li�(w@�f��1��@���-?�@���+q�@��
�@�d/e@��g@�	�Tµ�@�׌��`�@�z�|�@��iX�@�f\��%E@�M��re�@�;I+���@�/�9��u@�+W��~T@�-���a@�7�T�l@�Ij򴦓@�b���N?@�����*~@��\s��@�ܿUDӹA 
UD���A ��E�k�AMC���A�_���        ?�Q����?��_^��?�TY��R`?����� ?�5= )�?��E�2�@��m;�@
���@4jm?/@�,���T@f����@ ��;��@$ٶ
,�@'ߋn�ax@,`�\+�@0Imt��@2����i�@5���@8t�� k@;��,�-�@?�02�@Al�%s0�@Cm��4>@E��2`��@G��q�u'@JZ!��`@L�L�u��@O��[`@Qc��_@R��8D��@T�O���@Vo�0���@XP���CN@ZLSDq�@\c��N��@^��!٧�@`t��iOx@a��D��"@b��x�@dL\\��@e��N���@g-�xa�n@h�e���@jRT�;߳@k��Y�)[@m�r�9��@o�H2+>@p�A��E @q�Ү�C@r�#k��F@sď�0��@t�v&Q��@v"'�U[@w/�]�;�@xi��+i@y���P7@z�\V��|@|[R�|@}#���@4�$�e�@�Y.~Ɔ@�\�m�Z@�����+�        ?�l�)q?�d1�?ه_����?��pY�1?�|���G@
���3�@��?�@�3�k&@%�OY��y@-�s��Fh@3�!*�#�@9�WM�5f@@O�ٹ�@Dw����l@IR��ܮ�@N�V��f@R��C��@VX ʒ�@Zx�  L@_���@b� ��@d��L�Vw@h��N�1@k��	J@@o\,Z��@q�PF69T@s����Tn@vf'���=@y��>z@{�"kXa�@~ޯ�v�@�*ߋ�@���Cj4|@��ݹW��@���W�Lj@��!E�@��8��@�x#���x@��Ky�@�]r��@��į�@�M�l1�(@��0&���@��}���@�V9�h!C@�10I�&�@�$>�	@�0KE��@��%,�49@�ˠR�M�@��(y7�@�7R.�8R@���%@�߸�a-�@�K�ݻ�@���^EO�@�V�|�~h@���t<��@��h׽n@�4���¢@�����@���(C@�|s�^�        ?C��͒�?|V4	�q.?�[��?�Ó�kҌ?��� @:�?܍���I?�z6;#�?��A�
S(@��}bug@�a<X��@h�]�+ @�u� ��@%bn3���@-O����@3=��l
@9+���n@@��Ha@D*�z��@I�� �@N��/2!�@R�ȼ�m@V���.o@Zٌ_��@_�I�!�@b��V��+@e�p��@i>q�3u�@m�p��@p����@s����@u����@xn��g�@{��yڟ@@~�?Nn@�:�D�@�.�����@�H���d@��tk�h@�����o�@�����/�@�N ��@�Sdǹ@����A��@�X�~�@��B�@��)�k��@��w|}@�	 �ȩK@�=�
�/�@�H���-@��SJ�$@�δ{u@�+�6�#@��-Ӛ�@�4}P�R@����*�@�\�&�@���u�@��m���@���#B8�@��j|�@����*��@����i�        @/�=�m@<�b5}a�@Zn�v��@oKL�j@@}J8��qO@�о���@���XD9@��%���@�U����*@��r���@�'�]�@�����@�5t]�<i@��@�?�@���΋ǵ@�����@��Ď?�k@�RV��VY@������@��&gCO[@��Us�@�>�����@�5���H@���M�r@����}]�@�*�Y3D@�w�\�&�@�珐��@�{��4@��'v}@⋒,"�@�Hp�|�@�����@�YC�O��@�R�`@���!I@��O	}1�@�G�|�@��Β�@�k@Õ@��]}�e@�(�
@�u)r�F@�������@�;�ſ�@����.�@�?�����@�����@��I�W�A  �	�A�I�`lA�6��A�E7��A�_B0��A �k:��A���W�A6NN
l�A_� ��^A	���A
�
a�XMA�� 7Ag#�D�dA�:�N�        ?����߲?��L�V?�Q�G�Os?�8�G
�?�;�ơmO@���7@5��F�@�D_o8$@��L�Ly@!DhY<@%'����#@)��
w�z@.~wB��@1���ԇ@4�л�\@7�r1mp�@;2���@>�F��m@A+7�SX�@C' �Z��@EB����@G�f���f@I�?[a',@L��+�ȧ@OP<����@Q$g��5@R������@Tc��ˎ@V(V�X��@X{6b1>@Y�±@��@\��P�-@^5I�T�@`<�N�g�@ak[�a�@b�;���@c���@eD�E>��@f��!�Y@h^�n��@i���*�@k�3��@l����.@n5�Z�f@o�M�@p�^?�^�@q���4z@r�΄휩@s��H�g�@ty�_�q@uw��{V@v}�v��@w�����@x�� =eR@y�u%֭@zՖ+�&v@{�0�$D�@},y+��@~bO`ql�@��r��@�r�ܢk?@�!C���@��yF�^        ?���T�g�?�~�@�#�?���c�?��5Ě�o@&0����@s�h���@#<�^���@,T|׆�@3�,_�#�@;qG��@A�`4�.U@G���5@MX��R�O@RW�:�&@V�Vq8�q@[��u[�&@`���@#@c��cl�k@gR��"��@kQ���ˤ@o�-�t�@rU�c��g@u
I����@xw<h��@{B��U#@~��c�@�S~�z`@�i�"�}@����O�@���#��@��r���@��:"��@�DP?��@��,q%R@��p`�@�f�rUe@�VI��V�@�f Pbƚ@��kI8�@����īN@�?�����@��:���6@�sƝ�@���f@�D�Rx�@����`7@��+rpFg@����K7�@��xk�/@��yY}A@�?���h�@�x�7��@��ȇq�	@�)?V�@�wiT8 �@����)@�gu �@��`�\G�@���,,�@�14Y&�@��o�-
@�ϼyZ�@���a9        ?�T��[�?��G=#?ֿwV�?�ߢ 3��?��w�Ը@uC��@�IHby�@����@!�ɜ�Ն@)C�� 
�@1uP�m@7�7��Z@?�7�i��@D��q@F@J�e�QP@P�@w�M�@U]�&+�@ZRb�@_���5V�@c,/���@f�O9E@j��ո�E@n�MI}"#@q�3{J��@t 
D1"@wPk)�v�@zW�8G@}�qZ���@��䒊b�@�Z��{�/@�LL����@�Z7�]M?@��ޅI��@����<�,@�2���#�@��h*�RS@�-�ɰ�@��bWS0�@�֮�@��ꄏe@� fs��Z@��/"/C�@��D���@�^���@�I�#�W�@�&Zk��@�4ag�@�O��]��@�y �@����@���r��K@�P� �~@��AO/5�@�5�\Bz�@��Mi!@�f�0��@����@�u��B�i@�g��=�@�eQY�f�@�ow;�T�@�����@������        @"C/
Y�	@Q�ǫa[�@n߉��D@��>��@����=�F@���I�k@����,�@�/a���@��ث��@�Kp�P,@����Jk@�y��5�@����e@ȸ�T<V@�տ����@Уnl��@��,R�@Ք�*B
�@�N�"�K�@�5]>eu~@�J��?@��i�et@��qFa@�^�t52b@�S߆��@�e�G��@���T �@��2,���@�KT���@��8��~@�<�[�6@�A�Xd@��j`ע@�����@�!��zmE@��q��D@�m��v@�(�p���@���A bZ�췄AR/v�eAG�җ��AB$�s%fAA�]�#AG	Ed9AQl$o[aAaC7+�Au펣��A	��?6�A
��.AqA�SjH�%A��n�A+��y��A_�:㋙AL�n��A�"���A��Q�:�A3�s���A�-�<B�A��]ޚ�A5��ײQA�,��A����        ?l\1A�?�o�=�?���Z��??�l��F�Q?���9~��?�� ��f*?��i��?�7���k�@ �{<҂@����@	ɮ�̗U@�d��ь@ ��~�@ю��p�@�m�F��@v��z��@":F�x\T@$�>*��@'�=�Ą@+'G�jL@.�A��7(@10k%?@32#F�b@5V��(eQ@7�Kǩ��@:	&x�@<�|/$�@?I�n�@A��2}�@B�)���@D�9&3�@E�2���@Gry�z|@I8[>��@K�vsNj@L�x#!�@N�,ɭ�?@P����@Q���@R�y�8!�@S�#K�e@T��I��`@VEQ`��@WQ�t
��@X�w0B�@Y���@[7Q�-�@\�)� .�@^�
Q�@_���W@`��M��@aN<��ѭ@bJj�ˍ@b�6��9�@c�^VTK@@d�X�~@e�¯X7l@f��� �`@g���a�V@h��ڮJ@i�z��؇@j�>
�#y@k�.�CX        ?=���A�h?u����?�NK�\PM?���Qos?�\���|�?Ӭ�HH�@?�F1�~
�?�U����?�`�$�@�>G~�A@M��p*@��QGΊ@ 0�\�@&{$� �@.��u�@4Hj�3�l@:wB�'�H@@���?�@Eq"�0SV@J�2�h@Pj.~;I�@S�qX҂�@W��3�@\�l���@`Љ����@c��Xf�@fΎi��@jD�kܬN@n1�# R@qUӡx\@sOqK�U�@u�ɂ�՛@xI-��?@{
bt��@}�&-S�	@����s`@�4)���H@��$��@���j���@��Kj@���>Y�@����@�0�q8�@�F��f@��M.
l@��d�N-_@�!�f�x@�����J@����˯@�},�\�@�Lp|2�@��B�>��@�]'�M�@�
�Q%�@�s�j�d@�a�1#�k@�W�0��W@�T�w�n
@�YDB@@�e�^��@�y~L=3T@��)�6@��o*IV        ?Q���-��?�/�{�?����[�?��b��b?��v��o3?�(�0�4?���a%�?�$�
��@ g�����@	��Z�s�@`��T��@W�F)��@$#�҅�Q@+�U[��@2�F̞�(@8���XJ@@>kouUD@D�d�C'@JHK�z�@P3����@SٟB#܊@X
��h��@\�R���@aZ��~@d!U���@ga7�;@k8Ѽ@�7@oQ��o��@q�ˌԜ@tW��+�=@v��ov��@y��s��{@|�=p��X@�Ĉ���@�ݘA�8@��\��I@���#a�@���Z4�@��dU|@�{���)@��tΈ�@�Фv�'�@�3���@��PQ��@�03�fp>@�ɛ���@�u�e�
�@�4@0q� @����`@��2���@��'u�@���}�5@�a 
v�@�z���@�BN��O@�nݑn}@��&��<�@��*�t�@�.�5��|@��gFͼ�@�ߪ,KB�@�F���*�@����Fv9        ?�ˣ��@0�
�G�@K꘧]��@_PmU_��@l+'�]�@u�E�㋞@��h�ݹ@�v��T�@���\�h@���c
�@�Ґ�葱@�n���o@��a9�
o@���%e�E@��.����@�$Q^ؤ@��a�qsc@�p-{��@���TbAS@�����w�@�d~�s@�����@����M�@��l�WC@�pa����@�OY�y@���^/@ƞ)�Y�@ȅ�� ��@ʄ���B'@̝?:x�@��xɐ�@Ў.VZ�H@��)�M��@���O[@�R�Bd�%@կ W��@���S{@ؐ)y�H`@��U?��@ۧ.��G@�G<�J��@��d`u��@�Y+��mT@�?�LG/@�.t��Q�@�&E��@�'V�+@�1�G�:�@�F7b�?,@�d�oW�k@�!c@y@��Q��@��c>�@�G��kj�@�=�F<
@��l�!��@�4&����@���dM�@��I�6�@�y���O @�G�\j�@�f���r        ?����*U?��z��!�?��)�@�?�^�2k�?��~��@sFA���@�z�Ȝ�@���fG%@��l�K@9��x@ �J�(-x@$@�J��@( ��j@,_�q�(�@0�u�ow�@3zy�!@5Ʉ�G�@8��@��#@;��0�B@?T	�T�@Az��؊@Ch�s��|@Et�Y?�B@G�i�h$@I�x!��@LQT~�b@N��q�@P��c��@R$��ɮ@S�-�A*�@U����@V��d^�@XX���@Z�	�\4@[�1B0�@]��!Vz�@_�p��@`�ԏ�@a���C�@b������@c��7�]@d�@4W��@f!��m@gNFGR�@h��XT�4@i��Ld/�@k��-�@lT�>\�@m��R�U�@o�����@p;���@p�v�`�%@q����w@rv��΍@s>��7j@t�o�@t�p'�V@u����һ@v�a�c��@wl��{�@xQ%�x�@@y:����@z'�}S�a        ?q_Ԭ]�?��i��?©FQ�s!?���G�M6?�M��@= ?�ä�}�?��j}:�N@ݳ�/@�K݌;]@1o�0�@H���?@!�إ��@'\Z����@.'f;�u@3CM-�L�@8_���@>�����@B�o1�|p@G_�%��@L�LB5P?@QK��Kx@T��3��@Xӡ��Ԩ@]nĄ��@aU�%a@dI�c�*@g���O:@kNM?F��@olIM�x@q�C��Җ@t��F�@wAZ v@zDtI��@}�UG�X@����i�]@�~���JQ@����w�@��x$��h@�B��RwF@��'m�W�@���lx��@���Ǒm@�e7�@�c�<��@���<Օp@��=�Fh@�̇��@���7�@�/�;�L@�G{g���@���2mJ@�����@�9���sd@��dj�1@�0�i���@�ǖ_=�@�p�T�׶@�,Չ��}@��*E,�@����>@���~�Z�@����'b~@� L��         ?e������?����n[�?�X�@Ɩ-?�`F���?�E��q?��14��?�q���\?�:���?�3Y���3@j.0d��@����@���wwz@����_@#�?�W\@*[ו�@0����@5�Sˊ�@;0`�Tڕ@@�GB\$@D�?��i@IV��%�@N��$G��@R;�'hۓ@U��L�}&@Y]	�Zp@]��\YI'@a"9�x�@c�l��F@f�(8��@i��azX�@m�c�39@pg�o�5=@riPM�iL@t�q��@v釽��`@yk ���a@|u����@~��C�@�Na!bz@��K�fU#@�`M�j�@�6u~�O@�'�gt@�5S���@�`Z=�(@��n��g�@�����@�̙tJw@� �vn/@��דA�@�� �]*@��)����@�m��&w@��i~6d�@����V�W@�_t��1�@�#�v&��@�"�N�D@�*�ł�@�>R�E5H@�\ɬQ�x@��j�8��@��n�D        @��v�@G��ArI@b���s��@tAw��@��]�(�@���� \@��،�z�@���}��@����tU@�7sՙ6�@�k�Pj�:@��q���'@��{E��@@�U��~�:@�0�wǕ@�d�-�ck@��uY1P�@�r����@��>�3�@���O�T#@���L:�@�&�Z��@�� eo}@��
�@��@��aL�ik@��-L��@� 
lf�@�~x�/�A@�6�L��@��l��B�@�E�D��@�Ɗ�֑@�\��lz�@�	H�ۅ@�̘�Z	�@�C8�F@��[V�@����@�d?�\�p@��Z^V�@�:���#@����9��@�,�'J��@��$@������@�OѢ4@@����- b@�X�ρC@���Һ��@����>�A �ss�7�A�.AZ Au5��PAf�.KuA_I�YA^�VAP�Ae��	r&At;���A���,[�A	��W�<�A
�~_�gA��à�A'��BG�        ?l��}�?����]?�{��a��?��@8��A?�GN����?�s�N�y;?�.S孹�?��K���?�?++u��@��Td\�@��,��@30��bN@�I�@UP�4qp@߫!@��fʞt@ k@�L�y@"��3�{@%��%c�@'����@*I�Y�@�@-.��G�@0!)���@1����i@3}ϕ�r�@5R���
@7BS���@9M�j%,@;u�7�,�@=��s��@@z|d%@AO����@B�a6�+�@C��H�$�@En
niz�@F��/��Z@H~��ag@J�?�Z�@K�y�Ӈ�@M��ՉO�@OrԴ��@P��W8�@Q��6��L@R��oƛh@S����@T�J���@V�u��@WXw@X� ���@Y�tD���@[IQn��@\� �$N@^)����@_����P4@`���S]@aoD���@bEK��+�@c"f܉\�@dYS��d@d�\��s@e�a�y@f��
��<@g��%{y        ?[� \�?���癗?������#?�@+�H�z?܆�N?�K�t��?��s���/@a-u��@
������@�&�Z@v��ǹ�@$����@+���b�@2徛>�{@94 �IE�@@�pry\&@EY�SA@K-�T�{O@Q���@U/�� �G@Y�v�'"@_�^��@b��WP1m@f�A\X @j��ʔS�@oRq���@r;Q�mt@u>�z��@x:��M�f@{��gT@u<�v�@�ȁǏ��@���ƗG@�j7�*�@� ��"�@�ǥ���@���)dv@��j�l�@������@�nf�;(�@�R�
R|@�R�4v��@�n����@���-� (@��X�K�{@���Q��d@�����K@�Ul�̌�@�����*�@�1yh]@���8��@�L�(8��@���G?�@��j���q@�p�5�F�@�$��߬@�����$@���w�@�Gyh=�@�..6<@�G]6���@�i��no@��6�w�/        ?[*�bՎ-?�!��V!?�gC�y?��@�u?�FK�1�?�9����?�}=�/�?����*@ �,y��@	��U��<@����@*'U�A@@#�
�Y�@*&z��~@1�#9�Z�@7 ���[�@=�^��9�@C����n@G�[��B�@M�nu�g�@R�}�@U�ゃ�V@Z�Q}j@^�zq�D�@b-i �ҥ@e-���O@@h}?���@l�ld@p
*�O@r/�[u��@t�#$�h�@v������@y�V���@|���F�@�U5/e9@�\�6�(@��J�@��ţaq@������{@���<$�R@���0 '�@����]�@��J��+@��1??(�@��QfD@�ԁי@�i��-�V@��<I�@� O��Q@��$�G�@��s;�@����8"t@��P��@��O&o��@�1�����@�;+K�u@��8�|@�����D@���U @��僺��@����v�[@���N�@��h��;�        ?�Ew�%@$`͸υS@C�@ �@V�YR��@e��ͫNp@q���Bx@y��R�V�@���%�@��#O.q@�oԸ�kM@��Ʉ^>�@� .]=@���uԨ�@�XQ`�@�<��@��7�)@�1�U��@������@�"�!��@�!�.WY@�.�< ~\@�h3>�,�@����z�@�E��s	{@�붱-�@�\>�ҕ@���͝D@�d	Xh]�@���5�l@ƾqPALA@ȋ�W���@�nw*�h@�g�k0�@�x\��@�P$�%�X@�p��2@ҝї��@��O����@� z�s�C@�v��u�@��hkQ�J@�N�x�@��xA�I@�cs��K�@�Ԭ@߶�s��@�ER0Z@�q*Ưo@�L��@�/����@�,�@��L��f@����@@�����G@���ڸ�D@�+˕m��@�f�ſ2�@�S���@���h�ܶ@�RATyy�@�Z=Ϭ��@�=cy�N@��9� �        ?i:l��~?���J�4?�H.X��B?� 7qH?ۘ4z��Z?��ϣ��?�1���l?�Wśy}�?�~v��@v@ӱR9u@j�XPӰ@��ܸc�@��@2���@�2;=�S@M:�4�@UC�+@!چ���e@$9,��׮@&�����R@)���h�@,��s`��@/���@1���wd@3�+ˆ��@5�n .�K@7�TV��@9�\��yE@<[��y+@>��-�G�@@����2o@BN3��z8@C�e+�@E{�',@G3��ag@I�x@�@J�O��@L�2��c%@O	92�W=@P��[�n@Q�Ү�<@R���!s1@T>R�.i�@U�J>,d*@V��86�@XV�c���@Y϶PÊy@[V@���v@\���`�@^��o��@`��7R�@`���i�@a�L�T@b�����@c�����@d��r��@e���Zx@f�L�	?@g�bj���@h����@i� ��w�@k�{�M�@lEsE��"        ?7q�Y��?p��>՞?��6�,!?�w�ˡ�?���FN?�ͳC��?��!�٬?�!ú��?�Z���@ ���"�@	���Y�@�KW�b�@���ŏ@"�J4��@)+��g��@0����@5���@;g��ۣ@A.���@E>��V�@I�V^��@OYH^�tk@R�j�e�@V7�V���@Z?K*7@^v����@a�i�>�
@dP3�F~?@g? �f�@ju�%�/@m���F�@p�kJ|�@r�<��*u@u/�ڸ�@w���#�@z-���S�@|���Y@�;w��@��+�6�D@�;L��8@�ԈV$3@�A��@��H6n-@���q��@�V��@��@��ў,}�@�s싱"@�k��y�@���.� �@�?a���@��E\�@�W��	��@������@����cR�@����a@�f���K@��x�ȸ�@��z�tM@����f��@��B�Zl@��g9-B@�)MEq�@�b%;��T        ?n�Vgx��?��ާ((?����S��?�r�(��?�`?�?�!���J?�!�Va @SP��@����@C�|��@=f귒M@!�t{�o@'��ő�@-���>�w@2�#~J��@7�P�z��@=��j=@BAѽ���@F4*�ж�@J�xU;	"@O�%����@R�O��k�@V4���t@Y��m�f�@^M�~@aK,9�@c�G��|!@f��˹�P@i���&�@l幩�V�@p>#�o@r0=P��@tJ�[��@v�z�\�d@y ���b@{��#�3@~o[-��	@��DPՁ�@�R��Ve@�����@���/�@��}9�/@�Ѡ�ͱ?@��>�:�@�D?��b(@�V��S֙@��	 �٪@��_dw�!@�ZE>L�@��8�7�2@�`�[7��@� B��z�@��T��1�@�ziEݴ�@�U����@�#;��@�&+�3c@�4"_��@�L��X�@�qFS�%Y@��XS�@��_���'@�#y�spl        ?�T��p@'��V�]@EK��9x�@Y	��I�@gOR�gn�@r�)3�9'@{����@�/.���@�Y�1cY@�1�47@�(={JP@��i���+@�z�|��m@�o�NM�@�e=�z�@��v�jc�@�%E���^@���^*�@��=],}@��F�ږ�@�8��O@��l���~@��>S҄�@���r��@���l��@¬���@Ąt|�H@�yD�rZ@ȍ�!�2�@��|�9�@��P]+O@ϑb���B@��6Ф�@�v?6/��@��'Ӭ��@�l��HΤ@�3(��@د^4��;@�n��
��@�Bf~_@�*���X@�`�,�@�Wx��@�15�t�M@�O���d<@�y��2@�K��5�@��db�@�9���,@�%��@���q�5@�b�]��@����)@�b�����@�y��w��@�H,�S��@��FJ��@��]n>X8@��Xr���@���b�@�@��M�\�=@��i���f@��\����        ?cL@�H��?�ȅ�N��?��r��?���cS(\?��Q��?��A0� ?磯�x�?�a
?��?��*Ka�?��%�c@a�#�A�@@�(?d@	��vJf�@E�=%3@�]bn(@��[f�@�����@7K��@�\�`GP@!]�?Ћw@#����d@%ւo��'@(UMU��@+ާ��@-� ���@0xͼz+}@2b�	�@3�]NȲP@5�㘚�	@7�W��@9��R
�@;��hexI@>Q]�<��@@e,�F��@A���Uo�@CM/��@D��4m9�@F��wh@G����N@I7�T�`�@J����@L���g�I@N��T�Y?@P@�Χ�q@QB2 �]�@RMoE�W@Sb�=�@T��>@U��N��@V߽7)�@X��4@Yf�5=�]@Z��j���@\pN�W@]J����@^�b,vz�@`6̅��z@`��ɒܕ@a��ܫ*@b���@c`� ~��@d7��HPy@eD��7        ??�NȎ�?y���}?�v��N�G?�C���?ǵ����?�5�<��?���&W?���]�?�#4�6�@�j7�E�@*�z��z@W�z���@ a��d�@&iu�ы�@-���׶@3�Ԃ>�S@9-�=�`3@?���FQ�@C�J� '}@H=��v�@M](�Mx@Q�er	��@Tޘci,-@X� Z�Lh@\��+�W�@`�H�q?@c��)"@e�&�|�-@h�@>9N@l��+�@o��P�:*@q�o+��@s�m�k�@v%��wL�@x���R�@{;�OtC6@~�Z�a@��*pF@�+[����@��I�V�@�����
@���M�V�@��Taty�@�N�]@�X��\�z@�i�I�@��b�U$�@����î@���G@c@�`X�!d@��T�@3�@�Yo-���@�0����@����_@�ᡚ�gk@�r����@���A+W@��G$��@����쮇@���б@�(��_��@�q��Y�@��μO�        ?V���(	?�6�s�~�?�Y&e<w�?�cqUH��?�^h�Yb?�
�h$3�?�F�� /?���8#O?��4ɸ4�@dڼf,�@,
��K0@��)$@!��l��@'2O��*@.�$a w�@3��T��.@9�-N�@@r�u�:@C�M])�@HGn�/Z@ML	o�'@Qzr��"j@T����o�@X'��@�@\��6@`#��=a@bu�:��|@d�zR!�@g��B�@j�P�'Vg@m���S�@p�ؾY�@ru<K+W@tjG�(U�@v�2���e@x�1*���@{o�E7�@}�HoU�@�#���B�@��f�L�@�	lv͉
@���$�P@�Aұ�A�@����v�8@���^
��@���1?:@���V��@��Gi�v@���bq��@��K�@�N��?<@��EzU�)@�Ҫ�_(@�'���J�@��b�k @���$ �@�v�ܛd�@� cP���@��6Y5K0@�w��=*@���a��@��'�
@�����<�        ?��՜w/F@��.n@8[��s	[@L���}@Z��ks�@e��%¡@p;��v��@v���FnP@~]Ǩ�@�?�o]8[@��Y��@�_�rn�2@����Yw�@���5��"@��:W�qS@���ι��@�rD�퀝@��B�#�@�|��=�@�\,�3�7@�|=n�@����~�@�C�m�U@�<�g��@�[0��Ѩ@���	`r[@�����@���`��@�n��|@�1����O@�����~*@�o��O|�@�5��a̢@��[*@��8+@�/ _o�c@�g��Q�@�^i�t/$@ј�]�kk@��Uv
�)@�<"R�r�@զmx�\@�!���0|@خ7�*�@�Lq@cWI@�����4�@ݿ	+���@ߓט��Z@པs���@ẃn��6@����ɠ�@��.����@���Q��@�
�G#� @�6�*_@�j�~F?@�5��6@���;�@�?	��1@�-}2��@��{&�K�@�2�!���@��Yy��        ?~m�4��?�w]suF?�8J��B?��^�
?�;���J�?�����@e$�w�f@	d���a@ª.>�@c��|Ķ@��y���@ +�+֦�@#VkNm�8@&�Ak��@*�U�2Uc@.�� 5��@1x|��?k@3�	�i�@6F��
Y�@8辅�ݡ@;���u~2@>� K&@@�����@B�ܑA�@D=K�{�H@F��IA@G��($@I���nG�@L�>s�k@NWG��k�@PX����@Q���]s@R��_�H,@T9���ˮ@U��fjh@W0l@X�� ��@Z7�3~�J@[�`Th@]�%Ue(y@_S ��Z�@`�����@a��mg@b|<&�A@c|��g�@d��(��@e���UK@f��'5�b@g����[@h��dmI�@j+}��@ke�>�`�@l�F����@m�
e�@oF<O=�@pP��AW2@qx.ʘ"@q�dS��@rr|��c�@s0�p�f=@s�7?>@�@t��E!}@u�}ܮ�        ?q��D43*?�G�9��?�Z�|Td�?�^[��?����pt?��9��,e@!^D��y@�3��p�@P|��F@ ��;�c�@'8�A�@.�CL_+@4_rd�!@:e�����@@�e6�,�@E.���_%@JI��Y�@Pr�k��@S�K�'�@Wf>Q�D$@[ňf��@`TnT�R�@c
��5��@f��Z@iL���@l�d����@pZ&o�Z#@rk��*�d@t�^v%	@w �Eۼa@y���.6I@|-��@~�͎�@��1���@����b�%@�-���@��(*�@��#�"@���H���@��D���]@���x��q@��H��4L@��V�D@�<f��N@�y�Y��@����Д@��2���@��<9g)@��Fs�k@��+T�"/@�^�oa�@��M��٪@��a���@����%y�@���t�-�@���77;�@���E@��O�^ȵ@��j�;�@��/M�@����/�@�$9��,@�_YD��v        ?fJX)�?�pr�~L?� gP[ B?�*��BVx?�s�*5?��b�c�?����h�@��u`�@
sJ��&@J�@j��@|f��@#'�C-G!@*&T.SB@1����W@6��y~�@=��UN��@B��3n�@G�/E�s0@M�>�@Q��-Y�{@U6�ī��@Y;�P_b@]�,zF�q@aZ���Z#@d� &vk@g�KD�-@jluHp4�@n��i�@p�ά�@sJ���@uR�A<ir@w��^���@zZU��@} ��z��@�
��,��@��O_�3�@�Fh��"W@�	�HJ3X@��L�Q�@��~�l\@��Ρ��H@��I��/@�h�U��@��^�`w@�+hv{&@�}��|.�@������@�R*"���@���
�6@�h`'u@�4��D�@��Κգ�@�����@�49�7��@�+����@�-�\��O@�9���1�@�P|�4��@�r�P'W�@���U`@�ـ�T�`@�ACM޳@�q�\��'        @�p��@9K� ��@W6P,ʹ�@kk�@fq@y��]�r'@��E�7�@�@����Q@��(4�ͼ@���I�L9@��H�e��@��I�z
�@���I�	@����~%�@���8�%�@�Цb�n�@�&y`��F@��#��7?@�J�+Rl�@�W�����@ą�d�GY@��Ȁ��@�F����@��CJ�@Γr醡@и�ۃt�@�:�':�U@��9<��'@�}:�.J�@�?����@�J��[@�
�I���@�-n���@�6p���@��%Hz�@��F8�`�@���b"2@�^���c�@導���@�jR�/x@�{���Q@�� <8��@�|�$Q�@�jaW@{@�A�Kl@�0�ͽ�@�YN'@���79U`@��O��{�@��ӥi@��[����@��챞iD@�ٓ��9:@��aR%�N@� qM8Ք@��4�|�@�D�w��@�r�6��`@���#�p@��+?�ٵA ���I�A �(��_�Ae�6A�A�?hJ�        ?z���J?���ˮ��?�)��G�?�EDw/�??�A�EW�?����\e(?�}��9@�Uڄ�|@
�8o�G@�9+@,�\���@�����k@���@!��]�x2@$椀0tm@(	g��@+f�aΎ@.������@1jYTh��@3r��\��@5��ǭX�@7�,�0�@:C}�ߝ9@<ǝ%B�M@?l��1�'@A>�a�@B��a�pI@Dv��]@E�t�i@Ga	x��	@I#�6]�{@J�㥤��@L���O�@N�bO���@P��$	@Q�`��L[@R�af��@S�{��&@U��N@VfP�0+�@W��&�@YLLv�K@Z���U�@\�YP�Z@]�����@_'v�9f�@`g��.<$@aC��o�@b&v�:f@c�3(�@d�[�k�@e $-vĳ@fX���@g�w�R�@h!���%V@i=i%��@jab�Ĳ�@k�k%�@l��@�@n��F�@oIl��H@pL�G��@p������        ?=uyi���?s�O�z�?�E�_hj}?�0`A�?ŤJ�0�1?�Κ1C�q?�r�T?��b�p@n��4L�@�=R��@��zkF@ ���#��@'�@�Dc@0"���QA@5�՟��@<^���@A�fQ o@Fzk�	��@K�$�6&�@P���@TZ����@X:��M�@\�Z�v�q@`��\�@�@cS[V�1�@f:h*$�@ie���@l�f��AJ@pF��R@rGZ�a]�@tm���?@v�IOa2�@y.5�N�@{�>öI@~�J�:\>@��)ww^�@�L/��-@��G|JF8@��	%��`@�zJ9�@�c'k�T@�d�b��@��.?Mx@����E��@�!i>�Y@�9U�ذ�@�}�]cL:@����&@�3Rxp��@���i�H@�&~�p�@���ӱ@�Z+�蹊@�	g�@�����@��;�~��@���b��@��y����@��K���@��o��'@���'��@�:Nh�@�?$�z�        ?qjY�(?�7�Jh�?�fwb�9?�ǡK��?���A��?�V#�Q�?� �l2Z@�o�K�@_����J@��	�@�[=�-Z@%W���R`@-�o>�v@3w�v��@9�}P#U�@@�:����@E`��Uj@K��j�@Pު�{��@T����_@Yc��ZT�@^��n��@bSF�{�L@e��/1j�@i��AhrV@m��4�1@q/u����@s��fb��@v� ^�I@y�{�i��@|�&jRY�@�%i��{ @��K��B@�f��q@�"*�(Q@�`�-���@���¾|#@�?���@���U@�P�,�@�­���F@�E��N@�ٱ��T4@��B�)@�7?��q�@�6 �y@�ݵ��"�@���&rW@�g�I�@�@�r��!i@��	l���@��a@�V@��-��z�@���B�]@�E��[@���q9[9@��Ղyw@�GE��s@��v+�t<@�-�Jx@����%N0@�� �P�@�r�>�q�        @2Q��n�@6:3�+�@S���P�@eT��8)�@s��k@}�I��@����dA@���ѵ��@�R^��%�@�~h�vA�@�H�\�o@�X�����@���/��@���*'@��Ÿ�zO@�!���L@���A�
�@�ĵ�S9@��i�k�l@���ț�@���Ɩ@��cblu�@°-4^��@�}�����@�d�^V�@�ctYV�@�|�L1�5@̯����@��"n�'@г�B��t@��ڟ�f|@�HSCG�@ԧ�VQ��@���>E@ו��X�@�#�Dq�@��#�i �@�o�͔�@�0O���@�U^#T@��v��k@��"��Z@���w��@��hw�@� �2�l@�F_�lw@�wm9��X@��R�@����\]@�Qt�(�@챇�L�B@��g]@���@����R8�@�V.�X�@�$��f��@��أ�yi@��c�#m@������o@���B�t@��w~��=@��4�=��@���l���        ?���V�[�?�c��|[%?��Pl�@�T�q@C?e�=�@�u�pC@$�V؈u�@+�����@1�ۆI�N@5��ej��@:�rER@?�ɼT}�@B�f�d@E�MaF�@Iy���8@LuY��Y+@P
ƾ�#p@Q�t�d�@S��y�v@V��ץ@X>�䟍�@Z�ٵ�- @\�fN��@_]�="$6@`� ]�qD@bI�Ї�@c�r0}d6@e>�3� @f�%�88
@h��S[�@i�a�
@k$~Y9��@l *s@nj>Y�@pD����@p��֣�b@qʖN���@r�tHN@s�W��J�@t�.QV��@uu�#�v@vj��i`�@wc�F/2@x_^|��@y_��7~�@zc��3C@{k��)�@|w�c�@}�j�$��@~�\��V@�{KEjY@�g�v��@��Y>��@����&@� 敫@��x��@�Qf9z@���=�;<@��Ց��@�.K�߃O@��;���l@�x� Aȷ@�!�"oA�        ?����z(?�d1��?��VX�t@!���7@�hPI̜@#�B�Ū@+d3���@2��� ,�@8�;r�M@@+�H(�E@D�%��y�@IŐ�J��@O�"	-�@S�?s�B�@Wу��0@\���׫@a8>DG��@d}�Nb�@h9��ϑ�@lv�^�#@p��%�o@sKe�ry�@vE>jd�@y��˦:3@}.E��@��e/�#
@��pv	P�@�	��\@�����ep@�1z�g��@���]@�,�q��@��jo}ů@�;���}@���=H@��%���!@���2�>@����"@�t��/2Q@�v&�n�)@�A'�Tn@�Lϛ��@�[x�u{v@�nˋY�@�����b�@��!���K@����z�Z@�ސ"=�@�l�@�)?t_@�R�c���@�m�.E@����ZH�@���c'��@�	�5@��g���R@�E����"@��8e3�s@��K�j�@�/G� Q@�؊Ґ�\@��wĿ:@�6vU�Ź        ?s�^�8?���j:t?��W�X�s?�kTg�5�?��
��?���	���@=�<�@����@&���@>q��Gw@#jh�)NV@**q���@1S���2�@6��&	�@=���D]@Bd�(;3W@G��z�U@LxS��Y@Qh+��s@U����@Y;�_�@]�)8H��@a�W�B��@d�K�nQ@g�~����@ks��>W�@oe�8�@q�#(�Y�@t1�[և@v�+���l@yt���@|c��@�&�9�G@�p�P�2O@�92=ah�@�}�+@��£i_@�:x��i@�s�l4�@����{�@�!���@�f5�R�@����y@�!�A©I@��)���r@�k���@���9�@�M���
@��8�6�@��y�(d@����m@����U�@��v�s�,@����V��@��
k�-@����E@��T.���@�)����@�7�$%<�@�kh�@��ֺC�@����a3p@�:M�	_        @R��@�4�@z��Փv�@�er�?�@�0��i)�@�6����@����78@����-�@��ǖ��A@ʼ��w�e@НP� o@�-���Z�@��1*��@�@��{@�`nww,�@�ǎiR�@�U�L��@�
7�~@��L[Yd�@��s�y�@���-�ҫ@�-2���@��h���@��q��@��b���@��^���@�������@��OׯǤ@�ͫ���+A��5�A0�.g?7Ad�v�.WA�2=��A�E���A9�A(c'A��[qA	�B6�#
A`Q�A@A�fj��FAO {@	A����aA��Jߙ�Ay�l��AG��tA�JFA	g�AɍX{:A��N|�_A����Ao��5?AZ�(՛7AI���rA=�p��aA6c���tA438۰�A7B��A?�$���AM͎&�A 0��	IA �ne]��A!L�OM�vA!�-�wo!A"t8AQ�KA#�[�        ?���,�2X?��!�f��?���%�6?��6& �z?�/��Ar|?�p2���@Ao�@�A�V��@Y9���@q��'�@.�v@!��S�x@%L_C%ߎ@)$��]�t@-R؁]�@0��.��_@3Xۨ�D@5�թa��@8��x�@;�M�L{�@>�;���@A�?�w{@B�y��lJ@Dč2k�q@F�1dl=�@H��;b'�@K�@`@MV6*I*@O���xn8@Q# e�p@Rt�@�/�@SՅٞ@UF�LPw@V��a��P@XX��τ@Y����k@[�$2�Z�@]x�jx@_P�mz��@`���.i�@a��B��@b����@c�\H1)@dʴ��A@e�v'��@gx���V@hG��-9@i���QZ�@j��T�v�@lu�+�@mi'b$@n����x�@pՋ�)X@p�Ifg��@q�B\�VZ@rN�����@s�CU@s���@t�n�#Q@uOɄ	@vUX��?@w/�l��@x@2��3        ?S3��?���>ȃ�?��X ���?�m:zwR?��n�-@��*�@n�dM@�����@!+�m8��@&�~7(�@. ��/p�@3tb?��@8���\T�@?Pb����@C��o��@H@���}@M�	&�FA@R*�I@U��qf@Zd5]0y/@_v}ݰ�i@b����B@e�
)�[�@i�����@m���2m�@q(UR��@s� e�k @v����@y��-R�@|���ʠ�@�J�=�L�@�F����@�l��I�@���n�@�=oFiu@�똌<m@�ˁ�4�@��[:�Uc@���F�Cx@�S_�T/@�/���$�@�)�?s�@�BBYכ�@�zh�oe@��-rp�@�����ȃ@��K�)�@�U���G@��C�E4@�M�!���@��m?�:�@�����k@�S�a��@�(չ@�&@�';$'�@��q��\�@��0��5@���>���@������ @��%�@@�.�T�Jz@�q���o@���t�+        ?��~0�?��e���?�/\��?�N*K�@��5�,@�W����@[bg�Z@ ����U@&�`h$d@.�b7.�@4qlޡ�@:�`�;�.@Ap����@Fa��(T�@Ld�Lh��@Qη���@V�6�r@['a/q@`te�n@cȪ�oo@g�/ٖ6�@k�=��#@pNI�(@r��M�e@u�KZڹ@y&��K'@|�MҚu~@�L.�ҧ�@�i�ݢB@��C����@�0��P��@��g�(�?@���#�	M@��-� @���=>��@�R��/8=@�2��:m�@�0ԩ�6�@�ND�d@��ц�E@��qOF�@�5�6�|	@��q�u +@��f!��@�a��b�T@����%-�@��J���l@�;'{Or@�௕a�@���^��n@����g��@�l/*�%�@�{�f�U�@��#com@��d�ӽq@���k��@�1�����@�~T,t��@���D)c�@�>�b{�P@���Fv�@�5#�g>@��7C�N�        @!�B�c>�@J-�s2��@d�.V��>@v�2My g@��;_�Y�@�r?��@�X:��C@���m-ސ@��T�t�o@��o���x@�1�f+@��Ө��@��(���@��i�)@�LLknY�@�̷j�@��t2\�.@�'���@͚U@Щ:� w@ҩE����@�����@���<�@ّ��"�i@�1� s"�@����T@��XoBI@⌰C��@�5��o��@����@��|)�4@�k��o�@��iQ��@��4��@�5�=@�3�ќ�@�gC�Z6@���>�@��)�o��@�ML$�@��#�Ke�@�%�]�c@��a)�@�1ⷰ^E@��N9��Y@�q����A �Uk�!wAr;����AXv�EAE��A7�`���A1y�a�A0�.7.�A6�ݵAA��F)$A	SAb�o�A
j�0��A�����2A�s��A� Q{�RA�\���A�cqA�M�{�        ?���G�_?��c_=E?�{�ɡ��?ݰ�xڑk?���1?�T�/���?�=B�\��@䋦��T@	�`fq��@v+��h@[�WK^@�WYM��@�<G��@!a3*�<@$>�[/c5@'Z��h@*��_�2@.O���0@1Đz�@3$�-�B@5T��Z�S@7�m�m�P@:Ӧ':b@<�4��t@?fM��^@A��BN@B��K��X@D-�k�l@E��6�@G��H�@IE�9�D�@K��/d�@MJΥs>@OGy��@P����@Q�U�}��@R���<j[@S��(`�F@U͡��@V=���3�@W��nN@X���>@Z"��@[��ޏy@\�VLX@^h���"�@_�����@`��`��@a��~@b`\��@c:�|5;�@d<�t�@eDz&�`@e�d'b@f�~��@g�0K.ا@h�.)rU�@i��S��@kFهЬ@l)�Ss�@mN�%(+H@n|F
2�@o��B�4I        ?Bۈ֠�?zt�����?�˂G�?��YIv�s?ȏ���?�j(m�"h?��gV?�8P�X+�@�E�/:@��,��~@:��V�@�����@%���� �@.1v�7@4@ ���@:�䖞�l@A����@E�!��L@J�'=1�@P�?��@T*�n�D�@X<�%��@\���N�@aA=J��@c��˃@g��?�@j�w�C�@n� �{�@qfY�R@s�+As�@v?8��T�@x��Sל�@{�"H���@f/���@�Bo(/.1@�m!h�!@�
ݮ9X@� �0(6@�Z���@�����s@�:�)fP@�r�OC��@�܎q���@�[��h�P@��v�W@@���}7�g@�`��%�@�<�O�@�2{<ht@�BSR�#�@�6�U���@�Y�I��@���M~3>@��5���#@��4�fV@�{}F��&@��#� ��@�kf���@����q@�����j@�TF@Uz�@���V�T@���88;        ?hrO�DH?�k���[L?�ɶ�4?�ܓ���	?���K�?��(�LN�?�6-�'�S?�<K��%E@����@O�{l��@�D�1i@#���}@*XrY�l@1��Z�}@7C뼇M_@=���)�@B�B�3�Z@G���[�@M{K@Q����)@U00�h��@Y4�uɳ@]�����@ac<w��@d2�(��@gOe�Z4m@j��(=LB@n��w��@qP2#C�@s�i"��@u�p/i��@x�����@{t2j6@~~�rk��@�ߖ�^�=@��y��@�sqA\}�@�g�3U߻@�y�Mh�\@���>��@���@���@�c��Vʉ@��bG���@�OD�6�I@��xf��@�0:C��@���.�$S@�W���.(@���}:N@��nӐ�Z@���� A@����@�ī�>��@��Bx|�@��j^A\�@�[�|(O@�+R!~d�@�`����@��?[�z�@���l��r@�F?]@���S�@��t���        @]���:@2�Ь�@N�Op�@`%��Z�@lB���T@u��"k��@c\k�Ȋ@�Jc]��@�����@����o��@����ٮ�@�F�6��`@�\DB��@�x#(�|�@����5@�϶w:l@�_����@�Iݝ_X@�'GO���@�WI9��)@���){5�@�!pwD�@@�������@�z]��m�@��[���J@�1�n�|@���9��@�n��o�@�(�iV�@��%��@��*�V@!@���Ή�@���)�.�@�q����@чU�4#@ҧ%����@��$���9@������@�D���k@׎]�� @��U��os@�C�����@ۯ���F[@�("@�e@ެ���L0@�/��e@��5�5�@��͆g@�-G<@㆘'|3@�r��?S�@�f;���U@�a�v(PF@�eTI���@�q)��t\@�r�:<@�c��
2@��4j{O�@�� ���@�/h��F�@�qL�f�@�^�ݗ��@�	u�U�        ?p��᫴�?��\٬?�,�iR?�O}�?�$�ܣ��?�Rd<58?�=ۿ�X?��	1!��@ )*T��@@i� }@	'2�II @eݑk�@>_�ۂ@3L~*(�@��U
�@:�c��@ VkX�@"$)��@$X|�l@&�[����@)"�)X��@+�B.�@.n~���@0����
@2nJ���@3�T�[_8@5Mn�"@6�RT*_�@8�{�C��@:�,�q��@<�翮�@>�Qr��@@P����@Af�#.�@B�YG�,~@C���qe@D��c%�&@F),|Q�	@Gu�Q�u0@H��n�r@J1����@K��Cv��@M0��ב@N���!J@P��,��@P��0B@Qö��-@R��#�0�@S�=^(C�@Tn�� �@U^t�npi@VUCH芏@WR���@XV{`�-@Ya	k�?�@Zr\��M�@[����$@\��Lz�@]�o" @^�R��a�@`�/�q�@`�KR��1@aZ�1޷�        ?w��Z���?�,7~��?�	�w4�Z?ٚ*V�j?� ��b��?��?;Vh�?���'w�@��>�%@�G�/@K�Y��3@f9M�x@$b�q�@*�V�:@1��z!6!@6���{�@<��$"@Aݚ[�3@F�����@J�ڭ��@PD2�a�d@Sn�o�@V��s�
�@Z��t�D)@_I�~x#+@b[���@d�֖���@gu~�:i@j����;�@m���^�@p�>pB	9@r�3KS��@t�2��-�@v�<�ֻ@x�h;�@{U�jv<@}��;@�I��6�A@����F�@�7� ���@��&X1�@�zp��r@�=��@�G;�Q0@�UbmR�@�|�ǥ�@��j�v�@�>�h) @�l�,<@�����z�@����YN@�K�X�E�@��$�R�@�)�j���@��GF�x�@�F]���@����{@���\���@������@�����d=@��cX��@���`g��@�����վ@��m|�?�        ?@�k �?pQK2\?���h�H�?����x�?�����w�?�"�<0?��Kse��?㜡���?�Ü?��Di�1@�� tV@5=�ݖM@��]���@�ˋs"@%��B�/@,��?���@2�;��8@7��142@>n�CI�@B�S9S�@F�tꦊ�@K:Ϸ$�@P,��%v@Sʼ&	@V!|b��n@Y���T=@]@����@`�@@b̟I���@e!e3)@g���.�^@jMA�+�@m(%���;@p����@q���=�B@spVh�@uB� .@w1?�!q@y<(��@{d�3�}�@}�Y��k�@���z@�L,�9N�@��M���:@��*��@�}����@��~�L�@���?�L@�T*33�@��ȡY@���͔!@����I@�����L�@���]C@���vI"@�F�W��@�z�}��@����hN�@�Ѓ���@�k^�D�@����>��@�V*u~�\@�㋗���        @ "*�W2�@1�Vo윪@N��=�@`�e/|�V@m��S��3@w�=���@���O3rY@�P�%���@��j��@�"���@�4�e̯@���U�0�@��9˾$�@�]ιA�@�,i�C�@�,a�^�V@�]�U���@���E]��@�*���P�@�O�4�\@�F��}@�!�/p�M@�Rn�O6@��G���@����+@�A�L�@��}�W9@��v�q��@�YC���f@��O0�Z@�^�%K܇@���qZ�t@ʤ�o�)�@�_�<�`@�,C��X�@��Rw�L@��*w�@��Lɞ�@�QF��/@�T��M�@�2r Qb@�V���{e@ׄt�i�n@ػ����@��Nwa��@�F����I@ܚ��L2	@�����@�aU����@�i�-���@�(F�[�@���2H�@ⴳ�Q^g@��nl�@�VC^�@�/yQz�@�n��@��[G7�@����@��@��ePz�@鿰�w�@���p@�,��        ?��;� �a?Ō��g�?��@��?񱝖5�^?���^�.@�gN@�_(߽
@ de�oj@�=�'N@"��²��@'V���l@,.����@0��G�@3�x�n�?@6��_��@9�)����@=lrD$k�@@���_~@B��[�@D���H&h@F�"aq@IUv�Ц@Ktu�\T@M���T"B@PIj [G�@Q����*@S��d@T��$To�@VJώ}�@W�ѧ̅\@YG	xV[@Z�͋<o@\������@^~]qϢ@`*���J@a�{�@b�����@c�|֭�@d�+�E@e%w�C�@f7�چ;@gPS�;_0@ho�5�&�@i����({@j£��Tf@k�`��@m0��x�@nrO?�TI@o�V~�S	@p�s�XG@q.�]4B�@q܍�M��@r�B|�@sA�^o@s�Ÿ��o@t��ę)�@un8���@v-�Hu�F@v��]p��@w�<,�e@x~�l���@yJ����@z��O>�        ?[T��/��?�
 m_��?�I{Zu5?��B�x��?���+)�X?�@@���<?�� &d{?��! @u���[@��,q��@�1k��@�(!���@&}2��0�@/VZ���@5\�v�@<���п@B����+�@H2�y7�@Nȟ�?��@SP�6��@W���w�@]Wzp@ @a�ϟz�7@e_�=su@is�C�@n�t�y3@q�"O�G@t�qI�@w��᝕@{P�� �I@?z��ry@�ȨB�}@�%��D�m@��̫�_@������@��&���@��5�(	]@��Z�޲s@��?��"{@��/��}�@�܁�_�6@�5|�u�@��N$� @�`���@�ڞ��O@��m�P�@�.Ӎo�@���~�@��p�f�q@�rX�Z�@�`�%@�f`�K��@���:ꃕ@��
VH�@� @�a!A@�1�2e0@�md�̀@��]d�T@���@�h'7�2@���y�8J@�IR� �@��<��y        ?c�6:,�?�>R$�:?��=
{�?����c!�?μ���<??��3^mK|?�F{�;?�n�%	[�?�z� �M@, �U �@���O�@X��y�f@��@��@ Fؕ��@%�މ�¡@,}<��W�@2g��G.X@7p/�7�@=sMx;�@BE}J%"X@Fiy�׳@K2�R�.@PW6�=^�@St��l�r@V��<���@Z�3�`�@_H4SMUs@bF6B��@d���Q�@g�(��'�@j�ѳ+]�@nIOko8@qu]��4@s<>%[@u-��ܘ@w|�
֖@y�e���g@|���aw�@YG��o@�$�.��@��0��'f@�T��E�0@���a@��Z�/��@��/*�_@��gi(��@��S�0o�@��F���I@�I;��@@�C�[��a@�{FZ���@������@���0@�k��]�L@���	�@�K�r�@��9H���@�`�"�R@������V@�VlD���@�4?F� @�l��@��N        @Ի��_@F�Q���@aΩ���@r�.����@�R{NB�X@��@�8@��#�/@����E@�:�O�@��采��@���4��@��-��.@��A�	�@�ȼb�@����~�@��S�U%�@�TI�6@�t9����@�X/'��@�VE��B@�n�n_�@ȡ����@�︪�Eg@�X���5�@�ܵ"��@�>�G�@қqȷ��@���� �@�c�ԆD@���o@ؚ�_	l@�;�ܢ!`@��LX�Q@ݨr W@�s^(H��@��D�@�o��@��`�@�2`�@䝞)"a�@���R�@��б[@������!@�a����@�0��D��@�c_��b@��D�*@�݊x�}�@�% �<Ѻ@�9�Ly8�@����@�k�@�D� "$@���̘��@���>�@�lQ���>@�*��;�@�������@���YF@�zNi�&�@�Eስ�^@���tp@��-�N�        ?�q���?�tL��Q?�
磓�S?���S��?��\	�)?�@h��_@ ���}��@���?@�����@���.L@ěD��@���2�@ �Z��i@#pKav3.@&�����@*��-�@-�0��@0�P�Aq@3
�1�-@5a�J��@7�9J�!�@:�`�JH@=�(#��@@M@
���@A�h>@C��ϧ?�@E���8��@G��@�]�@I����@K�REk�@N(���@P=���C@Qx��|�@Rψh���@T-�L8�@U�UbR"%@W�g�@X�~���^@Z3�d��`@[ר�K�Q@]���SP<@_F��Z�@`��o���@at��J}�@bf�{p#@c_6����@d^�}ӈ@eca�;0�@foE�p�@g��P�Za@h�>s5��@i���is@j�.�2H@ln�$@mHt���m@n�m�t ;@o�E���@p�ŝ�yH@q7p~@q�B �@r��ָs@sO�$��P@t
�y�\�        ?f寅jS?�3�T��?� �����?�h�I��?�g+��u?��5s<H�?���)�E�@�7�g��@��GQ$@iU�]H@��f���@$�ǀ�c@+�	-@2��V<S@7@J�/x@=g�ɂ��@BW��]�B@F��dAP@K��́Q@P�N��8E@SѲ��>e@Ww��k @[�7���@`+m@b�4u(�@e~}|�3@h�+#y@l���2`@o�}de@rq$4��@tT����@v�_D�tL@y�ޒ�!@|uQ[2��@���W�t@��٦��@�c$bt]�@�aG4�a`@��5�D@�Яn��@�E�(�6@���f\-d@���$lh@�Xa���@��г���@���y~�@�mD�d`)@�UWץc�@�Z\P�-�@�}[0��#@��]^'OC@��R��@�R=�qܒ@���q}B"@�� � @�~{�L�d@�n���@����U&8@�N�:h@�;��B@��
�o�@�d��:%@�`�c4�-        ?n�Ůڱ�?�W���#?�l���/?�^%�^L?����&?�!kʎ?�;�T+��@�&s�Ki@.����@�s� /@!�a'�/@(ȧ�W5<@0ۦ�p@6{���ؚ@=p-_fO@B��I��J@H(���@N�	�=@R�$]�@V���VY@[/(?�h@`8�%]��@c/SI*�?@f�|�~ @j/8x^x@nBE,��@q^�^���@s�т �@v�&�F��@yh3-PQ�@|�]PL��@񣔅	f@��n3/,�@��YA6��@��S��X@��U1@�j,�L�@��R#�D�@��15m�@�,�x�� @���XZ@�/���
@�Β%�<�@��2��E@�G�� '@�#���B@��0��w@�`flv@��}b��@���th�@���:#_@���u@�6��"2@�y���#@����:@�!]�K��@��3���S@���hN|�@�r�M꿣@���U��@�G]dě�@�y�U��@���uLM        @0�=@@dLk�-�@Z��q|q@mݽ��@y����M�@�;t��#@�&ئL2@���^�gE@�ܢ\ I�@�ZC�튻@�0��O��@�vO1��@�0؊N��@�3�n�i @�CS�_@�4�����@����~�@�`�6�@�9xƴ�C@�pr��0@��m+tX�@�p���X@�>1&V�a@�BI�KԠ@п�Y�:>@�{5,��@�Uji�o@�M�r��@�f6�+��@ڟ+�o2@��6�~%-@�u~2��@�	�Z0]_@�j&���@��2���@�_�Rs��@��f�k`@蜤�g�(@�U�6��@� !�4�@��#&�p@��xq* @��H�Wg@���q(�@����S�@�&����@�H$w���@�r쓳��@��rZe�@��m�A@�'�GF��@�u�q��@��F�.F@�,!�6r@����Խ:A ���X
AA��_9�A~�y^RA�}ձ�&A��d��?Alj�%�AD���4A"���]�        ?v���90T?��:p�̫?�E���l�?�f��J��?�����?�cb�a��?�ҟ����@ns��f�@C��W5�@�~S2 ^@9x<��@l����@6��`�@ ���	-�@#k�+&��@&|�$���@)ЇԹ��@-h��W�G@0�/8��@2�͢���@4�bl@7I�H>�@9�J��U@<w��o�@?J�L�.,@A#$7��@B��B���@D]Ai�@FISg7�@G����&@I���+Y@KԺ�B@M��	@_o@P
�T(�@Q,~�f�@RX�ۉ~T@S����z�@T�C��{M@V'3zPe@W��`��)@X�m_N�>@Zd��~�	@[�4	�@]x1�S$@_�ɑi�@`_<��w�@a:b��M@b�T:�@c̄`S@c�TP�@d�0'�!@e�f�t�@f�t�i_{@g�;/@h�F�|f@j
e��zy@k#�Zn �@lB�m��@mg��z�z@n���L@o��N���@p|��׸�@qa4�k        ?n��Ax�?�r7ǉ
?�$���?�[�	 �F?��7��?�@0i+�@����E @
H�9CWS@�>�%�5@�aD��@"LsDFn�@(���a��@0g4E��@5t{�ݏ�@;��^��@A�V}C@F{F���@Kb}����@P�`]��Z@TX��@Xj�6�'@]sS$�b@al9O�@c�fM���@g&�����@j�9�uJ@nx��0��@qP�N}��@s�lH�?@u��ՄG@x�`���@{g�l$�@~e�ɉ@��z�΃�@�|iDA�t@�I�I��@�12��ֿ@�5����@�W3���@��1
�ut@����h�^@��cp�@��nF��@�e��@7�@��2[�9{@�U����P@��V,]�@���A1@�C�	��2@����}@��(�C�@�nI�t��@�q?��=/@�~�E� �@���Uߏ@��Rlx�m@���F�M�@�#!���@�iB��t@���_�@�*� �`@���7z�@���%ɽ!        ?`���(�a?���r/�?�Łn��]?Ƥ��<8?�T��F�?�\YC��?�;���v?���$]gR@`�����@ؤ���	@�D~�ga@#-�l%@+@�W��@2��ӈԏ@9A�%Ɓ@@�f��E@E�&�)@K��O1��@Q�|���@U����X]@Z�U$��=@`,�"K$@ccr�JG)@g�!(��@kя1��@o��n	�@rCK�ז@t��m��}@w���,+@{0|�u��@~�� /@�9#����@�>[��4@�g�:F�@��v˦��@�*�'e�i@����c�{@��^u�<@�9V�@�����Q@�`��m}w@���@��W�KM7@��uwt�_@����^�@����:x�@���Zr��@�T <�S@�(����,@�Z54��@���N  �@��8�Nm�@�3��C @��3�TY�@�(y��@�z��1�r@� �}��@�����@�*,���@��s���@���ܣR�@���g$�@���{ݟ�        ?�;��f�@1���BH@Pm��?�@cQp��q�@q����@|�j����@�	���P�@�����@� ����b@�n����@�qU�,��@��0��@�]�3�O@��o�F�@�"��Ӧ3@���JP@���u!�@�����@��mb[m@��C�.�L@�)K�i@�.��0}�@�Y�i��@ǩ���$�@�"{&�y@�Þ^�Zu@ώNkq�@�A��@�ѕ�#�c@�w0@ڛs@�2�6
��@�㢔�"@��$�3Mg@��uO��@���9O|@����y@�3GU�iw@�_!���@㖱ޡ��@��a+�@�)jNe�@焟>�@���]\�@�^T1�S@�܁b��@�e���l�@�����@�L��:fl@�"
V��~@��pg�.@���Y$(@���2@��=t��Q@�����IN@��L�JE7@��-�~��@��O��b@�����@��xӨ�j@���,H@��F����@�Ԁq8�@��dr�S�        ?a��`�?�bܝ��?�R���L?�|V�|�?թ���|?ᷗf	I?�u�	,o?��FLN?��xz"�@ "0����@\
��@	%u�t� @�!@�R@>�%Z2�@�+.F@,d�3@"*�kg@ ��ͽ��@#]�@%�TT�@(BR�u @+'��1z�@.A($��@0�F���^@2��s�@4l� �U	@6j��j55@8�
F��@:�mN�%�@= ֐��G@?���N�)@AL��@@B~����@C����T@Eu,��@G�ila@H��e�}@JrǟB=w@LC��ș�@N(%��
k@Pcm���@Q�*n�d@R'i#��@SBl|���@Th,^e#Y@U�ʈMw@VՖ)O	@X!EeBD@Ys'
t�@Z�bQ5�@\Dp&Џ�@]��p8"l@_M�C�'@`s�T_@aG��~�@b#�w�@�@cc���R@c�m�-/�@d���8@e�	�W�@f����'$@g逈�x�@h��c��|        ?J{��N��?�p� e?��X�N�?���-#�?�֌"�?ث��?��gQ��0?�2��;�?�:	f!@i�M��r@�-\\�@,k�@!�n^�@'gWM��@/u��}�@4��t��@:ȵ��3t@A/�q�@EOcm��k@JN 
���@P�1�}�@SP���@W%�V�A@[/��<�@_�o� _@bxx��JG@eIb~��@h]��OqQ@k��u�>@oZs���-@q��:�G@s�f>�P�@v�~��@xv)�&�@{5��ދ@}֍nL��@�eI��9N@������@���TQ{@�cR��	�@�?����Z@�6���}C@�H��b�@�v�k�@����.@�UV�Ɣ@�Y#`�e�@���"�I�@��8i4f@��PA�-�@�/�U@��Ǣ���@�L��`��@�	+d]B@��V(R�@�^[o2��@�Zf���@�`�C���@�r>��@����`�l@��in�@������@�)X�q��        ?A�'�|��?v25�J�?�pz��%?�>�b��B?��5f*�?�iJa�F?��}F??�'ӹԻ?����x@ j�i/@���@q$�2|@���~đ@ ����k�@&�5�V��@.;���#�@3��Z�N�@9�uj�@?������@C���x�@G�͂�g@L�Pu�(@Q`,ȷ%�@T�M��2@XE�ې?�@\Vmv��@`k�%4R�@b���u�@e���@h�����G@k���q@oa�:Fۦ@q�����@s����]@u޺��@x?�Q� �@z��Lb�@}�u4�@@�8�Q��@��xH_|@�m�(��@�/���.@��Q�b�@�}&�@�����@�Sz/ȣ@���-��R@���m��@�[�i�@��$}�0�@�(ǘC *@���/}@�@��]|k@���7��@���3�?!@�z(S�8�@�b:�(�@��'A�@��s���@��Cy�fH@���62�x@�n��t@�YI��K        ?����O�v@��;�@6�垠�@K{�u�SQ@Z=�7.(�@e�M�=�@p6�5���@vƽ�zo@~�n�%��@��b.˴�@��Bd-h=@���_@��$?oG@�:��H:@�9�$�x@����כ@��[-+�(@�X��Q�@�2�5��@�I#5�ַ@��n��t@��姧�C@���3�]@��8lS ,@��L�̋@�#�Ǘ��@��`ə~�@�L}��@���a{�~@�����@Þ "~�@�F"��t	@�n�2A�@�ْ�/h@��/�&��@���~&?@��bꢨ�@Џ��u�@ѷŴ�d@���xmS@�/3/��@�~�_�|c@��*��d�@�E33<�@ٽ���@�C\�@���o�v�@�{�B�}@���_�@���8Դ@��i P+>@�ד����@�ө�.��@���k�@��\
�Ho@��I��x�@� �0t��@�K�^u�@ꀲj���@�=��@��w^�@�Y���^@ﵹ{3R�        ?^�lI])\?���~�|?�~)^�C	?�,�΄�?���e��?��8�
\?�g`�@?�w|�O��?� v}ԭ?��� )�?��_�-@#��G^@������@M���@b��'|@h�����@��p���@f��� @2��p�x@50N0�@q	M3�@ ��2�`?@"�oŢ<#@$�oH'�i@&�1�~�.@) �Gߺ@+g@!+@-�k ^=@09-ųV@1�AU)P@@3 0���@4}
E�mL@6�(�@7�cj���@9[MO�E�@;����@<�[[>b�@>��^3@@h�2~�@An7C�u\@B},�T.@C��Z��@D�'�Zi@E䒡�Hc@G+Rv��@H\��@I�{"�?@J�uOt6@L^!oND�@Mɗet�@O?�s�+y@P`���k�@Q&�~�t@Q�L�?��@R�n�;�@S����X@Tv]<���@UX9�[@V?�pDE�@W,��TE�@X���<@Y�g�#e@Z����        ?/� ���,?e��=lָ?������?���o?`?����P�?��̻��?ل�ڨŝ?�^<{�
�?�w[�@ dC��@@	���c�R@+�B�]^@��f��a@#�EtT@*�h��u@2tg)4�@7�H�3�@>�р�NW@Cz��!�.@Hkp�A@N7��%k�@R{�6�@V]���8@ZΑ981@_�q~�E�@b�,��O�@e�c�9@i}��/�@ml֒��@p��I��@sF��!@u�`�(��@x�w��>@{�ɞ��@Ka�@�}w��~�@�|%���@��~|���@����c@�t0B�v@�!��@���Fdψ@��msc۠@�+m-���@����ǿ@��৭/@���MrA@���}�T�@��5)��@�g5{[ג@��fU��u@�@�dl
@����d
�@�O�Z`?@��D���@�;!q+[@��Zk��x@��~?X�W@����w�@�{bbgxy@��Q��@���`��y@��:1V��        ?:.Rśb�?n*�|]K?���=�?�z�V�?�l���m�?ȣ|���?��
�Xyn?���b�?��v���?�H���B @�[�@a��g�G@�w�v��@�2Խ@#��/�B�@)��ƱŹ@0��'�vR@5)o��l@:w�L3l�@@QG����@C܇�.��@G�eB5@Lq�2E��@P�Z���@S����}@V��N-�]@Z"��q@]�{Lt@`�ႩV@c&E"�h@e�F��@h��Y�{@j�_����@m��=�M�@pS�_�@q�d ��@s�����@us�Z�j�@wX��֞;@yU��yJ@{k�2��W@}�[8$��@�D�5�@�!����@�_����@��d��8@����@�hj%��>@��Lխ@�]˽(�@���2\�E@�����Z�@�:NB��@��<8R��@����ذ�@���݉�@��w�@��+n�ѵ@��g�;�i@��_w]I@��G�jd�@�W[f�@�B���R        ?�&�͟r@��NG��@/�)^�P@B��,$�@QOÐ6J@[��)G�@d�ٔ8d�@l_�8i��@r�P��1�@w�S>�y@}�e�K�@�j���@��# �WW@����FS2@��L��?|@�;i[�&h@���Q�@�z1�!�@�l�d�J�@��w���\@�=H�@�����g@�Ҝ��"@��Eq�3@�&Z�}ԛ@��c��@�8���Q@��^2 �@�4����+@�����@�/��A@@��	�m�@�u6����@�4�����@��=�6q@��b�S�F@��W���@�~#g��@��U��)l@¯�'�q�@�� 0��@��h!�@�N�.��@ǜM�ib@��y6pn@�[��+	�@�λ�L�*@�O�&�A@��ԫ;"�@�<$�N�@���H<e@��y|kA@��5D5��@ӹ�[ʳ@Ԫ/(#@բ`>�-<@֡�P��@ש����@ط�D��@��' �@��*O/��@�@����@�@l����        ?��7|�z?�;gg��<?����?�9Jc�?�:F}��W@�5��	>@�j��@�nÖY@����T@"�Xi"�@&����R@*K^�Z��@.�����@1���T�@4�]�p@7a/�'��@:`�K	I�@=�.����@@v�|��@B<*�@�P@D�j\N�@F���@H?l�@JEއ۳�@L�$�M�@N�5)��@P�b��k�@Q�E�K�@SL[����@T��z�@V&���@W��g��@Y>6�7��@Z�{�W:�@\��e��@^W���@`(eNY�@a9�;,@a�� ���@b�����@d:��<�@e
�t~�@f+9\l��@gH�GQ�@hm^�"0�@i�*Y
	�@j���+%@l�~��@mG/<ְ@n�P�G&q@o��t�!�@p��-l{R@qIĵ�@q�~.|@r���ҧ�@se�@C�@t;2:�@t����@u�8U�#@vY��Z��@wH� 9�@w�B����@x��sM�.        ?�g���?��G>'�?�H�m���?�f��f�	?�g�ޔ*@��d"@�/:#j@�d@歴@C__J@!=�H���@&\�&LP@,�!b��@2O1&��4@7)�$�@=\-�ȫ@B"���'@Fq��řv@K�a�l;�@P�
��7@TR(���@Xdl�=@]8��@a-�ň�@d+�Q�ʞ@g�}��@k?�G�H@o^u+ɜ@q����A@tmA8N.e@w�"�9�@z.&��@}4-��@�L~�ɽ�@�ܵ�T;@���; @�}i��l@�P�R�I�@������@�&�MT�@��c�ը@�1�(]�@���+���@��q�:@���`�@�RM��`Q@�����@��+�k��@���8%�@��R�X��@�L2��?@�U�|��O@�ho8��@���x���@��n��uc@�٢���@�N֏�@�Tq�<�Q@��	C�w@��Ͽ�x@�S���}@��|�M�h@�,�2��@�S�(�        ?�{���k�?�o�@�t�?�ssg^��?���EsJ@	r���@�pU�Ĳ@��dM@"�nCd��@(�|]v��@/��O�@3�-����@8�@��H@>�	�v@B��\.4@F�ԇy~@Km�Ĩ	�@Px�i��@S�����@WW(BĽg@[�܀ip@`#<@��@b�ޞ�md@e��?��#@i�	���@l�����@pY֟9�@r���hU�@tબ��@wl
l�@�@z)=�L@}��&XT@�<�&�@�ʉ&��}@���#;�.@�t̈́k@�s$���@��5^��@��+��@�}�B�@�GO���@��I|��@��25Ev@�O� @=E@��f��z@�O;I��@��mzJ�@������@�K���/-@�[Bl@��IƸ�@��v�1��@�����@��ޗu�@�Lj��@�7��^&@�`����J@���RE��@��`o��@�	SfF�@�g��9�M@�����.@�&��ҏ@���ӮEN        @4B��T@^��O\5�@v����)�@��.H���@� �_U!@� ��É@���Y}�@���d&3>@�)�X2�@�57�_�A@��! [��@�d5��O�@�5W�#�^@��O����@Ǫ����@ʟ�&z�@ͽ�Rɱ�@Ѓi����@�>�i,"9@��2#@����O@���t�F@�%���@�eYtbB�@���m��:@�8U�@��fŐ�@�S7O̜i@��l���@�N���@���&���@�O%#�@�]���	�@�7D��f�@�&��v>�@��7!��@�d�߻�@����@�@�ߜpH �@�9i��@�G˚d:�@��9�N	�@��U)tq3@�4�I.�@���+�&�@���p�@�~D����@����z�A ŷ��
A��l*J�A`M�ʠ�A4�g���A<�KKA��r�x&A͊XX/�A��s�A���#�A��3gAA	x!d��A
j�i��A`9k�-QAX�Z��fAS��/G        ?Z�� )�V?� �[�?���\?�C�߽H?�h��R�?޳���?�;ct�f?�pm�=R�?�)���/�?�;��@1LSZ�@vTx���@9�0�`@?�ǣp@#p�#�@K�'�@��?�@m&��j@ ���?�@"،]�y�@%"��k�@'�!���p@*.�X#�@,�k�Y2@/��O$�@1{�zY�;@3���c�@4Ո6��@6��^���@8�+Y%F;@:���鹗@<�bP#۵@>��z2�@@�$	�^@A�љ5O@B���8@D1nc�!@E���3�[@F��IW@HM*����@I��cs@KIٿ`�K@L��?�t@N{�3��@P���K@P�^@Q�cO�f@R���=��@S��\�@T�T���@U���_��@V��>�@W�t�s�@Y;����@Z:Y�_c�@[o��2�@\���Ț�@]� ��;_@_H��Dx�@`Q�bB<I@a\�0W�@a�����@bw�dӓ�        ?@��c,N?yXO32�?���`�_?�CO��_?�iɅ��?��\?���V���?���%ٸ?�'�ud@j*5��@�1��!@dB���@��T-�@%˹~��E@-FCʝ)@39���@8�R��M@?J,[��I@Ct��ψ@G�|�u�{@L�]����@Q9��M�@T[R�W�@W���j@[��i�@_�k���@b-t��i@d��Tzp>@gF����}@j�����@m%<A�+@p0[a��k@q�?���@s�í�jN@u�z���@w� U��@y��4Z�@|!L@~|"q@�}�Iq^@��z1}s@�-?=n[@���b�1@�$�fÐ@��1��Z�@�WFrs�t@��WI�@���6�`@�����S@�T���q@�XQ�լ�@�f?�J�@�~���:@���!��x@����{O@����aS@�S0�@��膣�,@�e�=�@�p�Q��@���dŬO@�o�"?��@����r&        ?M�1����?������?��ӓ� ?�=�Nt��?�4չ�?��W�^��?�	�b�?��C,�i?�Qݔ�ch@Z��,�@�`B���@Q3��@�/j,5@$_�=��@+=�]�#?@1�C$<F{@6��s��@=!�4Đ=@B.���4B@Fd��~/@K=�6&�@Pa���Ƌ@S��_g��@V��/_��@Z���q��@_1G��S�@a�Vz1/@d�6P3U@g\����t@jj�K�@m�����w@p�(����@r�y� R3@t�di�v@v�F�_�@y!`����@{��:��X@~F��(1@���q��@�
DTH}@�����02@�J���@��́�?@��ŷ��p@����\�@��Q|8,�@�!�x��	@���]"@��dW�y@�-I��h@���Ə��@��WuG@�Y7�a�'@��/t�M\@�v�sB��@� ����@�ݿ��-�@������$@�ȟC
e`@��u��If@�ʗ̓�	@��DӪ]R@���C��        ?�)�27��@��龝@6:����Q@Kj�7�@Zb�iEG6@e��~��4@pe�^�~@wLLM��@~��Yx�@��K��،@�G�a�@��W���@���KV�@�%���<@�ր�t�@�O��-�@�x��ƻF@���s0Ӿ@�����@@��(BQW@����%�@�F�'�@���ij�@�����s�@���.Z��@���R��@��rk��@�e�XվV@�����]s@��e���@� 	��-�@Ð�Ht�3@�f����@ƥ��:�@�Jތ�̔@�L=��A@��j�+��@ͩ�|���@Ϛ��Y�@�ϻ���@��|�@ 4@���VRFV@��>�@�CQ�dbh@�|`bHz�@�������@���'5�@�s4,B�@����C�@�\T ]�@����f�T@�@����@�`C��@��DQbT�@��� h�@���g@���_�@�64I%�@�@�h@��"��@��T�N޻@���}^*@��Ց,�        ?�6��P�H?���r}h$?���e�?�0����r?�v�}ņ?� ��R?����$#�@a�$��@�|;k&@�3��@0�5�9@O�G��@ 8�G9ir@#'6~�)a@&S\AjU�@)�>,^�@-d��/`@0�dW��@2��N���@4��"�p@75���*R@9�9�.@<1�o*d&@>ݤǊ��@@����@BG�ր��@C�l���@E[�C�&s@F���׵z@H�L{D��@Jg��m�1@L4w��@N27��@O�](�P�@P�K�r�J@Q�|{`=@S	M���@Tʳ��@U8�9W@VZ���)@W��z5(@X���l9>@Y�G�� �@[6$�i@I@\�F0�>�@]�͎�� @_0�@�@`J��,��@a��U��@a��ȓ[@b}>9��6@cBYlk7@d��I��@d����{@e�`��>@f�O��}�@gi��Y$@hN�2��C@i9�+�u@j*�d=�B@k"
(|ƣ@li����@m"�q���        ?K�3�g�b?w���2?�>����L?����
>g?�[��}��?���?����� ?�:{(��?��e�?��~L�I@st��;�@��9m�@����@"��D�y@(z?1^D|@0F�F_�@58��CK�@;/qꃻ�@A"���r�@EK~�@JH&9({@O��iX�p@R�A՘�q@V��+U��@Z��= �@^��fx@a�`����@d�]zyAg@g���dǤ@j���&7R@nG�
���@q�jeq@sO����@uC� y�j@w���Ce�@z!�x�@|�K�m@���վ@�W�E@�����)@��Bm�O�@�l����@�N�?(5@�J �Q�@�^��V@���jQ��@�k����P@��-w��@�ހ��7�@�,�"��>@��۵�?�@��g���@�o��8d@�����z@����-@�;ŷ��w@���G� .@�_;(���@�Ldu0n@�B㿋9@�@���/�@�G��uY�@�X0�6        ?�d6)�+?�>|p��??���cX�?�3O4�?�?h]�@��f@�Ap��@�<��o�@K��{[@$[@Xl+@*ȍ�#%o@1R�8�{@6�D@ �@;Ͼ��1�@AN��L:�@EQ����@I�F�6ќ@Of|!�{�@Ř�Ku@VR�����@ZL�l��@^�I��J�@a�%c@d�SH�q0@g�Og(**@j���^�@n�Q�Ί�@qDz�PΫ@sf=��;@u���@�@x*���	@zϼ�F1�@}���SNw@�R�E�@���/e�@��8�,@�f#w�N@�I�Vq34@�GX���@�_yB��@����W:�@��m�@�&0?��V@�j�~�@���{��@�0ȅI�@��'���@��K��G@���-K��@�A�E@���-8�g@���4D!@�Eۉ��@�9�w&@�5����@�;>ߌ�@�J�	�$�@�c����o@���B�D@���@����+@�.�f��@@�|�t�z�        @C[ǚ�@5���Ì-@R����@e�?i~)@s�r�^@� �"��@�`��G�(@����3@���s@�ף�n�@�����U@�#*����@��a�_��@���Niy@�HRWh�@��E�F@�+aw�S@��G�Ĵ�@��1��b@���gR��@�\`�!�@������@ôeq\�@�}���9/@�[A�j @�LJy�'1@�Q�D�@�i���k@ϖ�tZ%@��0z�5@�Z�Ȟ@�I����@ԇ�_p@��_Bq�.@�#�d�N@؀ʁ�@��r�K�@�YE�+�v@�ը|�y@�\�V)(�@���C�@�ť���@ᙊ�X�@�sk�@�R*��@�7�x�@�!�Rٞh@�j�Vh�@�	��p0@���
�@���O�@� ��L�@�!�a��@�7��ga@�Tgd=�`@�w|��2B@�(C�H�@�h�]�)�@�6�J^@�
Am@�E7���T@�귖�Bs@�~����        ?��`6��h?��zP�?�8|g�8�?�%�.�:?�nN
�?���:���@g�W\,@�f��@p�p� +@t����}@��s�9@"�i�=@%K���U@(�O��Xu@,�Ôƻ�@0T{USk	@2|�@4��n0ͭ@73�D	4f@9�u8�@<u�QQƍ@?J;ζXT@A �E�O�@B��Ұ�@DK��S.�@E��߇�@G�oʴ�@I����w�@KiK���c@MX]��@OV��G��@P��Y�P@Q�/���'@R���@S�����@U�����@VC�_�~@Ww]��x@X�����O@Y�_���@[?��`^@\�-ʟ�@]�0�@'@_J���Y�@`Y^�@aI�a�?@a�,�y�|@b��	�@cQ.kc,'@do�=@d����9a@e��P���@f��(Uk@ge �l@hB��R�@i$���@j
s��@j􄿦
@k�u��T@l���D_`@m�*�,�@nœ d`u@o�.�g�         ?RNE��?�̐&X?�?�o:yd�j?�}�&�?Ǜ�*���?խ{�1�w?☜���?�eztul??�䩪y�h@'����C@
���`�<@+Qo�,@�p���@"@s���@([�{�*�@/���c#@4|��A"@9驡!�@@&�hr�@C��#���@H(U~��@M��R��@QM�s:X@Tk��T~@W�D��@[ȵ�8�8@`����@bc�{jҿ@d�;{@gȲUz[�@j�(�+�@n)C��@p�u���@r�r6�Q@t�&R���@wZjY�@y��� #�@|��3�@~�s�I��@�ۣJ�_@�i�d�O�@�L�a@��+O�|�@����1#�@��}y�@��Đ�F@������@�(���@�d�a��@��]��@������@��9���@�Ge�s@����*@�A|��(�@��H2Z�Z@���b@����G)L@�ܯ�v��@��湪�@�����^@�!�:��@�Qá�H*        ?����Xmy?��$YQe(?�8���5?�}��j?�ܜ��?�	'(9�@W��AL:@��@��e��@s�~*~@],��@#�<��@(܄�AW,@.���1@2�1�Y�@7�£��@;��c@@��S��<@Cٞ�8��@Gg�Ͻ�@KdB���@OնÝt�@R`ǳ�$�@U�㛳�@XDA}zF@[M:�'֡@^�.&�W�@aQ�ʍ$�@c`�ޟ��@e���@g��3W@j~Jq��@m1�b}��@p5��f@q��G��V@s*i��@t�^��@v�~�Ͷ�@x�	Ҕ��@z�:��Dv@|��q{�@~͠//f�@��y`E@���Zl�@��q�Z�@�Kj���@��֑N5 @�!@�&@��n�.� @�Qg��@��~��3@�[A#�@���|f@�p��W�@�_'z���@�Vz�y4@�V���h@�`Z��J$@�s?!�Ȱ@����B�@���y�@��ǣ6Ol@��}        @vNX��@H��;8�@c�z#v�@v��d:�@���-�@�|5y�@��>���@�^8$��a@��\��l�@���qh��@��!2�} @�U��{-@�f6!{��@��+ -�@�,���N�@��� grF@�e4/�@�t����@ŞD��}�@��g&V7@�@�X�'!@̹�^��{@�L�m���@���B��@�`�5pA�@��V����@�N��@��`28!@�pj�K�-@�㠯z}@�Ô/�%@�G����@�F�^j@���/Ѕ�@�|QF��@�qV�!��@�l^���@�lMv]��@�r7p�:�@�}��b�@���@�=���@��#ي�@��E�d�@���$@�?�$2�@�v�sY�}@���{@�@�}1�'��@�#��1@@��s�V��@�}.�
�(@�0K1s�@��K�u@�������@�b���i�@�&�};�@��F4��r@��2����@���X1'N@�cPB4h�@�=��ԯ�@�B�<�        ?�G'Y�$?�H��k?�_q��4k?�nNk4X?�>p���?�� �o�m@�|��U@��֌�$@�_�4`n@MjN�b�@�TW�%�@#8	�w@'�O���@+DQ�9�@/�e���-@2n�։@5!Ow|��@8$}��@; }�f�@>l.�2�
@@��@�l@B��L��@D�\�� @F�:0DM�@H��eh�@K=�*@M��؆�0@P{-���@QX�z��x@R�P)�D@T����@U�����T@W"b".@X�*�'b�@ZfO1�LQ@\!��5v@]�ܶ��7@_��xК@`܅��@a�C���@b�t���@c���y/b@e��c��@fA�d�uO@gt!���@h�`.g�@i��#*�5@kF�S���@l����@nMx��	@oswO^'�@pu�P�}@q6�v�#k@q���ӆ*@r��Zr�@s��(�^@tl��� @uF��	M�@v%��3^@w	HͲ�@w��I�@x�z˹L�@y��g~q        ?w�]��/?��䝍�?�5p@|"�?��5]�(�?�w��(n�?�\y�7��@Jی{x@��a���@���Y�@F7��-@ w��8�N@%j?�a@*�]|�5@0��p{�i@4f����@8ܐ�i�@>�v��@A��B͚�@EFL����@I!�*Ee@M9˪Z��@P�<E�.@S��P�9�@V\�Q̻�@Yw�6❔@\�,3�@`CJl�@b@R�9�@dd�64�@f�k��s�@i*�P�3�@kϸ �_�@n����@p��2�|@rj�k43H@t�(Ð @u� U@w��+=�"@yО
RC@{�i���@~)2���@�@��u��@�|����@����!@�#߇gw�@��N�4\@��$�z?@�����@�>*��@����2�@�����@�@��xU꩛@��n3|'~@��>��!@��k�R��@��5���J@�ݚ�յ@�-����[@�d���}�@���6�w�@����LY�@�Q��V��@��7���        ?�+�J6�S?�Rn^�}?�(b�ļ0@d]��e@P��-@��<:�@#��~�@+�ՕJ��@2tuʐB�@7� S�f@>N
��M�@B��Ј=@G_[/Xu@K��XI��@P��1si@S�̗U��@W߈,�Y@Z�Q�{1
@_6-6�E@a�6$[9�@d��<G�@gp��"F@j�1(�Y@n�S@p��@\.�@r����#�@ukN�;�@wq��5�@y�q,�X@|�۟�*�@��W�@�fb��DT@��bf@�݂�π#@���{��@�ʵ��d�@��<C�p�@�6yA9W@����`�|@���3=L@�l5EA�@��CP��@�SsMҋ�@��U~�ϗ@��x�#�@�Ch��D�@��'oZ�@���-��@���>h�@�f�nd�@����@�:��]o@�iX���@��"�Wk@���v@�Ft�>@��Y:��@�!-@���2)@�:]�f�@��id%<�@�ʯ�BR@��ZdQ�        @����@O�-�Qӫ@l y��!�@�=>F`@����r�o@�����IG@�pB�n@��C �@@�du���@����!�@����D��@��z�c�@����ŗ@Ĝ�/j�@���KF�@�G���p}@��+yy�j@�i���@�u]��5@՛�Ɍ�@�ݳ.��P@�:@���\@ܱ�3���@�D=��@���r��@�]���`L@��	r�T�@�PF´b�@��mr�N@�z�j��4@�$���/�@��m�(mf@��s� h@�z"����@�Y�*�j@�5Km��@����92@�U>���@�������@���֬e@�fH�v@�-^x|�|@�`�8��(@����h�@���Y���@�/X~�<@��f��G@��a{A ��a�rA]�/���A�%#�AڪZ��A��i�Ah���G�A6~Vq4�A^��'�Aއ�x�oA���z �A��ʿɴA	z���!9A
a�2�_AM1L��<A<�{��        ?��Ѩ-�A?�7�V�+?��\�+zH?䭚�V0�?����~?���ͷF�@�k�f�@���w.�@��'��@��"|��@ �A��^�@$F6��Ow@(K���"Q@,�]�!�?@0�T���@3Qe
�q�@6�ˢ��@9�=�Lj@<@�giŵ@?�q�eb�@A����A|@C��Q_�@E�_}�,@G��FJ��@I����C�@L6[�a3@N��A�n�@P���=�@Q�ޗ\��@SY���+�@Tψ��%@VT��� d@W�*;�@Y��S4B
@[H�K`A@]��`W�@^�f��@`l?�$�k@alI��5S@bvnN	@c�)P�@d�H��7�@e����@gN�Kv@hB~H�u@i�o`nM@j�Sb��@l:�# xN@m�:�c�@o�-HV@pJj_�@q&KTJ@q�{�rh�@r�k�OKd@s~�R\@tZ]勒@u:�d�E@v ����O@w�(:R@w���IRj@x����W@y��z@z�4�J�        ?��D`ii?��t�@��?�nv���?�hhӁ~�?�l�Jƶ?�m(�<�H@���;<�@m%�a�!@YT��b�@���N@!��F�@'ކI��@/D�����@48�	�B3@9��0S�@@S���b�@Dh~7�\@I>�t#G@N���@R�Z��J�@V�'��z�@Z���U�@_�%���)@bЩˇ�@e���I�@i�.┝�@m��U9F@p�� �t�@sa���@v
�$ǒ�@x��R���@|"��U�[@�br�S@�����]@���1�Д@��e���@�<2th@����R��@�w���x�@�.lX�	�@���#V�@�_�׈$ @� N���7@���qtj@����m@���D\{@�B�E)��@���i\�u@����=�@�RH���@����a@�<#��	@�����@�0_���@���,Ƶ@��6;��@�\$濕�@�=^���@����'l@��F3��<@����
(@��>��@���"�        ?�M�g	 �?�J\�3�z?�-Vs���?��YE��r@{�d��@��!K�T@�7���A@!\��&��@'7md�@.L��Y@3a�<CH@7�Tb^>7@=�<r@A�:�{@E��ޭ�@I��x��@M��V@QU�s�h�@T2L��Aw@Wd}�`�5@Z�O�O@^ޔ g�@a��rs%@c��FK@f��W�@iO��6�(@lQ�&4��@o�����[@q�'�2ѧ@s`^jg^@u\!8�d�@wy�A�!@y���,0�@|��J@~�K�� @����f@��Pv=@�����.@�3B3���@��#���@�����'�@���8P��@��酚.@��@W��K@�m�۲ b@��:�3��@����ӞG@��Z��@�zuͱ�)@�����q@�i�kV@��o���@��d|cn@�^|�E��@�.Q���@���,X�@��C��,@��
ץӊ@��Z���@��z��^:@��xY\:@�)<��e�@�n\}yt        @��gS5@J:��8�@f����@zdx�eK�@��6Q/�@���}��)@��(���@���.D@�='9��<@���8}��@��_2H@���[a\�@���{�y@�m?��q�@�1<�B�@�'Z�F�F@�O��V��@ͪ}l��@Л��`2{@�|2��@�v-�#�@։��G%@ط1 ��@����π�@�`R$�U@��$�j�R@�9+:�O@⑐��˹@��jJ /=@�j���\@��7s�[�@�{�L:44@�3s��i@��M�O�@�])>5@�I� 20�@�ck��@񅃣J��@�fbhm%@�%��C�@��ނ�}t@���ݪ@���
0�4@��e|;�@�Anc�@�D���@��� @@������x@�"�%{@�ams�7A ]�A��SA(�ѡA�G�醜A}<���A9�H� (A�l y�6A�~{�rnA�M�%9AQ����Awb��A���V-A��W�A	���2E        ?o� M|��?��P�Ǌ?��"�gm?�u�
F��?�9�sE�
?�@�q:Hi?�gO�92?��@����@��g�U@�� ���@��~!�%@�~�_�@-fQm�@�ҟ�@h��@w@!	&
>�@#���1�
@&B�jV��@)(�2���@,?�6K�@/���zv@1��
�`�@3Z�mU��@5M?"f�j@7[:��@9����@;�T�v�@>.�*	��@@X����@A��k�R@C	~*R�B@DzY��@E��?�1@G����E�@I.�L�&s@J�k���P@L��y8k�@Nx��v�@P.�X4�@Q)�)�3t@R-`ʹs@S9	o�u}@TM����@UkW~��@V�ο���@W�Ia6<@X��~2��@Z;�!`��@[��c�@\ی���E@^9�`���@_���`�P@`���a�v@aE`-~�|@b�K"٭@b�>�$�@c����b�@dd	y-��@e6cH���@f��N�1@f��Ԓ�@gƞFy�8@h��P;�#        ?bS���?����,&�?��n
Uэ?��CX�vf?��F����?�	3�v�?���,�@j/+9@	�d��.@�Ah�@��K~��@# '���@)��Y�s_@0�XB�n�@5�6ѭ=@;�oUM@Az��t`�@E�\�_�2@J��?�.U@P	�6,�@S1hy���@V�q���@Z��0�J�@_�I�%@a�a��>�@d��y�B@g���*�@j���0@ng�n�h@p�%��Z@rѨ�9�@t�F��@w*i|4�@y��˛B@|ͷ�F@~��Y���@��g��@�W��0�V@����v͞@���I�{�@�hT�>�@�HV�)��@�AƯ��@�U��Dm�@���S���@��V��\�@���ǞX@�`����@����ќ�@��zf��@��
��MA@�����j@��0:t�@�XC�0��@�W�|Mh@����Κ@�泣�4@�㢑{��@����!�@���s#�d@�w�[^�@�@�D��@�s��Ix        ?zk�<%g?�É��N?��J.��S?�銚A)�?��V�M�?��$��I�?��}E�*�@6">�5@i�*���@�S�L	�@���M��@$p$ȝ"@*��h*��@1`�����@67Ή&E@<���ј@A��X�@E�e�m@J^��I��@O��"�:@S�y�rb@V�MN	
@Z����b@_GGwx@G@b+}_�[@d��G1b{@hwRm4@ky+���@o1�s�@q��Ce��@sӭH�E@v5��V@xȘׇ�@{�kI�J`@~�3y���@��XNu"@��L!��@�\�/�f�@�I���S@�T����@�~�K?�@��F؜�@�2]D�@(@���N�@�5I��No@����MG@�!�\T@���}@�=�Pg��@������@�����d@��㏴Ψ@�hPvm@�����ǵ@���ܣ�)@��Z�-��@��y���J@�7L���@�.��y��@�d�j57 @���as��@��7���@�BDݡ�!        ?��}�H-@*��xG?@Hp\c6A�@]�@S1@k)Y���@u��Jg��@�7g�0��@�kJ�
ֽ@����4�@����B�@�t���f@��'X��@�
�6Z)�@�\��@�Y����d@��LkE@���Y�d@�Y�:�8`@�af�յ@��3�4v�@�.b�8c{@��/8{�U@�c�a�xr@���P;@����@���M�9@Ķ���ފ@�d�d2"@�%o�@��dGK�@����LH�@�ܳ���@���@i&#@�	��\@�&a66��@�Nvo'*w@ԁ���e@տ�����@�	!��)�@�]�=$��@پ^��&7@�*mc21�@ܢH;��@�&���+@ߵۀ燊@��SW�@�}g.(�@�W[���U@�7�}>�@��;e��@���g�n@��\ �W�@����|��@����x��@��'
� @�	�2�)x@��M���@�1�q�D�@�N	�40@�oȊr�b@��!3g!@�ax>�p@�����        ?j}��`�?��� ��?�8|Mc'?ҽ�a��?��:�C�?��Q�s�?����*PP?�A!M9�B@<�o|�g@
'r���@s����@A��@��@�gn.�@6?M��@!2���r�@$	[Z��d@'!���@*F��Lx@.$")1�.@1	��2:�@3'�z��@5l�RqL'@7��a�a�@:rfs���@=4=���@@�[-[@A��6���@CA6	ܛ.@D�7�wlj@F�M��z@H��K���@J���e�.@L����/�@OnH��2@P��M{��@QݓЯ�@S l7֗@Tq��6`�@U��S�t@WAU��(@X�9G+?�@ZNӻ�`�@[�N-Ɋ4@]���0�(@_Z>��@`�j��@a��#��\@b{1?��@cz��)�@d�(�pg(@e������@f�կ�J�@gǼY{T�@h�jˣW@j��b1e@kPt;۰@l�)t�@m�J��o�@o ��ph@p3:A�@p�9t��@q�9�lS@r=��:;�        ?[ѣx���?������?�(�?mʽ?�m<�!&�?��XM6d�?鯥v�o3?�+�K�e�@ �y}(O�@	�B��@{�,��@�&��D
@"�_cV @)��'��@1a���@7�� @><lE~�@C|�Rk,�@H��Q-�@O#���q@SH��'�@W�V	W@\�R���@aB��@d���?��@hP)cn@l����=�@p��'�
@s7�m�n@vq����@yG�<u,@|��8��@�F��
�<@�W� @��݊��'@���ђݪ@��+%KY@�g��}d�@�i#��W�@�PzH'5�@��Ia&f@������@���F��@��Y5���@����m@�p/�@���0�@�D�pu�@��<7��@��~+y�@��䚒^�@�D�+�m@���C]q@��(��+�@���eY~@��(8��@�V��@�j� 2%@���W�@�����6=@���M3:@�8����@����H�@��i;O�]        ?=M���U�?qR�S���?�2��=�?�h����?��ƱI?���i�?ڙ�g-�?��G���?�Ǌ�QV?�_���@I��@���B@�Vw7K�@M��^@$�!b�@+C�頾X@1�@�o��@65��+�@;�Z�8@AP�*P@D��[�@H�d{%��@M����
�@QvtQ��	@Tm��@W����#@[Yg3�r@_Vx� �U@aٗ�4K�@d9��t�@f�I��@i�q��ץ@l��+���@o��/���@q��c���@s�i	}�x@u�����<@w�VcL�@yޕl��@|B�����@~�[�$�l@������@�(7�@K@���I$:@�;�;!��@����t�@�����v@�|�'J�@�kQ�j��@�r@$���@�I!�Pyi@�f*/p@��Uu��N@��[��f@��9�4@�c}���@�ǊHz�@�;6���@�� �C�D@�Sd2�s@�����T@���3b�M@��v�U��        ?�� E�ܤ@'F.�|��@F���}i�@[wc�x�J@j
�X�~�@uK��.�@�?6��@���:N�@�jC�w�J@�醾�{�@��I�2�@��u��p_@�qԱV�G@����l@�>D���V@�a���@�'-Mـ_@�ksD@�އ}w�i@���]x@�U`#�R@�]9�WA�@�M���@�th��@��3���@��!�'�@��߂��N@��,�#@�^!7?w�@����v�@Э�9D�@��͚�U@�m� N._@���m��@�u���F/@���ƥ�@��3$7j;@ۑyq�9@�m�#�΢@�_��Hvp@೛ ���@��]��@�ܶ�Q&@�Y��i@�3����t@�p�k�@����:@�h)��@�q0vʜ@��b~���@�Y��"׍@����@�9����@�	@��C>@��o�˔�@�J�#�@�@ n@���t�@�j�|A�@�[K�E��@�Q����@�LǸ�X@�L%3�f�        ?a�p5BQ�?��)��U�?�R��n�?"�^�T?ѥ��*��?�&n�6�?����	y?�,T�=�?��Y#��?��]�=lo@~1/@ �@��L�'�@
z��%Y@���:@�P��'R@��+Q@�� -)@��3�]s@ �xu7�@#'h4(x�@%��d]8�@(F����@+ �w��@./�~�@0��4?V@2z��߷�@4Z ��Η@6ZP��@8}�ɺ�@:��	�@=4���@?��ym@AE��I�@B�1!p�@DFVbқ�@E�,+Ҝ0@G��� J@Is��޷w@K_>J�DM@Mf<���@O��&@P��>X�"@Rab�i�@SS���{�@T���s6�@V�/��@Wp�}�@X��{�@Z|P���@\.����@]�V�[}@_���h��@`��X��@a��@��@b��Yk��@c�ac9�@d�G)��@e�P��@f�CM�-@g�9
�Fq@h�IyZ�@j�*9^�@kI�{E�        ?'F#-ii?aE9��q?�:z���?�W��t�?�ʹe2�8?��M7G�s?�Q7;>��?蛊�N�?�wÉk�"@�мg�@������@��c�<)@9H��R@%<k�̦�@-�����@3] y��@9GV∉@@/<f��@D^��NB@I>�$y�@N�#|խ�@R�o���@V?����@ZN���]@^��K �9@a�n��7f@d�|տk�@g�v�@k����H@n�yF��@qQq�ƟT@sr� ���@u�3Th�p@x7~E#�
@z�d�7@@}�0"l�@�Zp�+ف@����hTM@����	��@�s� #"@�Y���_�@�ZE��@�@�uAc��@��b*��C@��"JU@�5��=��@�z��JH:@�Ϊ��B
@�1��=� @���Y�@�%R���(@����d��@�X�u9w @��K�lr@��A,)p@�R �I��@�E}[1��@�A�T��j@�G���5Y@�V����@�o=�@���Hb+@��3��r        ?>;��:g?q:���'?�m��D�?���S�?��3���?Љ��;�?�VV�42?��~/�<?�5�t@�J�W�@u�9{��@�~��@D��9#a@%"f5��@,�ٺw��@3.��/@9+k��@@�]��@DL�p,3�@IC<8HAI@O@R�e3��@V�X���Y@Z�uĻ@_�-�`;�@b�7�G�@e�Lµ�{@h΁����@ln9�N�@p3ˀ��@r]�d�[@t�j%��@wE�o��B@z�2�@} �����@�	yȒX@������@��F���_@���<q�@��rj���@��;�[�@�6hP��@����[@���"#�T@�jH�@�z�I��@�?�(P�@��ɥ��@�G��VY�@�k�eU�@���=g��@�Ŵ���@��Ѣ�d@��Lw�@����/�@���ǀ @�DYQ�cA@�w�xFM
@���O�@� {�=�@�U����P@��LùF9@�"��/�>        ?�.�<�׸@����6-@.lI�Lt@BNި��@Q|�]�:�@](NVI.@e���ϧ@o? ����@u05���@{���Oh�@��x�\w@��yj[[@����71@�بe6�@�m#}�@�^Dc���@�����/@��:�c��@�*����@���bv�@�"��C�@��H;4��@��\9��@�s{ޙ�@�A�t�q@��H��]@����@�B_���@��
pJ@�E$>�T@����A�@����W��@�@�ذ��@������@Ō�LRa&@�YS�T�@�@ҷ?�0@�D +�\�@�dB	�x@Ϣ9���@��p�6�;@�=t���@Ӌm�@@����a@�W̧]b@��1h��@�d���'C@��A-^@ܰ�$�7@�n��ze�@�b�I�@�d��֩@�~�~�k@���E9@�f3@��4	�.@�2Z���H@�RUR��@�z�]��u@�8{%�@��4�G��@�%��Ր�@�oe�/��