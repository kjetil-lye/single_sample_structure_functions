CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T110042        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
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
          <value>0.5</value>
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
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?k*�u}Sn?�I��>*?��e\��?�B�@D�?�1��#�?�ȴ���?�x���n�?�W�(��[?�@EءV�?�y��?�UP=9}?�i�q��n?���x�>V?���-�B?�	Uq�T@C���m�@��'LG@8a
Q�x@�#���@ȸ��qq@�����@�ג�>�@�[PjqD@[�k��{@)}�4/@	�W��$@�7$a5@=����@��Ic�@ #��1��@!B����@"j���8<@#�|�|Z@$�LO��@&[�r6p@'h��T�>@(�,��'@*�R$�W@+�Ӳ��@,���y�@.u-�G�@/���P@0Ä��@1���f�@2^���`@32�ɼS@4��*�@4�ȉ��@5�q�f�6@6����@7��%
�@8���lK@9}u����@:uK'�+C@;q�Lmݚ@<r6��@=wC�*@>��U�O@?�r{�G�@@PDJ��@@�ue�ʨ@Ahʱcu@A�A��}�        ?a_����?��t��H?�ؾ��?�e��!�?������?���2C8�?��`�*�?ٓ>I~F?�h�i�wC?��~O�j?�V�.�F?�]"�"S?��Nu�/�?�B�m�F�@ ?Y{M/@"ni���@L<5�h�@	�&r��@yt {oB@��g�@�l��E�@7��z�@�i�U/w@J�x	Y@J֭@�Gk]�@!���B��@#'z7�Z�@$�� 7�@&����@(�����@*qrr!J�@,x;�ɒ @.�2�ʹ�@0b�0c�@1���@z@2�5a�Ơ@3�)����@51��p�@6�zJ�@7ّ�ܘ@9>d��9Q@:�ON�6�@<)]Zu�@=�� ds:@?A�&"�@@n�r��o@AB�T��@B�B�
@B��VM@C� 츱�@D��f��@E�E(Gֵ@F��ºG@G�yC�ߒ@H�36��@I����|@J���J'@K��c�@L���]�@N^AN@O3�Y�@P.����[        ?k.&�%8?��
��]?�e�'��?���E
�?�jl�/q?���i�?�UG�3��?�ƿu�m?���¼:&?�+A�K�?����w?����2V�?��[X�3@�_�{&V@?ė~�@�v
S}�@�̓���@��$Eb�@�5�i�@RmҜE2@��>D�@�-�`I�@ô(�g@ v^
\S"@"!D-mR�@#�_�A�@%��;f@'�_ޠ�@)�ݻqA�@+�9�r�3@-��+��@0$k؈�l@1U��{@2�a�`Pb@3�? ��@5,�+Gh@6�����@7����D@9mJo58�@:���@<}�C�_2@>�� 9@?�wW|�@@��gN/@A�i1���@B{8j��@Cf;��d@DVܓ�Y�@EM�."�{@FJ����@GM�@�@HV����!@Ie��A�%@Jz��eH@K�S�b@L��Iu @M�`@��@OI�Ԍ@P |Q�\p@P�~&;�@Q]���@R �/K�E@R���T�g        ?�����e�?�]�sT%?̶��-�?�,P}*RR?�.�dW�B?�=f��?�@$D�C�@V��e�@	j�3ܟ@/n����@�z	�@q?x�7�@8d尲l@!6�D�	�@$n��t�@'�O(�A@*O~b��@-ÜYE@0���#�@2�ꐞc�@4�y�.�@6ւ�� @9߂V�@;oj�g@=���|@@8=���4@A���'��@B�T=�Q@DY��D�2@Eӄ�
A@GZ(Տ/@H�o��@J�M�"� @L9��Z N@M򥂆{�@O�A�?�@P�����W@Q� �y��@R�@S�?�@S������@T�!�|@U��D	�@V�T��@W���� !@X�;߾@Z>2���@[-�@#t<@\YNPsPA@]���O3�@^�{뷿@_�3����@`� pΤz@aE�&�U@a���V+�@b�9��@cDe|hK@c�r�2o@d�[�^@e]��f@f�e�{�@f���S@g�Dj���@hP<P%�        ?d�`9���?����E6g?�@"��?��U7%7�?�eП��?ɯ�\��?Ҫ�;N��?ٰ��`�?����I?�?宥brb�?�aX�\�?�x�p�uk?�s��vh?�Oʹr�L?�/�V7?�\��̷@��/5��@O���Ǆ@��b���@	��w%�@d�A?�r@d�Ԁ�@D��i�@�>�\(/@����<�@q��<0�@RA,�W9@F��Y@M(��@@g��+�@ J۝�{]@!k�6��b@"��)�r@#�"VB��@%���@�@&O��S��@'��yj��@(���V4@*`����!@+���>�@-F���{@.ȵ�yu�@0*�׹H@0��+q9�@1�����@2�F�}h@3qa�N@4OZF��p@522d���@6��#@7�Z��@7��"m@8g|@9��,��@:�;yX�@;�~�*�@<���/>�@>�� R�@?�\�@@��{�@@�,��B@A;���^!@A��SQ7�        ?fE��#�?�����?�E�O��?�x��i�?�EA�?�
U�z�?�8�A�"�?�l�[�-?�E;xp��?�4G�' �?�>�͞?�D�'�z�?����}ر@2�s=��@w�܅�i@J��ٗ@)Q;�@*��p��@�h�ge�@7�`\�@�"���@��;R�@���\'@ ���eW@"?=
g>@$�n0�n@&
�ٶ@(��x��@*>����@,��-��@.�m5�7�@0����Dv@1����Zs@3M�ZY4}@4�w���@6'<	X�@7�f3�@98�0�(+@:����9@<�P��@>=�� 7@@Ք�\@@�1@A�T�m`@B�:��U�@C�V�^��@D�x���@E�A��@G��qf@H)-x��@IN�N�Z@J{-dzy-@K�CӘ@L�KU��@N,Ŏ�c�@Ov��_�@Pc�?�Qy@Q�r�@Q�����@Rs,!+@S*B~��@S価���@T��,RB+        ?a�+���?�"�z��?�j���m:?���L��?�������?ɠ=���?�@���`?�X��z?⛫}���?�z��e� ?�T��dQ�?�e�uW?��o�ѫ?�����@T�ۏ��@hFj�#@ǎ��m�@t79r@o*�F�@�-r�@+oBG7=@���[�@DT��@ �O@��[�@!EfR��@"�g�/@$w�]��@&J��3�@(4i���@*4W���]@,J�@1�@.x)��c,@0^�W!@1���\��@2Ċ*5�@4���`�@5X�h��@6�T��@8Em�@9���`$@;�Q�1�@<�v[��@>)�hn@?�DdZ�@@�����?@A����a�@Bw�qd�H@C^���]�@DK&�7��@E=E��,y@F4���	l@G2BE�^�@H5J��@I=hz�+@JK;�͎c@K^���@LwC��+�@M�mm��%@N�����@O��Z��N@P�gq]@Q!�N	�        ?���	gh*?�ޤw<�?���.�?ٝ���]?�S���t?�z���{K?�f�*;�@y���.�@�;@9I�Zi@_Q�Č.@h�[']�@���F@��j��U@"��X7|@%X[��~@(e�h�v@+����@/ H^��0@1f�c�J�@3W����@5c-�U��@7�?T5G�@9��ZG��@<$�z�/J@>�1jca�@@�h�;�@A���м@CLo&�3@D���&9@F8�@�{@G�r`h�@IYl�`%[@J���G�@L��o��a@Nl���}l@P&�$
@QQ�E��@Q������@R�'kX۹@S��=��@T����@V~�7؝@W�ZgLQ@X3s}@YR��-�@ZyY��iR@[�.�Bkb@\�v�q�@^0�Վ@_S_i��@`M���@`�Ug�@a�V�?:@bJZ&2��@b����@c����,@ddʇ�ԋ@e��OU�@e���xR@f�Z�{{@g`��ؠ@h&���,        ?f��~�I�?�gf��?�Iƭ>��?��Ӛ�?�����o?�y��b�?�!ѿ�x�?�5-8�{�?�<*�/?���=Pت?�G;ԩu?������?��m����?�br��h?�7=8��?�V���hh@�	�`�@9}Ry��@��ktM,@	Z���@ ���@�1@�az��@�.��+@R����@đg�@�%��nK@����y�@�?Ҕ0;@��Z�@�V%*#G@ ��9�(u@"�yc�@#9V�٦[@$fQ�!��@%�����@&ىd,��@(�%��3@)m�z�m9@*�a����@,"�h`�&@-�t�~�@.�����@076Nv@0�`�YJ�@1�x��@2�zDL(Y@3Ka����@4+���@4��Y��@5�^�)�R@6����Ba@7{��6A@8^
�Wg@9C��J��@:-�9��@;��So@<��@= �`b:t@=�Y.�h�@>�q�6Z�@?�!b�@@|0IIkU        ?b��J�?���4\�?���}"��?��mi��?���<[�?ɔ���ј?� 3��/�?�V7��?�Z�̧d&?����##?�"�{��?�1i$=wb?��D���?�^z��	@ �B ��@�C�^	@�e���@
�� "P�@m�<,�@D�V��@xڍM�@�9Z���@Tj=�� @�˧jO@̳�,��@ b84�f�@!�$���@#�@hH��@%N��}j@'y7@��@(�����@*򴚉�x@,�KT��@/�	p@0�d�<��@1��t��@2�实�'@45`6�j�@5y^�&�@6��冟�@8 ����@9���ݦb@:�ߊS�@<k�`�@=�}>�@?}�J
�@@�ۅ팙@A\t�P�S@B3Y�;�@C�Sَj@C�jP�@D��Z@E��.��@F��{$@G��c�HP@H���]��@I��B"�@J� '�j�@K��%�*�@L��.D��@M�t��:@N��^�@P97Z�9        ?eo�O!-?��Vj�?��xW�S�?��	Q��?���o�?��V��}�?Ն5ό��?�k<�V�R?�����?����z<�?�7����2?�y�ź�?�KC�d#?��J�q�[@�2�W}1@�=��K@	�,��{@���/�#@����@5WC7��@��q��-@@��\�@J�%�]@��\�_@ �����@"-���@#�#wq�@%��JR�@'�~��r@)��g�|�@+��$��@-�T�j��@0W���@1:t11@Y@2rDɄ3@3�)8f�D@5��}@6^(S,0�@7����@95�IU�@:�$�S#@<<?�9��@=�BT��@?q��td�@@��=��@Ak��@BM��	�@C4��9e@D"�ȱ@E"Bot�@F�o(k@G��zH@H?�n�@ImL��@J0��@:r@KG�1��@Ld|k/JP@M�aO�ֺ@N�:���@O��{U�@P���5��@Q'Ql��@QǸo��        ?�Sy[��?�ڪ�'�v?ɘ���?��Mۂ�?�e��LS?��E�-?�t�X�@t���܏@���U�@S���@<�YTɯ@6�ͱ'�@����g�@_b\J�!@"F����@%��U/`@(H� �A@+<W)up�@.����@1c&��T@2��K�5@4�yǵ�@7	溑ߵ@96G�c+@;{���@=�˦�@@&��r�N@Am5>Wl,@B���*�y@D �_b�@E�t��@F��ؠ@HM�o� @J@�8Ȱ@K��g��R@MHZ�u��@N�H�Y��@PX���	[@Q;(�aw�@R#Бǧ@Sn��R�@T~`d
@T�n��@U�f9�W�@V����	@X���[�@Y�_FT�@Z!�� �Y@[9v6�@\U�ar�@]w	��@^�����	@_�O�ax�@`} �[O@a�ΐ�@a�.V��.@bT�����@b�8	�(@c��\&�@dB��XU�@d�o��X@e�E�Yʺ@fFu-��q        ?bN����?�C�q�5?���MR��?�x3mu:?��1���?�}���?�W����?�}p��m?ݱT����?����m�?�M�)?��o�"?�A���?�\�@��?���Z�ٷ?�Z��]>I?�;����@�#�II@��N_��@2�<3z@�7]�C�@7�LՑ�@�F^Ȟ@^i��N@סϩ �@`�֪��@��a��@�{���@Z��s̏@#!Z�3u@�֌�D@���/�C@�|�B�@ �TY�p@!���vɚ@#p��@$$�?9J�@%E�>�"p@&m�ͷ@'�/N7�@(��n��@*�����@+W��	d@,�k9�u�@-��ե��@/Qk�
z�@0Y��~��@1�G��@1śzWֆ@2���H��@3?�h�&@4�v���@4�r�.�@5����!@6]��U�@7-����@8 e��@8�-��G@9�87���@:��?�C@;ovEbS/@<S����@=:����        ?b��j�X?�(���o?��Q��n?�*�"FS�?�[��ۯ�?�q���?���-[�?�)^iB?�l��=?����a�?�_L�|?�	'�?��E�d��?��0,�o@����;@��[���@���1f@ʹ21@�jdn_0@��v�@[�{��2@�tu&�@r+g/�|@;
�i�@-g�*Ϭ@!$���-@"��Ru@$�2*)H@&M����@(0���	�@*(��� @,6��<�@.Y�m��@0IV�>�@1py�4��@2�^ȕ~9@3�/Nq�@5&g59��@6x�7�@7�V"�>@9<��	�i@:�`.�,@<+��C�`@=�<dRg~@?E;�I(�@@p���0@ADl����@B46�!�@B�6|1�@C�o�{"�@D��^ϖ�@E�u���T@F�;fG�@G�'ƕ@H�7Q]�@I�fu��<@J����hC@K�o�"9@LÎF�\P@M��M�%@N����5L@P)ט��@P�����X        ?b?k��?��vs>?���5��?�<`S��?��*��>?��=�S�?�/��æ?ܺ��<X�?�i���?��D��b"?��&5/�!?��\�eg&?�r[��9�?���X}�$@Yf<X�U@��}н@	4q7��y@Y#Aљ@����N@�(B�n�@gy��W�@p�@ё#�[@�P�2н@ w���@" (�Eϖ@#�%GW$w@%�*@�-k@'�[�Z�@)��u�}0@+ǼO.��@-�#��p�@0$�v5�@1U�s�6G@2���@3�J�G�@52��@6�o�@8��#V�@9{�N:I%@;9�W@<��H�z�@>0\�f��@?���@@�窘ӥ@A�ϕ���@B����_@C|��i%�@Do�N��@EhĻ%� @Fgת>4s@Gl�jCd@Hxa8>@I�>y$@J�l�l�O@K�����@L�զ���@N
l���@O9E�$k<@P7>���@P��`�,�@Qur�r �@R
�/��        ?���+�{?�Y�r���?�����7?�| ���?⼥D>`?�Y�|�u?�U�g��[?�^����@d}<�q@ʈ���@��g%�l@ӂ:�{�@��9�y_@�<��h@
)�l�@!�t˯��@$l:�idI@' �$��D@)���%K2@-����@0�9c%+@1̄YZL@3���i�@5h.����@7U�%�@9V��n�@;l��j��@=�>U���@?�����@A���4]@BH)��[@C����hx@D�)Mh��@Fn���$@Gys�X�V@H�&�A�b@JLt[6��@K�J��+@ME� �l@N�J����@P2(��8@Q �X���@Q�F��@R��k1M�@S�3"��@Ti.�ߵ@UNd�w�@V80�x@W&l�T�Q@X�ؓ@Y�=�@Z�%k>�@[S���@\t���@]����@^$�7���@_5�n�!�@`%�XO��@`�H﹨@aA)/�r�@a�"Ҭ�/@be1��w@b�Sj�Ο        ?k~ C��?�ss��?� nYaD?�l�ҙ?�J�{���?�����?�~�%k;�?�T$���?�7��o�?�g G5�?�7�Z�1�?�T_�*��?�܄��+�?���,	��?�ٺJm/�@&��T�@���SWN@�s�#@�6Pg1�@��UU��@�֔h�T@�� ޥ
@u�󔆨@*u�چ@�9�'�@����@�� |'�@��$�yC@��P��@�pB�@!��ȴ�@"0����@#\�D�@$�����@%�'��@'�Д~M@(d����@)�u`��@+��.)@,��z#��@-���-?�@/q��P\�@0z*19	�@1?�چj@2	dva�@2�D�s�Y@3�I"X#�@4i�S@5Y�W�Ӹ@67�H:�@7&}.c@8 f�ѝ>@8��r�@9ذ��x�@:ʩE�Cj@;�yA��^@<�A`,.@=��fQ�@>��H�eE@?��Ȗ�@@c,�G@@�_D��#@Aqk� �?        ?h�d��	�?�D�_�V?�ӷ|�?�������?Ēk�D�}?Њ�9
?ذ~WR]�?�p̬���?�&l\?�?���vXS�?��5�?����q�?�1�֩��@4�����@�z9�b@	x��-��@���~w@�!X��@�`
��@3�w��@F��Z@�NZ�\@S���_@!bb��y�@#4��i��@%!_�0�>@'(i���L@)J�PYY@+����@-�����@0(\�&ї@1oP��<@2���H5d@4&[E��)@5��K��|@7�3�/@8����@::YDGhM@;�"1��@=����@?[�����@@�����@A��g�'@B}���VJ@C{���9P@D���	~@E��*L�@F���f�@G�pH�]@H�TT��@J��iN@K31PEz�@Li��͒�@M�i[3��@N�(�_@P���XM@P�t��@QruIr��@R# t� �@R��\=�@S�����@TIݽ<T@U�F�r�        ?d����x?���?�"\���?�0�Y+�g?�6��'�?˼�V/5�?Ի\P�n�?�R���f�?��Y��V?��ƣ��?�<�aS?���޺y?�m���*?�����bb@<��/U�@p�$I@�"5/�@���a�@om9iF^@�o�o��@q��]�@��J�@G<D�ӧ@%��fw@ w �63@!�y���s@#a�Y�@%&j��_�@'���G�@(�n�k@*���M�M@-/�d@/J�����@0�1�%L@1�4̲��@35b�Eݳ@4{���c@5�N33@7*�;�@8��[�D@:%�鲧@;�zP=_�@=�20_O@>��R���@@ �Fsj�@@�6����@A�>n�f�@B�О���@C��Y��0@D��l��@Et��x�@FkE8��x@Gg^>St@Hh�P���@Io�0�$@J|v�l�S@K�g/�)o@L�Ȟ�@@M_!�@N���8ll@PA��@P�˗j�@Q6
�I;d        ?�\#���H?�fSU|{�?�5�ųJ�?޲@v���?�{Fl�-?��Wu?��� H�q@JL��@
��ʾ@���0b@`�&�@����@����>D@"U
��@$��q=&+@(# ����@+���@/#a��bT@1{����@3�G��+@5��C���@7�H��e�@::/VK�@<�g �T�@?=̹��6@@� m|7�@BVӌ��@C��^ݨ@EDx�h��@F�U��\$@Hg}<y�8@J�k@K�p�,c�@M��r@OK�A^%W@P���BgG@Q�$�v@R�x�,@S�%C�b�@T��/kB�@U���j�$@V�����q@W���@X�L�tk@ZPvg@�@[2���Ae@\d��E@@]�O�Z�@^��߼�@`4�2l�@`�}��@a]�ȏ@b��v@b��({)@ch+��(^@d�l=@d��l(�@e��Q��@fI'�jh@g�Ȭ��@gʴ$��N@h��\�@iW�Ue��        ?g7����?��գ^�n?�����C�?��NV�t|?�F2��`y?�KI�H�??�E�A$bU?�xЊB+?�t�^n'�?���n�C?�	�=sa�?���C��?�����m?�N��⿮?����!�s?��;j�:@y�RK@HN-&��@����*�@*U�0�@
�AXaJ�@��4v�w@@Dd��@���Z@\�Y���@���V@��Y�@�y/��@aj8�u�@Lq�|^F@H,Ző@ *"
��@!8pх�@"N��uo@#m��($�@$�*��[@%��Y&@&��>x �@(8<��	�@)~�|�)@*�cY6|@,#��B@-�x�+@.�Bm�:@0+"}��@0��Å�N@1��`�:�@2gn�m�@3-��0@3�TS�.q@4Ƌ�t)=@5��^��J@6ns!�Fk@7H���@8%�B�@9���@9��L�!�@:ԋ#^3@;��h�@<�M(W�@=�H�RT@>���Oce@?�h�<w�        ?a�K�H)?�c�����?��M�'H?��DҲ�?���e��K?�οw?z?ҭ���[�?ژ�2-�&?�"Ar�,�?��� \�??�鋊�'?�1�؀N0?��.T;f�?��*rpY@+����@�z2k�@_92�S�@
��L^�l@��`M��@�5�)W@Շ�#W@A�6��@���H	@����j�@{Ѿ1@ �P���@"c���ǂ@$C�@%�(1xF@'�Xg*�j@)� P��@+��Vp�k@-Թ�QZ@0_E&��@1)X��j@2YT5E�@3�ZX$
�@4�s��'{@6+��_[@7��ķ�.@8�t\���@:bTf��@;��0��@=h�D��_@>�)hl��@@NNH���@A#�Pd|@A���;��@B�7W�Ϡ@C�tKJ�=@D�Vn F`@E��`}�U@F��ݸ�@G���mE@H�q/�@I��oe�@J��w�q�@K��R'c@L�L��Q@M�8��x�@Oפ���@P%���@P�Ŵ��        ?f\ \��?�"y�gU^?����di?���w<�?H��Ӕ?�ʋȃ��?�=?�{��?�mC�DZ?�I����?��3�Z?��d���?�1�1�D?�,ɮ�z*@ `A`v4&@xWʒ;�@�}�]cv@
�d+d�L@���N�2@����c�@��C=@h��LL�@����@�m�B�4@���J�@!#��X�%@"ؽ�ɇ"@$�{�l@&��+s@(�Z�GQ�@*��<�@,��6Qw�@/&��V�@0���o�@1�&@30�Oxf�@4�&_��K@5��y]3�@7L�N��@8��9@:G̛C�^@;��/滺@=t�����@?��H�@@i�D�q2@AJ�ngg�@B2)9{8@C���@D�D��v@E�`u�i@Fw�^�@G@O�@H"O����@I5��"@JO?,�6@Ko�#T�@L�?-ݜF@M��I��C@N�I5�E@P�)���@P�,
�Y@QX����@Q������@R��Q�|        ?�n�6�Zv?���7�}0?ǮLw�X?�Py��?�����?�Dd�8�w?���>u�#@ -�mj�\@T�ۆ@;��T�@�jn���@�q��YA@��\�c`@1�JW�@!h覴@#���O�y@&g ��@)` ��'@,�^��B5@/߸�a�/@1��l�@3������@5�gΤ�@7����Vu@9�S�9&<@;�N�~�@>/��7w@@J�5��@A�d��Q�@B�`�]��@D(�]"��@E���߅�@F�ꈇ�D@Hm|���@I�Y �T@K~t�7x@Mƀ.�;@N�ET��@P5�Y�@QT����@Q�? ҍa@Rޯt�MK@S̡�v|a@T�=��@U��e�/@V�X��=�@W�(yU��@X�e �l@Y�
�8[@Z�7_!@\ }����@]B{u�@^C^t�ٹ@_lͳ��@`M�O�W�@`���{	�@a�v;��@b#���?�@bųOe6M@cjC���@ds^��4@d�A73Q@eg���4g        ?j�D�*T�?�͛���?���u���?���#Sc?���U?���L��?��ML�?�.N�-'?��h3?�����?��{
t�?���d��?�����=<?�{g�^{�?���(�g@�>�n@(����z@���elw@	�����@��X	V@����@p#%<��@%W��ډ@�nd� @�E{�~@����E@��{���@�'�<�@�Uz��@ � �-,@!ȥ$�
@"��%�@$6�n)� @%{򏗰�@&ʺA:@("�«�@)��� 	@*��&�@,c⃘��@-�|jkfw@/hVsky@0|3Y&r�@1H�f��@2���@2��Q��	@3�#�T�@4�D�]_@5�r-,M@6tdcX@7`���l�@8Q�Ίו@9G5�b�(@:A�^�@;?lT��@<B0���0@=IaiU�~@>T��-i�@?d��@@<�,�'c@@��7�D@AW�$n@A�j�Z�@B{[�Y߿        ?if�$�?��o8�2?�W�Oɕ�?�uq����?ŵ ����?�PK��p�?٤��<��?������?�3����a?���p��?� �(�2?�ֶ��|A?�Ju��*�@0�C@��+��@	@�y.4�@IyQ��@���!�@2�;Z@�C�QY@t3�6)@Zj�"��@o_v��@ ��@"��x��\@$ek�&�A@&Oc�L@(Q�h�k}@*lh����@,���;��@.��W�]�@0�Sjr�Z@1�7(�L@32��֊�@4����m@5�� j�z@7`1|F'@8ݨ]	K@:g��@;���~�5@=�1Ɯ�@?R"Qv��@@�]���@Ak���@BV�.� �@CG��D�@D?YJ?P�@E<� Al@F@�5M��@GJ���@H[G���o@Iq�#}�;@J�uq��@K�K�]a@L�F��:�@N	bB*w�@O>���
O@P<�����@PݦY֑�@Q�_���@R(=���@R�ⱱ��@S~�m��        ?f<�c�V�?�hAGb�?��:�3&?�
���?��5Ϳ�>?�R%�l3�?֣��DՒ?��+o���?��O![^?�gb�..?���2 �?��7��$�?���<^�@ �k"Z�@�d����@Ih^K�@�퐚T@0jj�V@�w�z��@5�r�<�@Ŝ���@�Z<���@iY��J.@}�~��~@!_��/�@#�w	0-@$����:@&�`�2�@(��o_@*�:H{+�@- ���Jp@/A ���@0�>Y�GA@2���`�@3FdI�.f@4�͏���@5���[�@7TD,��@8�JG�@:A��(�@;��c��@=]G�םt@>�)���@@S8�zLd@A.q�Y_@B�}j\�@B���4G@C�xq�l�@D���JXF@E��o�u@FŅ\Fn�@GǷ���@H�z��7@I��$��@J�~���@L��\�@M%ޢnBh@NI;���@Or�!�3@PP/�{g@P����m@Q���H9@R%��W��        ?���ǧ?��q�5�z?�y��?�B��2_0?�EV���?���JU�?�B�?Ut�@Y� sP�@�F�u@�'8�}@|��@׿��@ b��2�@"�1O�0@%�/�@)G=Ks�|@,�1PE`@0Nph��@2P�%�3�@4pbQ��F@6��G� @9���`@;�+��0@>����@@d�0'Q2@A���
�@CC��2��@D���
d@F\��Qе@G�ߨ��P@I�����@Kn��J�O@M<P�ۍ@OKJ،@P�P8)u�@Q}���r�@R����@S������@T�J�׆@U��x�D@Vջ�#&L@W�}#:@Y*<s��d@Z^���u�@[��p�@\�9xߎ�@^&���`�@_wOQ�Z@`g.Zs6�@a7��=@aȧ�7@b~yk�v@c7�H�`�@c�9{�@d�!	I�@ew_$w|@f=�(gH;@gԦc+�@g�th��@h���Z'�@iyS�9˳@jPj�au@k*ˮ �P        ?n�����<?�'k�b�7?��<BX?�D�U�6?ƕz�&�?�v	�Wq;?��'K�?���Ƕ�?�^b�5Ö?�^�s�C�?��w�4?�D$���?�XN�%�?��B��k@H�nz��@�	z�#E@��{�|�@	�!Nsb@��m�E@����@��WfD�@|(8\Z@a�%��@]
�H�@nB\�`%@�-|��@Ѷ?y2�@ �_q�@!E��d�@"��O	�@#����b�@% V�
+�@&~2�
j�@'�go�n@)X�?W@*ՌP�&@,\V��^�@-�/���@/�9L�=@0�i'-��@1m��TKE@2J�@3+BB��E@4ay@:@4�ftt�2@5�P�+�9@6���p4@7�Λ7��@8�^��m�@9����#@:���@;�6R�@=*�M�@>��0@?6{��_�@@+g.YX�@@��@AR����@A����@B���K��@C�,��@C��G�`@D^T�)�h        ?g���S?������?�>@���?�6����?ô[�tiZ?�o�(
K�?�J�1�'�?�X��A�?����L?��au�?�6��}	�?�������?��*��+O@ �ǢD�@��z,�5@��Rl*@
���4[?@�����@w,��.�@�a�%z�@:Z#~@�q�+��@��ߑ�J@�I|:�@ �O�jN�@"{�� ��@$47��!>@&1����@'�~��@)޸ܒ��@+�v���@.�;�@X@0&* 6ݪ@1NM����@2�o�;@3���>��@5�	��@6]9�y@7�x7o�@9&�E@:��ȹ� @<4��J�@=���p�@??���q@@p�5F�@AGw��!@B#��I��@C&���@C�H��@D����@E�6P�@F���=�@G��]�G@Hvx@Iʗ�[�@J�!��B@K�֓�@M�Q���@N!d�Tl�@OD��J�e@P6�>�2�@P͸j�pG@Qgu�	0�        ?h��z�?�9��lɿ?�ƶ��.�?�ݣ�J�Z?�`��5'?�U%%��?�O�M7Z?�"�ǜ�m?�+�_�?�RZ�c?�Q�ٜ��?�����?�|Q6�)x@��&%2@!�M�7�@�6j:�@�o�Ƿ�@�E�W�@>����@���K:R@n�@g����@�12=�@ ����U'@"�	-�@$�~{��;@&���P��@(����@*�"��.�@-G�,b�@/�x�� @1tq�u@2p��M�@3�3w��@5?�L�X@6�
u$�m@8H�&�`�@9⾸1�@;���\dg@=C�
55@?	Y���!@@oH_.9�@Aa_���@BZ�X��@C\*?[�@Dd�+6��@EuX�앇@F�mD�I�@G�7\�&�@H��|�@J9�{@K;/��o^@Lz&�$f@M��y�@O�^�;k@P3.����@P�z%[>�@Q��L��@RMjzQ�@SEtך�@Sǈ$A��@T���x�@UR�)L        ?�ڢ��/?����?Ь��z��?���#Fn?�Rt<#?�q�Fh=�@ #�Zw�+@���!�@�!�H�$@U,�"z2@��c�@����@ wP�W�@#a]3w�@&�� ��@)���˔@-��C$�@0�fٰ�@2�w�ުR@4��<�$�@7<��[,@9�ڱf,�@<-�f�@>�Yc�#O@@�̔�j@B;^Ϻ��@C��=��@EI0�g�@F�Y��#�@H�D�T&@JL����@L�;��@M����\ @O�4��,@P�W5t�_@Q弊a2#@R�2"�6@S��L1fx@U���Y@V1|�qN@WU��xq@X��Bkp@Y���,E�@Z��T/�u@\+vW4�@]q���z�@^�K@�Bd@`	�����@`�*QA��@ah�)�@b:�I@b��e|�x@c��G�*-@dM�p�@e��N�@eӼp��@f��L@gg��j]%@h6���f�@i�O�j�@i�\���@j�)G22�@k�=P�        ?e������?����5�?�G�@�C�?�����c�?�&d��s�?�!Z[�[?�(c�N�?����hR-?�Uc��B�?�ɏ��Ӳ?��c� 5%?�S�'|T8?򳦻nuU?������?��� n�?�g�fz�@ ��I��@�ۭ?'@:���@���B� @
9���;@�k!��@�ȕ�8@V�(�@���e�@y6Q�V~@"�Jr[�@��~�!=@��0O*�@~�3��@f�k��m@_��_�k@ ���pk@!���-6@"��q	e@#�k+���@%�6��g@&>�i��@'p�[�@(��l��@)��m�@@+7�ѸR@,�����!@-��	�@/C���z�@0V:r|I@1J�!�@1�"Cv��@2���^=�@3M#<<@46c&�@4��,j@5��8��@6����@7V����@8/�﯒�@9l�i��@9��%��@:���.��@;���>��@<�%!��@=�s$�t�@>��)MO        ?b��HD��?��Jq{�?��|�i:?��k��?�H�,�[?�``/s�?��[m

?� �W���?�!�S�|�?�(ِlyO?�H��_?� �zhL3?��P�A�?��,�8�]@�O�a@��?�}@R��_��@�ft�G@a�T�@7�<"@�˪{��@�g�@�{K�o@}���@v�k
�@!L�^��@"�TI^�@$��f� ]@&�ڬ�@(h�ңv@*d�#�@,w;�/��@.��z�c @0n��6�@1�c��@2�O���@4���p@5Z^4,�@6���oT�@8x��@9z��}@:���6��@<{8"�a�@>	�1Gs�@?�C�E@@�����@A}+��j@B[��e@C>�h�K�@D('� ��@E9q��p@F�N���@Gy�R@H�����@I�#�@JJ�X7�@K)��t�@L@�,f�2@M]���\�@N��V��f@O�_�ǣ@Pk�/Zc3@QJ6�        ?d	�����?��I�?��?���Aj�?����#(?�1r�$�?�c ��r?�r� #̄?��$�K�)?�M�Ь�?韂���Y?�T�v��x?�[�s�?�����<�?��&yiA@����@�Ӕ3�@K��%��@�x��@�_+�F@�h׳@^�:$�@�SY0�t@`���@�
�W�@�S��dZ@!�Gj�@"��$+@$I 0���@&	/B��@'�45l)@)��@+��s
�@-�Yu|��@/�5��&@1z�-@2:�>n�4@3j[�k�_@4��$bq�@5�l�@73�i���@8�#W@Ұ@9�;Z�_@;T�&��h@<�Te`M@>E��Cſ@?̿�l��@@���ն�@A{��m+@BM�>�z@C$?a'9?@C���d8�@Dߩ:��@E�k>��@F���5 @G��/��\@H��Ƿ=C@I��xF�O@J����$@K�4�9+@L�'DE��@M��Ef�%@N��1�yE@O������        ?�
$���?�c�+:n9?ǠY�m�?�$��Ҥ?���S�?�Pݻ�0?������@ 7����@^#�B�@C�.�ڭ@�����@������@���)�@'���@ �ܚ���@#������@&U�+�J@)I�o��>@,l[G�S�@/����>�@1��a�@3v	�?�@5d�O�Hv@7jW��@9�K ��@;�_BZ�@>��1�#@@4V��A�@Ap�͜�5@B��w��@D\ڏ'i@Ek9�x�'@F�{�z��@HK�Љ@I���[Y@KXc�x�@L��W�CN@N��{A'@P {�U҈@P�&����@Q�j��V�@R�D��P@S��Z�<�@T����T�@U�:���?@V�O~�@W��Ȯ5@X��|�C@Y���&�{@ZͿH��R@[�Sڧ�K@]`�}��@^*�l�/@_Tߔ���@`B(� @@`ܝe�0*@ay����@b��{�@b�`����@ca�����@d	۟�5�@d��5��@eb4�gY�        ?b���7?��PR�Z?�;��2?��	s�?�F'o�?������?к��O?����?ނ[�ʯY?�މ��?�\�� ?���JQ�f?��5u	;�?��"1d2?���+�5?�k	}.k@ ?|nmF�@l���O4@�}>O��@1wJ�_�@	Ⱥ?��@�B>35@aB�@1��I�@�=��̚@g�9��@��XD@���{�@���|�p@�<��
�@��ĂdV@�y��@�@ ���@"4��so@#"�G���@$L頏T�@%쉸��@&��y��@(  ��]M@)MC6�X+@*�`Y97@,pU��@-hg�/��@.��f��@0'��)�@0�&9{|=@1������@2u!ՙ4�@3A��4#h@4�@�ǚ@4����@5��0��@6�SGY;@7O (��@8d�,R@9N���@:;p�H<�@;,�<�V�@<"8?�T@=��%5Q@>�1�r@?�A�@�@@q���        ?a���e�?��ǘ�~o?�72���?�VFaCz�?�j�;�V�?Ɍ�d��?�B&�E+�?�q߃��?⺜�d6Q?�'�R�?�6�i��?��%9�S?�tp��n8?����g��@��1Gr�@�yz���@R@L��`@��s�@꛳��@VӇ�zx@�Q�}ϰ@I�'6�@u��Ne@�4�J��@���_��@!�A��9@#V{�L��@%$�K��@'
;���@) 9@+�&��W@-G��9�@/��v�L�@0�3~�@2-�æ�Y@3s����@4��'�:�@6$2�:��@7��׊.�@9b8^�-@:�T}6��@<����m@=��9�@?Z�jՍ�@@���^Y@Ag԰Gf@BNNh�w@C:��<��@D-��t�@E&��S�H@F&T��Ϫ@G+轤�,@H7�)�cK@II�W��z@Jb ���@K���h�@L����y @MЮ!b@Ov�!�@P�t�u�@P��oVSb@Q]��tHc@R/�}�:        ?aӀ�Aɰ?�0j,��?�Wa�l?�?�i�$�}W?�n�o0��?�t�"3m�?�����?���z G?�pQ����?�;e�M�?��}P̰?�\��ñ�?���C���?��9��ͷ@�c8+�@��1��@X~C�@
�ǗH�V@�|�BU�@w˖�=@����A�@�Q/�c@�L�!@I�v@c���G@ ��ОЅ@"!��I6@#���Q"�@%�=�ȗ@'Sw��@)74G��y@+/C����@-;���@/\�G�a@0��P��@1��#&�@3�����@4VS�P@5��@�H�@6�@�Ȇl@8?6��|@9�fA�E3@;��  1@<�n�$s@>E3=��@?�O�<�a@@����@Ab{��i@B7HbT�@C(�:Ν@C��E��@D�!��^@E�6�.d1@F�Y����@G����Om@H��-���@I���k�@J�R�@��@K��r��8@L�����O@M�ZIK�@Nѹ�d�7@O�H��        ?��Z�C?�7�k><0?�Ӱ�m�?Պ��{?�ފ�ʮ
?�� I��a?���`L��?�����F@��9�r@	l����-@��Mih@i�xQ�"@P}�o��@�r�0&�@ 6�	LC@"���+�X@%Lŕ2u@(*<��;�@+78�QB�@.r�v�@0�{�5v@2��$�|@4�č���@6����\@8��ɼ�%@:�/�)��@=����@?mG�@�@@��*��@B0��N�@C1�v^p@D�d�{�@F>K�Ӄ"@G��Pc<�@I+�j�@J��Ma!�@LEAU�~�@M�A�0 H@O�wج��@P�jB��1@Q�$I[4@Re`��w@SPy��!@T@>I4�@U5ˉK�@V0���(@W0���-@X6{5�k7@YAEЗ��@ZQK�Fo@[f��L�i@\��{���@]�rv�q@^�[<�@_��O��O@`���;U8@a(����P@a�nn�)@bc���Ƶ@cK�$�^@c�-u��@dO4xj�@d��LD�        ?d�9�m ?�d��=D�?�
O?�����?�lx��?��p{�?�49���?��ƨ�3�?�uP�"vx?��י�(?�����?��3�Q=w?����h?�k��:>?���[�?��P�)�@*�0��@o@�s�@׺DN�@d"�ܾ�@og7Z @�0c�@pR3Y]@�D��7@�$�0A^@O�?���@����@�<���@з���@�`�I@�A��@ y"���@!��[���@"����	;@#���1|�@%9;�@&F�l��@'��u�:@(�K� @*,�;�a@+��b7o@,�E�ن�@.bN0n�@/�.8��@0�q4 ��@1s�8�0@2=Z�^~�@3c�E˂@3����D@4���>~@5����[�@6o��@7R�{�"�@8:�KnDc@9&���3@:R�ǒI@;�'q�@@<�֬�1@=�$m@>f�e@?sБ� @@�7Dc�@@��!���        ?c�!�g�?�;���?��X�'�?���m��?����B?�M݃�${?�lu��?��IB	@?�d�6JH?�71C@X?�d�L+�?�sg���?�
��;W5?�-����@��zy�@y��m@��Ƕ@8��T@ޱ���@J���N�@��Z�@�+��@���y=�@���Kt[@;��{@!O�խ$�@"�`��<S@$�$�P�@&�Y?���@(f�S ^@*a����c@,r�Bܺ@.��ܰ�@@0k{Li�@1��t\f@2ɭ6�t@4	i�㟷@5TJF�L�@6�Wb��@8���V�@9x~��@:���)@<r���!�@>�� 	@?��;|�@@��ۭ$@Aw��Q�@BU�g@C8�d��@D!�D#@E�Hc1t@F�8ҡ-@F���2H6@G�h�^�@I���s @Jf��@KӣA�
@L4�h�@MP��:�@Nq�}�J@O��DtVb@Pb���O@P��X6�        ?b���@?��	��r�?�u���?�����4?���8�cn?�!��N?�T�X��?��:�R=�?�0��>�?��Ljy?�{W�7"g?����7_f?�I�����?���7K@.����
@e��Ỗ@�-�C3@��0�n@r�,�T�@�
�@�kkd�@��<��>@^��P_@DV8��@ *�*U@!ȣ'2Tn@#|��kj@%F�R�>@''8k��@)����@+*����O@-NF�@�@/�;k�ݾ@0�aY �@2�i�o�@3^��֫�@4���f@5�����W@7_�F�î@8�
��@:C��C�(@;��X&d�@=U`��2v@>�C�<y@@JF>�M@A"���g@B ����R@B�f�z�]@C��,uRC@D�+��@E�ᦖ�U@F�v��ua@G�«��x@H��V�Ч@I���iJ@J��[�@K�'��5c@M0��@N&���D7@OO J)3G@P>�T�k@Pؔ� �@Qug�6)        ?����M?�����?�q�Q?�IE��d?��T��?�XAz��?��b��@ H�a<��@w��CM�@ge�-X�@�=��X@�BF. @�H
~�@Pa�oj@!��G�@#�v�Ψ9@&u���H@)m�e�e�@,����=@/�
rp�@1� ���b@3��~���@5�
F�Ou@7��[ t�@9�Mb�h@;�R�{5@>0�`�xO@@J����8@A�N!Z 3@B�00K��@D(�|�,@E��:�
R@F�(_Jj�@Hn3�I|�@I��o� �@K�����@MQ��Uz@N�S�*q�@P9g@Q�)��Q@Q�0E��@R�zA9�@Sտ#���@T�(�0.@U�J��~�@V�"'�@Wͬ �4@X��3a@Y��f���@[O4ÑA@\ v�հ@]C7�˟*@^k�V��@_�q�5��@`fo۬�@a�-�@a�$(��2@bD�:'@b��9�.�@c�A��K�@d:h�|��@d�EأCF@e���7�X        ?e��i���?��H�p�?�{����?���!A5�?�"���e	?�07,J��?�@o<J��?�
���?��D��?�	c��ʄ?�$�Ld�u?��`]�?�q&�[R?�g�Z$�?��k���?� ��T�z@ZL��z@V�vo�@��h�%2@4�J�]@
��T�@�>�E@>�+�@�d���@S$��!@��*��@�uԡB@lA6���@?gQ_� @"q�Pֲ@MP�`�@ ��mp@!t�V@"&M�7@#>�&�\�@$_?� _!@%�km��@&�=G��@'�2)@)-�e��I@*t!D`@+���@-�m�!@.s��g@/�8�^dv@0��`�@1Y����_@2l��N@2�[�@3������@4`��3�@5*�ǋ�:@5�:x�G@6����h@7�D
��f@8t���ڽ@9O��i�@:-��Ye�@;Դ{a�@;�\����@<���\�@=�o8��@>�/cG�y        ?bƍol�R?�.!RK�?� �q�r?�A$�Ǹ?�|g"]�z?ʺ��I�?�un���?܌�ј�<?�o���?锩��?�`�%?�F7ex�?�0\��~?�rֳ�R@&v_y��@a:t�1e@�w�@�{@��2�_F@zPy�d@�/���@&�����@�;ߥ��@��Z��@n�4�@ D��ݨ�@!��[T��@#�ۃ.t@%u�X[�3@'_ܤ^�@)_��'�@+w�M�@-��hǕ�@/�7���@1'n��L�@2cP@p5/@3�O���2@4�{�\�&@6_��@}�@7̎�p-�@9E�@)��@:��\��}@<\�_��@@=��f<4@?��D��@@�z���@A�h����@Bx����L@Cg6r�J@D\`jO8@EWd���@FY
Zf��@Gal�*�@Ho����@I�ew�@J��7�{@K�tX�[�@L�x�p�@N^�,3�@OM��@PD���E�@P�w�@Q�x�@R1���z        ?c����A?�FSLBL?��;˿I?�ŕ�	?�ב�@1?�'s�?�N���	~?ܽ��i�C?�~�ޠɮ?�d�ԗ1?�UO��-�?�fL��?��0�?�*�.�@�W�~[@o��IT@�;׳��@VB��}@4�|X�@gDէ�5@¨ct�+@G�o�T�@�����@������@��d<�@!�dЅC[@#1ԇg�@$��[�JT@&ѩv�#�@(�o���@*��r�@,��E�@/"6���@0��i@1�_�L�@3)�d��@4s<��@5�AZ�v�@7+*�@8��J^�@:��)�@;�����@=*�w�C�@>Ȝ�	��@@9^5T�t@A��k@A��Yi��@B�%�j@Cʇl��6@D���X�@E�Қ���@F���R�@G��T���@H���,�o@I�(��
�@J��t�#@LE���@M82'�@NcXۜa@O�'��Е@Pe����6@Qo"�W@Q�9Ȇ<�        ?��k�N��?�1X��l?�f��W��?��I�e��?��n	��?�D��"�?��&��ɪ@ 4��~/8@]c���9@E-�� @�����@�]����@��	@#���A�@ ��EI��@#���?+@&I�*��@)7j�:x�@,Q蟴�8@/����3�@1�(k���@3U�$"9@5;M: �=@76jvF�@9GB�X�J@;ms{-J@@=����^�@?��K��Q@A/��{pe@BlәZ�@C�p1;9�@E[��̰@Fb��=Ap@G��zɭu@I9nl�f�@J��l@L8��X��@M�X��"G@O_�\�|@P�$�c��@QW9��+D@R2&'�^�@S�@:eS@S�\��@TߐZ��@U�o�tk@V��[�@W�;Ӷ�@X���6�@Y��6���@Z�ID��@[�Be�D�@\͜xm�_@]�O�b@^�R�|�@`���	�@`��܎�@a(~L�jX@a��f�}@bQ��Z@b�B��=�@c����j@d�U`��        ?j���gZ]?��5=|g?�ri�0?�~[���|?�Eu;u��?�u5*
�?֮F�?g�?� ���?�Y
�t?����o?��e_�?�~8sAk?�G,��qq?�fm��5?�۬�|�@SNGb @�yuj@�2�zPj@
�T��'�@��Z���@f�٭@��^��@�4ұw@�^<-@��i�@�E�G�@��C�@�rCC�@ ���j�@!C�Nx�@"x:�s�@#�^3��@$�Si�D�@&P�7�v@'�����~@)��0O:@*����@+��!�^@-z �W�.@/��]�@0Mb|�B�@1��Jd@1��u}�/@2ɀY�@3���_%@4�5�S�@5o��6��@6[*�]׻@7K-21K�@8?̞|@99���@:6԰�AR@;9676�<@<@&��C@=K��
�@>[��B(�@?p HnU|@@D���T@@�H���1@Ad<��@A�g��@B���f��@C$]���        ?iSj3�?�g[�{��?����g�?� �!��M?Ł��?�:����X?١����?�jE���?�c�P�M?��4o�X�?�LR�=��?�H,1mY4?�����@�8�G?@��,�@	��)`hh@(!G؆!@\��(�g@��(i@}0��@U��)@@_׷�#@�U4A@!�k��YU@#T^�i{�@%=�"[c@'@�#�:@)\��(�@+�2�C@-�T�7�@0&�	�d@1h݈W�&@2���`�@4��Zc5@5~!0
F@6���[f�@8y&z��@:
��p�@;�v��_�@=U��-]F@?VBGz@@k7�DRU@AU�=�gc@BF��v��@C>b�^�@D<�w:��@EBk&Ǣ@FN�Ť"�@Ga��(�Z@H{���T@I�l��U�@J�Q�Go@K��/f@M'��D�@Nd>k<v@O�jL]��@Px���@Q!=D�`t@Q�1��c@R|�
��f@S/�1�@S��|b�@T����6        ?eLS�4?�<��p�t?�I�]�k?�,�Yz��?�¿HD�?���[f�?մ����#?ޭo1\U�?��';`�?�;�]��?�^�`�w?��ؖ9?����ݚ�?������+@%t���@X"ދL@	�g8L��@�bnP@�@*Y@g��7�@�\��@��@K�֚ @B�US�@ ��#r�o@"Y��QB@$*��@%�sO�B�@'�	k��@)��@@+�Im��@.��@0-AT�d@1ZDIA*8@2��'��@3�X��w�@5%x����@6���N�@7��8�@9W|$���@:�s��F�@<\���@=����>�@?��5Z�@@���(�6@Ay:G�3�@BZf|~�M@CA`��@D.*[0	5@E ��)+@F-����@Gg�]@Hq�!%�@I%J��z@J4��8@KJd`���@Le�~ڑ@M�����@N�rR��@O���4�@P�)[�u@Q"1֦�Q@Q���i�        ?�N�Lh?�(.���?�y���n?����6=?��ޕ�?�d��Z�?�)��N�@:.�3�J@�a8�@��~(�)@ �>4�@�N�rw@ zO<��@"�[���`@%��<P�e@)J���Ĝ@,�0��l@0R�L�c�@2U���)e@4v	�@6���~@9�:O�@;����C@>Q*�D@@f1?>h@A����b@CA����@D�N����@FT�"�Ѳ@G�$��s�@I���M@KX���T@M�W_�@N���>�@Pj�È��@Qbg�.�@R`����t@Se1�S��@Tpiʹ��@U�#{Ô@V�U���@W��;�t�@X��Z�9E@Z	]�aF@[;qm`�@\s$udu@]�<�]ٯ@^��4`�@` $EV@`ȇ�/��@as� ��@b"���\�@b��;N@c��s���@d@AH�]�@d�ܼ' @e�u@���@fyZ{-@g<��EU,@h��@h�v�u�@i����-{@jh	���        ?bq���'�?�{`Qu&�?���a�?���o�t?���|�?œ���/�?�j~����?ը�4�?ܤ�{���?�Ve$���?��3�Eq?��>F}�?���W�?���\{<?�-0���?��ς{��?���LJy�@L�]r4@x���@�1���W@2�>�5�@
���r!@os���D@NR	�U@�[;�;@�ԉ�*@�����@^�"{��@�|e2@�'�J@����y@��،�h@�o~��@ ��zx@!���>��@"�~��@$���@%&�u0�T@&P�i@6�@'�3�}$?@(�P�8@)��/��@+Dtj|�V@,�q�UM@@-��5�g@/K��m�@0Xޢ���@1�1�L@1ʮ�.�@2�&��S�@3KN{�f@4!��Q@4ښ�ֲ@5��+�8�@6xm�N��@7L�}�h#@8$����@9 ���-@9� glS@:�����_@;��S�H@<�F�y`�@=~N��x$        ?`�YHYB?�"��7?��\2m�B?�װQ~!�?��\�)?Ǉ�1��?��ba�Μ?�Y�ۘa�?�Rj���?����?�aP ���?�p�����?���NN�?����XK�@ m�� C@c'�Cy@�t.�P@
-itmoY@�;�Ys@��@Q@���M@��Rx�@A�;dj@���m��@׺$P�@ q	��[@"��,�&@#��;���@%�)%�	@'\���(@)M�5�@+UQQC�@-rI>P�:@/�����@0��}m�T@2'���F.@3b���@4��i�-@5�3ܴ�@7V®�p�@8��aG
@:1mޥ�>@;�����Y@=8��Q�@>�X3ت�@@6�GN9-@A�"�z�@A��JW�@BǕF9�@C�ȈI��@D��oH�@E��H�V�@F��UK�@G~f�x�@H�~�j�0@I�(�K׸@J�c�}�@K�.t6f�@L��d��@M�p-��@O�^���@Pq�v�K@P��?���        ?c�m;x%?�~!.s%?�Mt����?�d�t�jL?����)�?��~nd�?�Q[�x?܇���?�d'9���?�|��(#?�L�N9kP?�a��=�m?�z���H?�5���i�@�2
%��@-�~*�U@�=����@x+�زA@J�;E�@�ۇ�@�,��/@p�t0�@'f�LF�@	Nі��@ hy�W�@!�%'NH@#[�X��@%$1,�l@'�Ɋ$�@(��B�J@+�]���@-)�]��O@/c����6@0�p���@2N'\6�@3M��Ҝ�@4�^ �u@@5�m8j@7PN&�n)@8���H�%@:64���z@;�hbԛ*@=J$�C@>�Ri��I@@F��{?@A�� @A���K��@B⋾Ь�@C���w/@D��%U;8@E��1��@F�?!�! @G�~���]@H�w��&�@I�']X��@JՌ��}�@K����@MnmVr@N.�:���@OX	�n�|@PCj��έ@Pݤ"ڿ@Qz����m        ?�����?���R��(?ÿR9C��?�P`Ո�?�@�3�?�ҁ
4�s?�C<O�?��N����@|�V�q�@�����@�7�vs�@
�m7�@��]��@�Q�?��@��eb@!>�h��@#�1s4t@&\Q	�ۃ@)*���@S@,$���@/G��H�@1J��!�@3i�3�@4�-rG�@6�����@8� gt7s@:�*2�@<�%fp@?!����1@@���j��@A��>�n@C!W�ĕ�@De��&��@E��S/�@G��W�@@Hm�g�@I�ÇQ��@KOdIJ��@L��u�o�@NW�z�a@O��%��@PÙǆ*y@Q��3�i$@Rn�+}�@SK�Mp@T,|EG��@U��\�@U�al��h@V��)��@W��0-��@X����j@Y�'����@Z�!��_@[߮��-@\�ƫ�@]�e��F�@_��c�@@`�h	؉@`���/8@a2ܕ;~Q@a��Lp��@bZ�B�m�@b�Z��3        ?d���1��?��ݒ��?�]zߑ#T?��4��V�?�gB.?��?ɟS�ޟ?ғ3���P?ف�-���?�ή��K^?�s�Y�0?�$��.?�?�_qd(?�sخVDI?���#>1?���7��F?�ё�c��@�[�챈@�ٹӕ@f�� �l@	6$]��@�e	F��@� [���@�%;�<J@vf
��@ ���M@�Kr���@��l�o@��Ņ��@T���@� <�9�@���,�@ �㈚\�@!�K�
�@#%�\9�@$U����@%�W�7�	@&Θ+���@(��~��@)k�	"�@*�����@,,���o&@-����,�@/M����@0Hg6�C�@1�!W�@1���W@2�F@�@3sO� �@4H�н�@5"��L�@6.���@6��gǄ@7ʦ���x@8���@�(@9�:�3*@:���@;����@<�鶹��@=�>��
@>�����y@?��t!:@@S���@
@@�N����        ?d�Q�=?�b� �'?�H��? �?�_a���?�<�<g�?�S��[~U?�����s�?��^֓��?�����]�?�aG�:�?�s�G3j�?���<���?��|��@ `���F@��:@jH	��@
��:��@	dsl��@*��^g�@z�[��@�%U���@���F,@o̚�A�@o4�U:@ �ʂt��@"z��{�&@$>Z~�d@&
�i��@(
�F�N@*��)9�@,4E]�R�@.l��e�@0]��&oP@1�,���@2�y7��@4��
!�@5r���/@6ձC+�2@8D�ѿ�?@9���i@;F�e�%(@<ـ(���@>x�<��	@@�I��@@�v<�W�@A�%8�S@B��	9��@C��Χ@D���=�^@E��>R�@F����I@G����@H�a�Ol@I�L�+@Jϟ;�&U@K��NEf�@M`f���@N<�¡5@Om.d�|@PQ��@P��]� �@Q����@R56v��        ?c�^��,M?��a�`A?�W��\=?�ua9�,?�{X���|?�2���?��8E�?�պ�;��?�9Ƨ��I?ꄩ�\�?��w�lhe?�y6}k?���c�?�.���@��>|@ˢ�3�O@	Zħܥf@:�F.�@�}Dj-�@�vܩ@c���U@�w�-#H@��7�J@�����S@ b�έc�@"�8�@#�>�>�@%�8M�h�@'y/1j�@)xN2*@+�����!@-������@0�1ǘ@1/�Q.�5@2j	��c�@3�l�	�@5�+��?@6a(��RL@7˔���@9B}�F@:Į���@<Sk�<��@=�Q���@?�f���@@�X�Jr�@A���[@Bi�,@CVj� �@DH1��@E@���@F? L�L�@GC��B4�@HN{�n��@I_}e�.�@Jv�T�դ@K�m�Z@L�����v@M�e�JHk@O\���%@P#�D� @P����$@Qc;���@R�VN�O        ?�2E顅?����L?ɝ��2Ĝ?�T~��:D?��qri�?��}�}X?�	#��$�@�<+U@����M�@?h��@٭��E1@2͟
@�X�"8�@ O��x�q@#
�T.=@%���O~@)$�/Iߺ@,��Ŀ�@0����G@1�#�`�@3�-�O��@6�v���@8Q�ZD@:�7�o�@=(��*�@?��=s �@A&B�]��@B� n��t@C��.�6�@Et�c$b~@F���Q�/@H��x)hb@J?���9�@K�$�,�@M�r�b�@O���Y@P�+J9�G@Q��ȋ��@R����EU@S�QxP@T�I��,�@U�\��@V�7	W@W����@Y.@��F@ZK@h=�@[~�ɬ@\�sȣ~;@]���<�@_>@[��:@`Eȋ:��@`���@a�����I@bMpA��:@c,�+�Y@c�&�Nd�@dr[!�j@e/�Sd1�@e�lN�Qo@f�E�P��@g{R��'+@hE��s��@i�)�i        ?i���w~�?�Z�7��?�0MƧ��?���� �?�t)'"_�?�*KRiQ�?ջ�taQ�?ݰ�Qۗ�?�y�jF?��p�r֙?�G)	��?�ݎ�M�?�?����?�.;��T�?�n��3-z@�'$���@�xn�}@�����@	L١�6�@6�" .�@H5�Z3@@ĭI
@�<}�@�u@~%X@�fA�\@yϭ�@xk�\�@��+�)�@�h��b@ v��;@!��h�	�@"��0�S@$	����@%Nc���@&���t��@'�7��ջ@)WJ�x��@*�O���@,8�3pfw@-��Hw��@/@��To�@0i�'v@17����@2
K�]�@2��i�z@3��L��m@4�� p��@5�ŋ��@6neBc@7\��h�@8P .��@9GѮٙ@:D/��:@;E���@<J{agK�@=T^��-�@>b�����@?u����M@@Fes��@@�<:�F@AdH�&@A���O_@B���N^]        ?fܕ ���?��o~�l�?���H'�?��J ��?È�MuȌ?�I�A��?�@�<K�M?�\����?�;��5�?��OF;U?�U�q˺?�ί����?��" �8�@ �vm{��@����@@M�N��@�g���@h��}�@��n|��@����@�B�P)@Yc����@8g(<x�@C�~�O$@!=����u@"����]�@$����e@&�NUbd@(�ënCX@*�}@���@,Ɵt���@/L��@0��4��I@1�`�|X@3%�t���@4t_)^0�@5���>�@75�yס(@8�@�m��@:'!R�@;�,�h k@=IgH�c�@>��X=��@@N:�p�r@A,&����@B-~�Q@B�P�Q�@C��BD@D������@E�Y]���@F��j�c�@G�k"��@H�=�}o@J2�h@K&�4��@LG�!�@Mn�Le�.@N��si��@O�ֆ�U�@P���'�@Q#��~@Q�b���@Rk��F@        ?f��&�?��#q~a?��D a�?���!��?Çk.�s?�c���^?�i���q6?��L���:?�`�,�k?�LƢ�g�?��E#?�I~S�?���� >2@,���@i�ۄnn@�K�iUf@���h�@�,��Q@]+�w�@־�@@~h1�`8@T�\�O@Z��0BJ@ H$��"Z@!�<��@#����X@%�'�S�#@'�t�C�@)��^s�@+���:�4@.8)��+@0M��%�@1�"\@2׃F��@4/��Бu@5���{�<@7S��@8�H��չ@:��qL�@;�w�?@=W���@?1{oe�@@g�]8U?@AP	�x�@B>�m���@C4x��q�@D0ٺ4��@E4'Pc�@F=�&���@GN�<?�@Hfb�Ct@I��몯X@J���h@K�3���@M	)Ve�@NB���
|@O�����@Pe�|5-@Q�~�*\@Q�g�):�@Rev�y�@S�e-j@S�ݏ�/c        ?���lY?��h�~7�?έ���?�?KtI��?��[�Y�
?��绢)�?�<Uh�@���L�Y@/PM�&@N�9}�M@}�T��h@#�~P�@@���@"j��:��@%p �%@(��Mӥ�@,,�>�@/�0���@1�k<�%N@3�����@61S*S}@8����@:��v��+@=u�� �@@�^L,@Anw?.��@Bݱ�/v�@D[.��j�@E���q�@G���Z@I)$��=@Jߒ���@L�/%��@Nv�k4��@P+�R�@Q#r���@R"��.@S'�*��@T4D���@UG�VO�<@Vb�_bK@W� �a�@X���Ϛ@Y��W���@[�JՒ@\O�9	@]���9��@^�7|s�U@`/�	}�@`�yп@arU��8�@b$��ᗩ@bڴ����@c����@dP.��c�@e�J��r@eҨ�)p@f��L_@gbA���@h.����@h�J@tb@i�7lZ��@j�W-(        ?c�lwE�?��R�o�?�-�]U�?���UL\?��u�{W?��o�r�G?�a�w�)0?���T��?ߑ@c���?�,/�x�&?����zD?��(_?�Z�Bi�?������?�D��\?�$�E��@ ���س�@�]���a@8�T��y@��q�*�@
Z+̙w�@ rZ���@._�ɚ@��V�@$� �@��aVl@�$�#@X�m�6@8��5@*g�/z@-/�-�@ !�yZ@!4FB7@"Pa�k��@#uT&T�@$����@%ٷ��&Y@'$<�B�@(a^�(��@)�b���@++��?z@,n�'?��@-��E�6�@/NH���@0e^uz�@1(�Bk
@1�+&�U@2��+N&�@3�]��'@4^z���s@56��(u�@6�!1�@6�Һ�~�@7�Bq ߦ@8��?g�@9�g�k@:�t{��X@;�Ea�@<�l5�0@=�DG�2�@>���4�@?�i�A?3@@V)'���        ?c=���?��Q悮V?���c�5?��;z3S�?�ȜR�{?�(ے�$9?�`�Ǆ9�?���"?�J:�?��Q\�E*?��n���@?��H�o�;?�c���4�?��S��@DӦ��\@���">�@	a��p@��np@�C��: @�D1��b@8�y�*@Ψ �`1@��v��@}@=��@ KLV���@!�=����@#����(@%w���3@'^Pd�2@)[���@+pt���:@-��*�,@/��op�7@1�Ā^@2UE<}�p@3��TK@4����o@6E����@7���ߑ�@9!(u�b�@:�����@<+�# �@=­)]�j@?ey�lp@@�	j��@Ag:���@BJM��2 @C3@=_�B@D"����@E�b'@4@F30֦@G�l�HS@H��~:u@I#��X�f@J52�>!x@KL�/�r�@Li�2m�@M��[|At@N�n}�.�@O��z���@P����@Q(�^`@QȌq�Ĉ        ?baG����?�(���?�2<&�h�?�]]ؙ9�?����A�?��"\�?�<���`�?��P���4?㒎�?鿷��7?�z�2d�?��4C��?�M��ƅ=?��ܝ�5�@3�KI��@k�a]��@�X��`@��	Y�y@vR&�Z7@�;Hw@
~�@���@^��� 5@B� @ (�oe�F@!Ţy��@#x]�k�_@%@��e@'� ��
@):�T��@+�M�@-?��h�'@/w���@0�;����@2�{~@3P��ʓ@4���P�@5�B��@7J3��\�@8�pX��?@:'��s@;�
ׁ�E@=1_�\5�@>Ʋ�H��@@3�%��@A	���@A�7Fz�"@B���f�)@C���::�@D�+J��@E�U�$@F}A��C;@Gx�1���@Hy�榬@I�U�	@J����@K�5�O�@L�����]@M�jG��y@N�|��Hm@Pl�;��@P�?J�*�@Q9�O���        ?�h.z??�'��J��?�4X,���?��.��$d?��@��#�?�=���`�?�� ɡ�^?�D[ԉ^@�U��	o@
g�v�R�@sl2j��@sБ�j@�/V@h�Ss�6@ ����0�@#�(L�@%�'8�z,@(�(�d�Y@+��S�@/J҄\3@1I$���@3�+��@5�Z2�@73�Y@9��o35@;Jg����@=�Q�B�@?�mD�D@A0�Η��@Bv�o��@C��m��x@E$���th@F�#R@H&<sB@I��b�!@K�j��@L��/?$@ND!�-<d@O���x@P�?>���@Q�et��@R�;{ x�@S��9�5t@T�O���@Ux���@Vw>����@W{cW�@@X�/W~�@Y����D@Z���GB�@[Ā��@\��f�o�@^
����@_6����@`4P@�@`ύ���h@amჭ�@b�s?@b��o�q�@cY�r�)@dB��ذ@d����@e^�>d�        ?g?��eJ?� �Dd�?��]�X*?�1m���?�}we��f?�8���I?Ӫ�1¥;?��M�� ?�Ȓp�?�__�ѿ?�雪�*?�����0?�@�L�?��	�'kc?��pW�e�?���ۃ+@*���<@�U�f��@���_�@	��i��@no�@m�Rg�@?��o`t@ڂ���@�euD(j@Cy��7@��unA@��"��@�Mq ��@��
�6�@�6�]�k@!		�<��@"!}�P�n@#A�Fͥ&@$j�k�@%� �Jo@&��bL�s@(�U�@)W�'��@*�>и�@+��+��@-X���@.���@0?y/�@0́�l��@1�MkQ)�@2J��G��@3j�پ#@3ղVQ<=@4�n��;n@5n���d@6@2�e#�@70"�b�@7�P�^@8�J�=m@9�]��g"@:�Ą��@;py�k*;@<Yy#��@=E�!{��@>5D��ە@?(=wB@@ʞ��        ?e�n���?�<	�	�e?�1����?�=h(=��?�.@��F�?�Y<�Ф?��=��?�$�̏�?�'5N'�?���z�,?��V�??�7�־��?�DwY-��@ x-�(@����G@��=@
�j���@�v�٨@�0�	u@;"�!X�@�e!��2@��v�Hz@��M"�k@̙a���@!����@#[�:�b�@%;���@'4v���@)F�/bK�@+r!�L@@-� ����@0
ϣ�yy@1F��m��@2�vW�9@3�7���@5ITH��n@6���/o@86�"��@9���@;X�H3�{@<�M%饳@>�$Ͷ	@@7c0�r@A3��*r@B	�+�6@B�?ϕ�@C�/L��@D�����J@E�����@G�4+��@H! ���q@I;�<+�h@J]��=�@K��{�5r@L�[O]��@M�Q&W@O%x�!.@P3��`O@P�b��@Q����@R+C�G�@R�P�&<�@S��#��        ?c}�S� �?���w�?�r �� ?�h�?�w���� ?�xS^9?Ӽ��9�?�ڂ�8{0?���=e?覩`�}�?�e�A�3�?�! ���?��ƣ��?����	@P� p�@b���@F�1d@
Ȕ�}+@���u*@QL\l��@~#o@ϝ����@E���1�@�w��@�A���C@ DCOl�R@!�45r%�@#c6�@%�IqV@&�_ ��@(���;a�@*��x��@,{2H�e@.�̟C��@0Q�ұv�@1j$T��@2��� t@3�����@4�ؿ+�X@6*�0I�@7q��@8�٧��@:]>��(@;�D;��f@<`�@>e$Ą@?�ա/"@@�"vѼ�@A�]����@BN6���,@C �$�o:@C��q�P�@D�E���@E�g�ȿ�@F��F�:@G�>�.�N@Hn���p@Ia[X�@JW��O@KR�)��@LRHqR٩@MV:�4a4@N^����        ?���I��?�Ħq*�?ɍ>V��S?� ���c?榎�,�?�JH��5?��>$yzC@�N��P�@��2�o@b��H	�@B�9�o@8` 1��@����]@T�F��'@"=*�Q��@%</�@'�sVl��@+"��a�@.}�$�X�@1(��@2��w���@4�^�9��@6�S��@9֗mT�@;R�؛C�@=��O��S@@U��8@AOW*sf�@B��<�<s@C��]�B�@E\���)p@F�<�y@HHjd�%@IΠU-Ib@K_�����@L�M<mj�@N��n$�h@P)���@Q��7*�@Q�0)t�X@R�ִS�@S�}��3w@T��.|�@U�����@V������@W�8*�@X�=��@Y��m)@Z��P�N@[�ӡ=�/@\����!@^b�1�@_'����@`&� �h�@`����A@aSsVB��@a�1�<@b�+ϖ�@c'\�^\�@c��A2��@djT&�s�@e&�'@e��t�        ?clM�K�]?��D����?��>�͎?�aCړ[?�K2�1�=?Ƿ�&�Ъ?�<Ok	@?׸�$g�?�S���?�PA�?������?�p�!���?�>���Y�?�����,?�"܁G�?� �$��~@ �
)�ɼ@ɏ1�q@#ϝ�ۨ@��X�@
CI4��@g�d��@�Mt%@~�1�0@h�-@��T:@{)��@H]z@&�8`�e@ރ���@��&@ a��t@!(�or��@"C��.@#g�-i�>@$�%�?=@%�E�`*�@'�,]h@(MZ.�{I@)�8~A@*�]@�@,S�_!�g@-������@/,��i�@0S*�)�A@1#�P�@1�[Z�+�@2����Q�@3p!��@4Be�7�e@5�S��I@5��`�
@6�C�5�@7��L�� @8�����@9��&oWu@:t��V�B@;g��B�@<^���P@=Z3�ug@>YJ��q�@?\��K�@@1�:4�x        ?e���+f?��sN��?�_�ui�?�����2?�oi�.�[?���t�xg?�KM��r�?ߚ90iN?�w�N��?�5�]��?�	�T��G?�����?���3t�-@ ��l3"A@�v��@{�m��@^�e��g@��H_��@c����@����i@@W�J�@v`�@'���3�@ 2ˌ�x;@!���
�w@#��gW�\@%���apy@'�m�l��@)� "�~�@,Sx$�@.\@3�T@0f7ۏ@1����@2���,�@4_�A6@5�nEB�@7K'OCɄ@8��p�@:n�u�b@<�	yl@=�g$E�@?����pA@@�^�v@A��W�>@B��h��@C��³��@D��|Ou�@E�L�A��@F�	��1r@G�$���@H��nL�@J)�N�O@K[�D�@L��rV*�@M֧��@O<�TΩ@P7���-�@P�^��D@Q�՛���@RF�T@R���b�3@S��_�Х@Tu�}oz        ?aU�
��?��) J�?�8�v�L�?�^��'v?�}��(ut?ɜ�jq}?�L�a�/�?�?:`�?��o���?�����'?�5�W��?��r�L�?�xl6�?���`^�@����b@סkϲ @Qe�@��T�@G"T��@T���J@�i���u@E�Ǽ�@����{@��,�@�u���@!�/�5�g@#T�����@%#8�GYk@'	7�	1,@)����@+�cx5@-ISN�&@/���uy@0����@20� S�@3x��?�@4�w@:We@6+:V^@7�e� ş@9{�pM@:�)���@<&����M@=�#�lr+@?p�V@@��]B�@Au�T�]@B^wM���@CM[�=@@DB��5&@E>`H[�C@F@�w���@GI+�}�@HXI�|�@Im�Z�@J�� ��@K�Ȟ�r@L�d��c@N�!?X@O<o�<�@P<�01p<@PީP1�@Q���W@R,m]s�`        ?�c���eP?���{?�=T���?ֳM͟z�?��2�¡M?��=>��?������?�'8�p�@���y�@
`VNye�@s��X*r@hT�CI@�A���@����%�@ �7H�@#9;��@%�O�`@(��L�M@,�Mɭ4@/l_��@1x����B@3S����@5F`N,@7Q@��4@9t$=��@;�V��H@>��,=�@@6X��@Aw�-�$a@B�zPO�@Dh&�%�@E����X@F����7�@Hq�����@I��Z�/}@K��O�:@M0K`R@Nܜι�@PJRShAm@Q,-� �@R�����@Sa��m]@S����@T��y��@U�����$@V�'H�@W�NH�\@Y����I@Z"�R�c@[?)���@\`�
0��@]�[L4��@^�����@_�|�~�@`���]�@a/��;��@a�Аڀ�@bv�U�4@c5(ᗢ@cȕ�Uuz@du�MFMp@e%�O�(�@e�N&!�        ?hC���?�'�v��?�}�]V��?�����s�?�9��O?�0"d?�`gɰ�?���f�p�?�\y~c�.?�e�c�?�J�?񯭆F�?�(	� A�?����T�.?�G7ߜR@ �BŁ�Y@ꁱ@��ը[�@W���L�@3�_�&t@8�%�<�@���se�@`/M�Z�@!d�;�@���\b@� 
)@�o>�V�@�?)���@ ��N�@ /�$�e�@!Yn"���@"�����L@#���#��@%�nZ��@&g�n�@'�*Y�z@),��y�@*���@��@,}�ϟ{@-���_I@/0�~��@0e��2�|@17�л��@2�ܵ�@2�V�F8�@3̝R�u@4��55�@5�(}դ@6�i/�û@7��/�A@8}�\�mn@9}P"qU@:�>�V@;�gGᒃ@<��F�|Q@=���^r/@>þ"�˷@?����e�@@�i^�6+@A���d@A�ޗ�@BCO|�D�@B�8��        ?e�_��?�4$r���?��ςK�?��<,t?��R�+?�>�6��?֖�yk@�?��p��D?�J
e�?�X���щ?��V��?��P�o�?��R�a+@ ��
���@��?��@Hj���@<{��5@7֜��}@ص���@A����C@�gfR�"@�~#���@�qU�@���9�E@!|_X��5@#:�Ã�@%K�T�@&���D-<@)ߩ��@+$kުY�@-[S�a0w@/��8��|@1	\?x�H@2I����@3�Mw\�@4＊7�@6U|oA�@7���5�@9F�ϸ�'@:�7A�{@<ji��L@>PF+�-@?��m@�@@���,K@A�L�O�@B�Uɘ��@C��)�(6@D|�ո�@E|0`��e@F��R@G��Q��@H����@I��2I�@J�2pmi�@L�f2B�@M/6`��@Nc'(�Ǫ@O����0(@Poh)So@Qw�BV@Q��|��@Rey��*@S����        ?e5���{u?�*|W�?�p�����?����폿?�O�s?�4B��A?�|z>.T�?��Mj�M�?�,�I�?�k�HN�?�)�P�r?��ڨߴ�?��w�@@ ��j�o@�R��@���@se{��@��8X@"��c7@�~˝$@Ea���i@#����@'g�mVy@ 0�=��W@!��ͣ�@#���gC@%�R=�2�@'�8��Li@)��.��;@+�v�F�8@.A6W�c@0U�L$+�@1��"�vj@2�i�R�@4D�N� &@5�q~�H@7'�	d�>@8��,��|@:A�'�@;�0��@=��p�2@?P^d���@@�8:A�@Az��0@Bn�pɅ@@Cj�j�+@DlI� ¹@Eu�A���@F�m��G@G�Z9O�@H����'�@I�	�WO@K���ݭ@LGy�=y@M��b�(@N�s%D�@P	bہc�@P������@Q_��#�@R��+%�@R�?�d�g@S}�H?-�@T9��`�        ?������?�����V�?�@9 ��D?��c)0�?�/�x��?�@�_�?�g��k�@�ܐ�� @	�װV8�@m.����@sށ)�@��<�n@�[8#��@!���٪�@$���j�@'�m8>��@+4�l�@.ݠ��2�@1a��ދ�@3t(�|@5�t޾U@7��F��@:e���j@<��=�l@?���#q�@A8ƾvd�@B�}�v"�@D5�'inv@E�VK�@Gq�VU1h@I'h�헶@J�vF{�@L�b��s@N��^��@PL݉ �\@QN�뙦�@RX���`@SiS�T%�@T�I�|@U����Uz@V�]�w{�@W�u��L@Y3=��� @Zr�dL+�@[���+j@]���@^_����@_�t��@`�]Xs��@aH���@bs�'�@b������@c��so!�@dH�;wK�@e@�'E@e߳�kC/@f��c+-�@g���K��@h^ը���@i;w�O::@j�A��{@k 2Y�@k�#nK        ?`S�o?��]b2�?����,ˮ?����xT?��;qs�?�Y���J?Ͳ��-�?Ԃ��ۨ#?�,^���?�kn9/\T?��\_��O?��.]03?�����?��;J.>?��6���?�x�B�c?�"՗�n@@ �4[s�@��V��M@Λj�e@"/q�9�@	�ZtS��@( �P�h@ڇ�Qy�@�J��@O&���@��T�@pk�ص<@�z�&@�%���@�I���q@q=��~,@X�_���@ (6��2}@!+�Z9�,@"7'�,@@#JO�J�@$e7�uy@%��I���@&�(fŘ@'��3L@)���Jl@*^ުW�G@+�����7@,����o@.Owe��@/����3�@0���5��@1Aw�R9@1���8@2�Lc�@3|(ks�_@4A��� L@5
���;�@5�9�	[@6�P���7@7z�:[|t@8Q�>�T�@9,k�U.}@:
R��`@:�x8��@;�P��0@<�`�E�        ?b
M�f7?�x��?�R"$���?�^���5�?�X"ň�e?�d����?�O�;��?��@�4?�q��w?�E]�nD�?���'��?�r�夑4?����l�x?�޵7�P@5�i�@DC}F8>@��&�@Fi�k�O@<w�P,�@�;R���@�)�(�@�ԕ�.?@ �p��{@�����@�=����@ ����@"�ƣg��@$`��0�@&2��I @(��,�5@*
��C2@,1%N/��@.^L��@0Qy @1~�����@2��S���@3�P�@5L��f��@6�����@8e����@9���#H=@;
�q`@<����2�@>$����z@?�7㟗t@@��b�}c@A�ə�@Bz��י�@Cc�W&�@DRDM0j@EF��W��@FAd�{X�@GA�̑�J@HH@O|V@ITI�p�k@Jf^%EH�@K~UG��s@L�.\�P�@M��D�r8@N適�Ջ@P|�'@P�&<J��@QD�$�m        ?`UA0�}�?�ڒ�)�M?�l)Y�G�?���Hm?��B�Am?�(.�m7�?��D�˱?�.Ck�R�?�Nk|�?�� �U&?�0�c�?���v���?�n�N�%?��9����@�&ܞn5@�D��dy@f���@<$k�F@2÷��@rbt�H @ݱ��u@ui�Y@:2�J2�@,����@ &�bJ3@!Ί���.@#�	�]�@%eu�F�@'U�_�@)] D�@+}�#�$�@-�YQ�@0�HH�@1:���@2}ƾٌ@3�E��+@5([��k�@6�[�"�K@8W��@9�^��@;�W~@<���j�"@>bI��!@@7a}�@@�Iecx@Aػ�4��@BȚ_]��@C�+6k�@D�q��v�@E�pt���@F�*��K@Gܣ��@H�ۗNhE@Jָ".�@K9���h�@Lf��B�@M�m���b@NӉ!_�@P
8�§@P��_ߑ@QUY08Z�@R е4@R�`U|�        ?�cO ��?��x�F�?´sn�?�Z$T�m?��b[���?�Jk�8M?�}�l%ی?����@ݮt�	�@�T�+I@�޼h� @�EY��@-�E�*@�tl~}@'�;��@ ��dν	@#J�n�`�@%�5���@(��`��@+�{���@.�<E뵱@1 ��}�@2���e)@4�l�J�@6l���j@8fpgg�H@:u�b_�@<���9��@>չJ�"7@@�d(�@A��:Pj@C�q,Q@DLv���@E�ĭUi�@F��@���@Hfk4@Z@Iٮ��H@KW���I�@L��J��@Nr����K@P�4 �W@P��N"}&@Q��.�"�@R��u��@Svr)��@T^h��~�@UK�岍�@V>����@W5}T�$�@X1�q�p(@Y3)I�Խ@Z9h�zyI@[D�����@\T��]�@]ip_c��@^��KZd@_��?���@`bXh!��@`�H�Ho]@a��C`L�@b%/ ��@b�j��@c]_�QS#        ?dWj����?�	�;uUZ?��d��S�?�S�N���?�������?�X���rg?����?��{��?�b�m1��?�X_���?��f�G?�,��i?�l6=�>1?��z��?��y�)k?�i���0?�;f<��@�W�9��@˫9o�@���x@s�ԯ�5@
�v��@�d�`G�@)Ǹ�ۗ@��C�@/p�o�@�p��&�@<�ן%@������@����}@hp���@?!���0@%��گ@ �
� �!@!����x@"�k\��@#�G@e5@$��/�@%�/G��@'&jI�@(6hgn�t@)k����<@*���i�@+�<�:@-7�bR��@.�ՙ�@/����@0���;>@1U5��;@2;��_�@2ƮYr@3���d�-@4E�'B/�@5
_py)�@5�V��Sj@6�����@7lM?aEx@8>F��3�@9���b@9�,T�]>@:���@W@;�J�j�@<�̞��        ?bR��n'?�&# �?�F~��Q?�EU�Uh�?�l��$�?�*ܔO�w?���_�'?����k�E?�<�YB�1?��k�w?y0>�?�3���Ō?����Ê!?�|e�r��@ ��VD@�0I�@I#G:d@
�f���@�R?��f@|�yh�@�mƺ�a@&FNh��@��ȡ��@q��#?�@T���@ ��PA9�@"LH��Ad@#��M,��@%Y��@'�����@)�r.6��@+��v�@-��D��C@/��A���@1Dv���@2D$�;�@3~<�@4��X��@6��?�@7n;�1�@8�C�y��@:E�Hz@�@;��3�[@=I�>���@>ܟ�kU�@@=R��%�@A��E�I@A�$]a�@B���7�@C�]~��:@D�a�5R@E����|@F�7����@G˳�@H�qyX6L@I�si�<@J���}@K�@��u)@L��Ӛ�@M�o�u�@N�jcj�	@P~��l/@P��6��$        ?cI�g��?��ߪ{��?��D�z�?��h���p?��T
���?�ϊg�\?�N�<x��?�ƴ\f3?㉔~���?�o�G	?�c�bW"�?�z`+z`x?�}��]B?�N[�8�d@
 ��e@8��s�@�����X@��&�@M�k�@�3�^@�X�*�@n�����@#O&�m@�T�S@ 8����@!��:� �@#T��'6@%ޒ`�e@&��Ҡ��@(�-���"@*��ij� @-!%+B��@/[��#'@0��%��g@2���{N@3LP��O7@4����g@5�v���@7UPR���@8ŕp)@:A����j@;�D���!@=^�͝f�@>�V���@@VZ.�5@A2xd�h@B��{@B���įZ@C�GF��@D��T@E���� �@F���O@G�~���@H�Y3aD@J���G@KE���8@L=���(�@Mc�|�k�@N���O�u@O�%���@P}G�KIH@Q��m�@Q�m��C        ?�n��̀�?�:���?��Ŗ�?�rr4�" ?�rE|"$Q?�Nk:���?����&�O?��(���@�#��.;@	Gù$�@l�y�~@ 5�k�@�| �R�@��b�ek@a�z�@"����U@$�vM�TU@'M���@**V�̂@-0�0�x@0/`:�9�@1�)O��@3�XS���@5o䑊�:@7X���i@9U����@;gif���@=��J�5@?�
�1`�@A
�U�C�@B;�H�&@Cw'/�a�@D���"�@FE��@Gf�$��@H���s@J7�&i#U@K���#E@M1ч���@N����e@P)�RQ�@P��Wum�@Q�0 �S:@R���� �@S��ݗ+@Ti0��L�@UQ����@V=��B�@W/���#@X% iR3�@Y����H@Z �u܍@[#)��@\+�9���@]8�u��v@^JXu�~v@_`��h�@`=��z��@`�Q���@a_9�f�@a�b
p�L@b���$�@c"o�γ�        ?h�)��7F?�*��1?�E	9��?���F:$?�׫qy�?�S�㒺j?�1'���??���Y��?��ZK��?�D�k���?�R��?�L�%�0b?���O9$?����5Y@?��476�L@9���Q{@��<�@4���@��m��@����3\@�9�#��@�ag�@�>��K@n��ö@A��Ώ@(m�h�@"+��+�@/���0T@P��]˼@ B��A��@!fU���e@"��A�@#���#�@%Xy��w@&UoԨ�@'�s�x�@)���@*l��\9@+�XȊV�@-U�hh�@.���َ@01�{�[I@0�gw�= @1ˁվ�b@2�0bc�@3wm�L��@4T3�:3�@55}��~@6CH}%�@7��B@7�/Z��@8�J��6�@9�΢�@	@:ڷ!(9@;� ��I�@<ߩ<[�/@=�z~�@>�h�%@@�e`�@@�寔&@AcU @A�kA��@B<�}�+        ?eD��H'?��&���?�h�X��?�}���?�S��xB�?�tP�_B?��o8da�?����9�?������?�l4y/��?�w{n?��ņCv3?������@ �9q��@�5?��@]P����@	���.��@��@�Ō@ ��@g�Ԙ��@�܋�T@�t����@O��W�$@J�J���@ �V+vn�@"c�9YO�@$%£�@%�,�V3�@'�1,ghU@)���w�@,�r��@.L!me�@0M��6T@1�Zw�M�@2�9�W	@4X���@5e�6�@6ʙm0�L@8;�?��@9��=��@;C�rߎ,@<��db@>~���P@@p\rˎ@@� ��L@A���|�5@B�aL��@C�;��AO@D����}�@E�W�=.@F����7@G�f�dz;@HҮ�k�2@I�y.όJ@K
Ɨ*@L0�O]��@M\�8���@N����X�@O��7�^@P�z9Z,�@Q'�\L��@Q�%��@Rw��?^�        ?cV���}?��Љ�?���q#�?��u�6gx?���-�?�_S�nQ?ԃ>���"?�n;.~�?��8lP�?����'�?�R'|}?��Ò�?�v/E�U?��� �$�@P��Ѕ�@�:IW�@	��5��@��CK@����9@ܸ�O%�@K��'�@��z@�bd�@�Ѝ���@ bh9��@"
t��j@#��lqD<@%���vY�@'�L��B,@)��}��}@+��bEs�@-�[��@0���?@1Q��T��@2���`��@3޿�@١@58R�v@6���D_@8U�%6@9�c4c�-@;���O@<�~i@>X��٥�@@9�r�@@����@A�4��ֽ@B�F��a@C��~H:l@D��� T&@E���U��@F��.��n@G��֭h�@H����@I��P�@J� �'}@L"�6�R�@MN�%��@N�-�- K@O��}eL-@P|��+و@QG���@Q�1�[�@RnE�鉕        ?���z�?�����Z?ʰ�l/j?�R�̑��?�:6qOS?�x'ȗ��?��z��@Ue;Aj�@"HUl�h@��wV��@Vbr�@D�88��@��Ϸ}�@ glK,07@#�]R�@%�<��D@) �ק@,geW(�@/���4x@1��5��@3���7��@5�LEdd�@7�w��@:7!����@<�C��\�@?aa�cm@@Ʈ <��@B��j�@Cv��KRg@D�)�
�9@FW�1�2�@Gڞ��o�@Ii�Z�'�@K|��=@L�q���@N^WÀ{)@P��wt�@P����@Q�%��@R�#$D�@S��b@Tü;#~r@U�6�p�@V�p1�c@W�a��y@X����@Z	O����@[(?�|y$@\L��`�@]v�8H��@^���Q.\@_���%(@`�`]��	@a+�`t�O@a�t$פ�@bt[��@c}Ә��@cǙy �@dulM��0@e%�r�[ @e�09%�@f�x]>@gG��ݐ9        ?o5�v��b?��غ&��?��q���?��(��h?�D��?�lsm2N?י9K�_?�.�3��?�㽣��?��L�呔?���ZO�?�?��A4?���Mm�?�6�d��@ d.��Z@ؚ�{f�@x��	:@D�x�v@;�0@;�@^~'�p@�S���@�ezy@e���x�@M�����@K2B�j�@^Q�tR@��Ԥ\�@�ƁYЋ@ ��k�5�@!�*�q@"����/@$H/m�g@%��2�~�@&�5��@(b��tl@)Շ����@+R�R�W�@,�����>@.kp��X�@0�/�@0�L���J@1��(_@2����@3l�㡝�@4Sg��v@5?���@6/��@k@7%(��@8��s��@9��`�@:"��@;+�T�@<9j�"�@=K���!�@>b���+Q@?~��Ư�@@O��"@@�Bߙ�@Aw*vq�@B`/R�@B��*֓@CC�N��@C��"�c�        ?d8Y�׊,?�P�Q,�?����}?����Gr�?�ĥ�1,F?�P��O:?�Ga/ �U?��)��?�W�4�?鳴����?�r���u?�����zj?�G9ٴ�?����>v�@8����@w�ū��@	�U׮P@��U�b-@�3�(@���Z@O`u�L@���]��@�e�bѯ@�
$���@ s7�E��@" ��?��@#��;�e@%�#;6[A@'���4�-@)���4>@+��s|��@.-mv!,@0Cw�Φ@1{�6ۂ@2�Y��4�@4~U��@5r\�^ή@6� �h��@8VtKq�R@9��n2%@;m�۞�S@=��V�@>���'�@@8�l�i@A�w8]'@BM%,��@B�84+�v@C����@D�z���@E���I�@F��[;8@H[�ʱ�@IN��?:@J:�rb�6@K^�Ϸ�@L�/,齗@M�%4���@N��KȦ@P�Ǽ�@P����@Q_z��@R3�7��@R�,�y��        ?l��Yl�?��ሷh^?�02��?�*[�c�J?�?z�ς�?ѱ|異�?�#3�n?�H�Z@5?�kbj��?�����??�*��t?���ߖ4�?�[s��О@,X ��@y.�(i@	����@n�9@��H5C@����@[T�mMS@���!� @�����G@�3�X�@ f�W���@"
�� O�@#Ď����@%�pz*E�@'zY`�'�@)v\�=��@+���:�[@-��ױis@/�G:5^@1"CǢ�@2Wߌ���@3���R�@4䂆7�;@6;�.�X�@7��� 6�@9
�l�-o@:�$H1��@<}`9]@=��"��@?.K.���@@i\u��@AA4 ��@BH, �@C �ſ�@C�&c�q@D��L�$@E��դ�@F�|��@G��)`@H��g�m<@I��~A�@J�&d�9�@K��a���@M��dɔ@N&n��t@OJE�a��@P9��fh@P�����h@Qj�k���@R{�&�@        ?�܇��~�?���j�?�v0c���?���E'08?��2�v?�}�pթ?���Q�(�@�1�?�$@��f���@#
YM�@�O����@\2��R?@ Y�m��l@#C���@&l+Ʉf�@)ү�X=@-w_��{�@0��Sl@2��>0*�@4�R8�~@7;�t��@9��s�@<5�@�|�@>�Yu��[@@���j'K@BJ�!@C��yS&@Eb��ɋ+@Gťu{�@H�:�c�@Jzժ��@LK��?�@N+c�j�@Pl�Q�@Q��ӓ@Rs�e6p@S!�ٴs@T7=G<��@UT+yГ@Vxgx��@W�躛��@X֧�[֖@Z��	�M@[Q�D�l:@\����j@]�~ت�@_@��/^@`Nׄ��j@a1�۱@a�c�e�@bpo���@c-L�d�+@c���}ä@d�u��h�@ex�b�Cq@fCo����@g�rဆ@g� ;-2�@h�z�Q@i�q�F$�@jl04
��@kKP�Ն@l-�aC�Q        ?h��z j�?�S��@��?��l�VY�?��*���?� =�9�?��BL'I?�7X�N ?�b��X�?�����?溫��Ϩ?��@I$�?�Ԩ?�=��ب?�����d�?���V��?��O,�	�@��;��@8=�@���i@	/x���@�qqGp�@������@ΖS�c@WQQ@(�@�z�U�@���(��@Sų�:@�Z3�@��R��U@�kO]�@�3�E-t@ s-�8�N@!�9O��@"�7��G�@#�#��y�@$����9<@&��3�@'83�*Oy@(t����}@)����1�@+o�'�@,W��@-�䝢{�@/j=E��@0?��T�/@0�Y�
��@1���Az�@2t�s5(@38?�o�p@3�w)�ׅ@4�K��*h@5���X��@6jɝ�U�@7@q�"��@8���U>@8����@9���X��@:��U�d�@;�r�Z'�@<�r���@={�3�#@>m�R�.@?c!7r=        ?c���u(?�P��?���ad�B?���ї�?���I�p�?� 	����?�X�{��?�� ?�=?��۝�?��B�=@?�XN�C?�������?���X4Ȥ?������@h���+@�s���@	P#O��@@��|@�2��C@�Z �@�Y:���@4ץCE@	|[��G@@�<ad@ ���75@"Q%�)Y�@$\"�*�@%���bV@'�z�[�@*���|�@,4��ö[@.z.���@0ls���@1��>���@2��?߅�@4G�Ǳ�R@5�)���(@7���;u@8�I B]3@:$Ql��@;�IZ"@=b��Nh@?*�;�y@@k��'s@AS��%@BAJS�QV@C6u&��@D2�r�l@E5�g�;V@F?�Yͅ�@GP���@Hh�#U]i@I���Cl�@J�;�8@�@Kۜ�X��@M"�Mo@NKқV=x@O��w��@Plf���@QEv;@Q�^��@RqP!|@S$�f        ?e���6�?��j��?�щ��0?��~�i�?�����?=?�n��Hx?��Ԅ�N?�\VdOvS?�����?��;�&,�?�j�g�p?�h|pbQ�?���?�p]?���8�i�@��kc��@�}�e��@M��x@� ���@��2?g@ی��.�@O�D��@q�ۅ�@��@�N�@��'{X�@jr�ph@ �Ӊ-�X@";J�G0@#ک��-@%��mho"@'RAM+�@)*��q��@+�!��@-7g^s@/%h�u��@0��cC@1��'B�@2����@4J�\��@5L^A<eg@6��l2�@7�����@9- �=o@:�ҬN�@;���|�@=b@��@>�����@@/v�zx�@@�����@A�U�;
�@B��Xe@Cc���20@D<)���@EADsf@E����q,@F���_@G˷K���@H�ݪbC�@I�z��"9@J��R�@K��Xx�@L��B�U@M�)>Jw@N��v�P�        ?���"?�$��1?���x̊?�`A"�^�?��֥s?�N�{�?�z��]�@fՊ��@�~��{@�����@��K��@�b,��@��t��@fQ��@!�Da�G@$<�LR�@'F�gR�@)���!�@-Ȩ<�F@01_��P�@1�Q��S�@3�%�g��@5�Ũ�*1@7�P��@9�R˾�@;ߣ��W@>�d���@@8�\G2�@Al���M�@B��d'@C��}k�C@EI�:��@F��u���@HE�B@I�C�0�J@K���Hn@L����4@N!S��@O�?;� @P��U�,B@Q�e�6�@Rkv����@SN��e@T7kgWB{@U$�a�ix@VFt��[@W����@X
�V�9�@Y��e��@Z�:2�r@[a@���@\+��*t@]@Q����@^Y�����@_w�6:D�@`M0�"
�@`��Ou��@aw)r��#@b���p�@b��֮H�@cG�"�S�@c�6ݮ�@d��UG@        ?cڳ��a7?��	;�'0?�?�\r�?��A�]�?���Iyh?�ʏO/�?ВaZ��?��.��|�?�&����
?�H��)�q?�	�,��?�U���i�?��$�?�Ȓ-Q�d?�@	W��?��D��r|@  #DN�@$�M�
 @k���@�&UT�@	cmb��@��"��@�%$O[|@��`�ȁ@{�>]r�@�}@�A"��@��-��d@^�����@C5��YM@9R�"�@@����@ ����[@!�6t�$k@"�!���@$��D4�@%5��T��@&m��K�@'�Q	��@(�a��T@*I
+b@+�*�h��@-�յ��@.p�K���@/�O���@0�C�	@1rn���@28�p��@37��C5@3��s�؝@4�m���t@5{ ˆH�@6U����@74�b�I@8Iu,�s@8��7�@9脺��T@:��D���@;�Y�k̏@<���j�\@=���(.@>�n��1@?�sAO<        ?`7�9�U?�w;^�?���ј�?�;� ;��?�p`*��?�<E�S�?і*͂?�'/�=�9?�8��?���� W9?�H��.6?�e���x?��^M�3�?�{�-��@ lb]�S�@c7.(;�@�'}��@
0�3̸N@
fK8�o@:>̚�@U;"��@�J��-J@Fo�)��@��G�J@�oT/'o@ t�}r�@"�c� @#�K��@%�	
��@'`�%��@)R�z�Y@+Z����2@-x��~�V@/�j5!��@0�5L�*@2,�ݫq@3i�6��@4�b�~B7@6WV��@7a ��@8ʄ$���@:?Ap�"@;�V�d�@=J��"�c@>�~��l'@@A�Ӽ��@An��ç@A��k�v]@B֤��8�@C�*�vv�@D�H:>�@E��5���@F�<�� @G�
�B@H�`���@I�:�g�@J��|b�)@K�b[���@Lۧ�\��@M�]=�M>@O}��K�@P$�;��@P�u�p��        ?fMuWn?��H��?��O���'?���0]
'?0�O�k?��o,/dM?�Q��O,0?ߐ@m��?�d>�yk�?�
���s?�����>�?�R�dS��?�W�-k�9@ {x.�@�M���@
Gw�l@
�%���@�7?�:@���i��@,�
	'@��k�9�@Ua�$�@=���@T:�"p@!LO8'�@#��@$��fш�@&��sժ�@(����@*�`x�@-���*@/QcH��\@0�"�L�@2�jP�{@3^�p�u@4������@6G���'@7���D�@8�>ڒ�]@:��9,|@<�s~݀@=��/���@?a�&0�@@�㠒2�@Ao _�!�@BW�*��I@CF,"$׀@D:�4�ѥ@E5�!8{@F7t�a�@G>m�M@HK�iB�1@I_� �^@JyO����@K�7��K�@L�=����@M�_��0@O���־@P*��z@P�"��w@QlWM��L@R����@R�����        ?�]���?�"����5?Ā���2S?�zD��F?�d�q��&?����/1?� ����?��Q�SȄ@$㚴[�@������@��vT�@�RI��{@f���/�@{��uR'@�:�@@!�k�'��@$jU� �}@''�gh��@*fN,m@-)��p0<@06����@1���0@3��E_�@5��=+�@7�s��q�@9�Y�<�I@;؞;��:@><��~�@@6�[I@Ak�/��6@B���)n@C�u=C��@EO� ��@F���s3@H�R�@I�:�ݿ@K�DY�@L�����@NB0Ů�\@O�m��9@P�� �vU@Q�ʜ\�@R�6C�K@Sr�_��@T_5Q�-�@UQ�~.@VI�^�t@WF�G�Q�@XIs1M�@YP�Xq@Z]��*�@[o����@\����@]��ί[�@^�X���@_꾊4��@`��R�@a#I<i��@a����,@b[���@b��f�}@c��N�4�@dA*���        ?eWyհ�?���fG4?�L�V��?����;?�M$��9A?�r(�KX�?�p��`w?�O��4?૞�b��?�DE��?�q9��?��]P{?�C@Z�{~?���RYh?�t2H�m?�z��yP@e>G��@�i�})<@"2.*s@�d��W�@p�a��t@N���mw@�^�>h�@;j����@�y�tU�@��8��@`�y��@;k���E@(=�B>@&����@7t��%@ ��kw�[@!�� Ϻ>@"��}#��@$v�CZ	@%I�ߔ�x@&�'��s@'�PX�?@)�*z+/@*su�&D@+�����@-;^�Oq@.�b��x@0�)Z�@0��0��`@1�(>;�@2b����@30%��Y@4��(3�@4׿B�q @5��a�@6������@7q�O���@8XO�\+@9B.�>5@:0SY$]@;"n.@<zu[�@=q�j�@>LۤF9@?��M@@�:�޲@@�v� :�        ?b���g?�%�u�A�?��Ve��?�-=��#?�m����?ʫ2 �4j?�Ԅ� a?ܐt|?�*?�x�ӳ�C?�z;�7?�sT�6]?��	�k�?�Z���?��0%�@LQ嵥8@��`��@	'��Y(@�Nz`z@������@� 2�i@cֲ��@�����@�e9p$@��G�8�@ wc)b()@"!�9 �@#ᇅh}�@%�&d��@'������@)�m��%@+ʒ��oT@-�#C���@0%��/@1Wl�C��@2��'N�@3ޕE3�@53��1_�@6�M��jY@8��>4�@9{�eC=@;
����@<�K]��M@>/���1@?��4-0@@�-��G>@A���=��@B���Ur�@C{�4V�w@Dn�w��s@Eg�嗒�@Ff����@Gk�	�R�@Hv噬��@I�!��2@J�h�`��@K��XB��@L�6PA�@N	wC���@O8��x@P7!�~�@P�Ӕ�E@Qu�*ʝ-@R1�gg;        ?c���P��?����^v?��/�0��?��߯Qh?�!Dݝ?ˢo���?ԫ���7�?�?���U%?���g��`?� :sMS?�~��0?��@�V��?�W��^+�?��X��,�@&�T+��@R�D�s�@�d���@���i��@N��L@~J�7@ՀVSW�@T���gD@�3��W�@�Ku�d@�9�)Q@!s�U���@#3f��@$�}���@&���>q�@(�^�m�@*	��@,��b�n�@.�𨦪�@0s�1��@1�(g�G
@2ɥ�F�@4�����@5I���i@6���/y�@7����@9X3�=Nr@:��-�@<@0�'�@=ç��/U@?QgÜ��@@t����@AE�r�)o@B��1$@B�`�xd,@C�ǅh��@D�?F�t@E��~;#�@F�SN&[@G���W@H�}L�gc@I��BT�@J��J'��@K�㠛�@L��W�-@M��,���@N�&В�@O�J��/�@P�%���        ?��v�S�?�D�Cؘ?Ǖ�-b��?�1��0?��~�*�?�n��G�D?��*4tB�@ `&j+��@�����A@���?��@'=؈&�@檄p��@�Ʉ�@��U$�T@!4�j�v�@#�N_O�\@&�
8�@)��O�#O@,��$���@0z��|'@1�B���@3¼��[@5��6\�C@7�~]�6@9��,�1@<,'N7M2@>���"�@@v�f���@A�I'&�O@C�b��@D^[̢�@Eª�*�1@G2pa�]@H��]7;�@J45Ž�D@K���@McQd��@O��jE@P_���c�@Q?
,�2@R#�.F�@Sq&=:@S�d���@T��R�d7@U�Iz�^@V��\��@W����@X��B��S@Z�m�|@[&Z�ys�@\A��&-@]a�_R�@^����r@_�{;x5@`qA��ݒ@a���>*@a����u@bH��/+�@b�̂�	.@c�v�Ot
@d6�QD��@d�2I1��@e�9p��        ?q4K��O?�c��"LH?�z>�5?���ly?�P^	K?��	�0�?�|>	K?�S���Fj?榀�j��?�~�+V?��(�7?��(���?��gЖ�G?� ����=@}#��(@!!��@��
�@	���~��@�wy��@'O���I@�&�S~@��Ȳ5�@���e�@�����(@�h�,-�@���~�@BV^�@ PWqm@!�͗�[�@"Ѝ�V@$!�Y`s�@%}��� @&��ȋ�@(X�W�@)��\|�@+`�ci71@,��0���@.�K(�~7@0! m���@0��u͝@1�5j}��@2�I����@3��g��@4�m[u{6@5�p��[�@6���%@7�;��@8��E	��@9�8�.�@:���n5�@;�@`U��@<���Ʀ{@>$.{�@?M��[�@@>q\�/@@خg�7�@Au��c��@B=��J@B�����@C\��)�@D&#���@D�op��@E[]�$��        ?f,`��E?���Ո�?�`E�iD�?�L�P�h?����S*?��n�� +?ՇR�?�T��՞�?�~h�K0�?��/r�l�?�YKQj?�?��ɜ?��?�f�?�Hl���#@�<ϟ6@�p��I�@	W�5��@.ݗts@��ڞb@��y�d0@L+�>Q�@�.(�"@�d{(@x�i-��@ D�p�@!�aE�@#�g�x��@%_ytH�@'@���@)7k���@+E�+C��@-k	]<��@/��7���@0�ש���@23���n>@3uH�/�@4�֑��@6[|��H@7��D�,�@8�w�^@:q!���@;��7�k@=�����@?2�J��Q@@p~�%P`@AM�bWT@B0�E��@C,��2�@D	��tk�@D��_:��@E�e��"@F��fw�@Hi
{��@I��3E@J$����@K>�h:@L]�:�X@M�#Ҵ��@N������@O�!���@P��E�X�@Q*{�:`�@Q�&Tp^�        ?n���5I&?��&�4s?�sA?S;?�P�3�t?�(���
K?�\����<?�bl)l?��U�q?�hր���?���q���?������?����憌?���XjzH@�5�Q�@k�<ռ=@
=�t���@h"��w�@v2�@�=@��e��@�ܬ��j@P���\@L��YA@x�C��?@!j[�Yq@#0����@%��ذ@'
˓��@)&�07G@+C��@-��g��@/�(\��	@1.^�s%d@2w8�|_�@3�9���@50zh��@6�in�A@8�t]@9��.�D@;C����@<�_�b�@>��Z �R@@0y}kG@Aw=/C�@Bd�E��@B�I��@C�*�R!�@D�����@F	 ��?@G�����@H4_�2@IT?�K��@J{� ���@K���;��@Lߏ�Xi}@NP���5@O`AKb0@PU��H��@P����@Q���,K�@R\0�
�@S_k�@S�ɩQM�@T��|	        ?��F��:?�D�\�?ҍT��O?▧+�?�.:M��?�l�c��@����@��Μ��@0Y�@h@�m�4�@�aU!t�@��4�@!�����t@$�t1%J@(E�^�1$@+�,e�T@/�t�9�@2 .����@46����o@6�����@92����@;�O�%��@>YG��U^@@��z��@B�kw?�@C���('@EDɑp'�@F���M�-@H�e;�a�@J�[��@Lc�1���@NT��2�@P+����@Q3��T�@RE@����@S^�]���@T������@U�����^@Vݟ��@X�#���@Y[��'��@Z���-!B@[��/��@]W��k�+@^����r�@`�>Y��@`�/���c@a���\<�@bPr����@c-�m��@c����+�@d���ϼ�@e����@fZ�yXs�@g5d\�q)@hH�;+@h�,`��@i�����@j���XZ�@k�Ĵ�@l��&�Y�@m�a���,@n�#Ȳe�        ?f���b�?��.���?�Ϟk�?�Q#���N?��m+�3�?ˇ����?����i�?�a8a���?�	�=�?���Q?죳�y��?�r=��q4?���~x=B?����X4?���VP�@ ��f���@�b��[�@p͈%�O@���!@
����1
@�m��}�@���ț@4�1^F@�Sт@��+U�@�=���e@�6,��@�e���{@��*�ɿ@ �o\C�@!&��	��@"U�Q`AV@#��7���@$���Iq@&#j�@'v`)��@(��"�V@*C\��p�@+�o�<@-8��m|@.­nX��@0+Yh@0�l,�C�@1Ώ��=@2��W�)�@3��"��@4i\,#��@5Q�ә�D@6?,���@71���|@8)-��\@9%�����@:'U��&@;-��w��@<9�S��0@=JB��B@>_����@?z�T�@@M,��z@@ߊ*��^@Ati���@B̅$��@B��I�ێ        ?g��Z+�T?��W���W?���8�d ?��Υo�?�M�*#?�Ip>��?�@L��`?��~x?�=���?�1h��\?�7.I���?���䶞�?�>�o'(�@���Y}@��\]�@�O��c�@xn�,@�@ba��c8@����d@48N�X;@�G-�@� ��n�@�j"�J�@ ~�I��-@"2�}��@#�u�s8#@%�3}P,t@'�>*}�@)�\��BQ@,����@.dM���@0a�L9�@1�x(���@2�B��*@48�ĩ�@5�P�R~�@7���W�@8��G�4@:-�(�@;�h���@=:T�$t�@>���m�y@@P-ź
�@A3A�4e@B�HB@C�:5��@D�a� @D��oe@F�q��@GV��ۙ@HZcw @I2�.��#@JO�����@Ks)~7@L��e�]�@M�s�(�@O��L2}@P od���@P�5h�@Qg2 8�@Rd>`m@R����@Sie5d        ?b
�Uo2?��:�c?��F�d�?�t�{�4?�X�����?ʏ�{��?� ��Kz�?�{��T�M?�mZ� 2�?靻�"�?�nK�g�?��)�/�?�[#Ȗ'A?��m��'�@Tf
됾@�ϐY n@	=�j�c�@0�:��e@�ٮ��@Hf�v@�^X�@4�S�5N@'neH�@��*@ �
i�@"W�hk7�@$"Â��P@&�HyC�@(���G@*'��@,C���4m@.�%٪�@0uݝ=�@1���T8`@2�N���@4Q�)D>�@5�PJ׋@7%�!��@8����^Z@:.��M�@;��!K@=lņv�@?𒖑z@@pO���_@AWq �)@BEdB*��@C:0����@D5�}��@E8pu��@FA�cnn@GRd�Ӑ@Hi�z�R@I�;���0@J�� �@K��L��@M��vH@NH-+��@O���"��@PiD��8�@Q.]~q@Q��ll>�@Rk�;x��@SF�E��        ?�8��'t�?�XZU��,?ʉg���?�=Ƨx!?���1?�}�Y���?���6�-�@m,Nܘ@M0��K@
jK�@R��M@����2�@9�O)�@ ���G��@#n^L�>!@&j)�am@)�U�۠@-����@0Tۈ�0<@2Al���@4I�u�@6m_���A@8��Jw�S@;��6/@=}�:��@@��@A^M���@Bo���@D4n!��@E���u�@GA38��@H�v�@J��P�'@L:�[�>@@M�����h@O�� �=@P׃��6@Q��H[w\@R��
�k@S��Ӛ�@T�����@U�}:C@W�,=A@X#.� a@YI=:�߅@Zv��X�@[��o+��@\�)��@^%[I��@_mPe��@`^�o<�@a�ߓ�v@a��я�@bhC��Q@cR�y@c�2^]@@d��=�+�@eO����@f����X@f�'�[@g��f>�w@hl�}�H@i;��ǀ�        ?h]B�'?���Z���?�#ޜ�?�q�'��?����c?̽�E��?Լ�ԣ��?�_)֥�?�y��5?�B�3��?�s�����?��P��?�f8��&?�5V]|?�T��y��@ ���(�@Avr��@ȝ�i�6@wJ7˅@MThg��@J���T@�r�9@]@/�@���@�w���@�$�hp@�W�E�@�J�KG=@Ե�#�@  ��GR�@! �tUjE@"J�L�8@#}��@$���1��@%����%@'OoG�8@(�����m@*?���@+wX(�As@,���t��@.k���Ĕ@/�E��g@0�Ϥ�3�@1�@�>�@2bSo<��@39U)~@4K(n@4�',n:�@5ؓ	>��@6������@7����@8��ş�@9����+@:����@;�>6�~!@<�O�c�@=��ܻ!@>���/@?��+|�@@i˟W6�@@�mY�7@A���4̸@Bo���        ?i��W8?��:כB?�OK��h?�p��cv�?ſ�}�8?�g,���?�ސs�
1?�5����V?�P� ?�Y%
b�?�rdas��?�t�Y�Kw?�� `@�@x�t�@9��-ov@
L�4~�@J2��]7@na��6@�ʂ�O@��G�}�@f���8(@ooX��@�I���@!�R]�!�@#X�4{B@%@��2@'A��G� @)\qN�@+����@-ݥ*^�@0"�M��q@1c(6�nc@2���J7@4k��5]@5s���[@6���!O�@8i�]���@9����@;�4@=>e�>߳@>��t�@@\Fi	_$@AD�";hW@B3���7�@C)//Pi�@D%Gn���@E'���¡@F18���@G@�ւ��@HW����@Is�"t�@J�(��ȏ@K���ƕ�@L�Da��d@N(��7�@Oec'{��@PT�����@P��zHl�@Q�%:���@RM��q�3@R��O_|�@S��+�ݤ@Td//�vk        ?c}����?�Cnbɹ?��.�Z9?��E^7
�?��2���?�	�e�?�8΁���?ܝ�	���?�gi3��w?�r(`�?�<�'gڧ?�C+u���?���<:z�?��806h�@���U�@��G;HE@I�p|�@����O�@�Ehג@!n4iՈ@m��#E�@����@~p�#@B>�3W�@.�4�i�@!"B�RDW@"��S�HL@$uc/@��@&=�Zw@(9�7y@*T��΍@,K�	�`@.0)	#��@00zB~�[@1SZNκ�@2���&@3��P�%�@4��J�c@6G��#"�@7�%��>�@9Q��]@:me'L�L@;�H�J�@=e��S�@>�o��&@@D�S�0@A~��O�@A�;!�<�@B�:D��@C�{�N�@D���X��@Eu��s�i@Fe0�F@G[�KJ@HU{<���@IU,{���@JZ��؆@Kd'��3@Lsi'��@M��ȑ�@N�]%��@O�6@Pq�P���        ?���=��?�C$��6�?��֌�l?�qn�?�h[
��?�j��|I?�v���(e@y7ͪ�N@	��U@J����@9��Ǧ@��Гթ@g@�Iu�@!RXaS@$(]1M`1@'5vN��@*yh~u\@-��ل�@0�lǹ,@2����@4�QoR��@6��]n/@9Ab)I-@;�ҡ��@>��f��@@V�
�@A��%���@Cі�g�@D��SFc@F 	�Xb\@G�=ZS{�@I#v��@Jȯ�wa�@Lz⠮��@N:�*�@P@ơ+@P���@Q�o/fŇ@R۽��M@S�m(�\R@T�x]aЌ@U�ي��C@W �/��@X���f@Y8��t�;@Z^L�@�@[�����@\��w�+�@]����.@_2oY`5�@`;t�{��@`��~��@a�)��p@b4�̮��@b�&>
�@c�� �R7@dIh��K�@e#Ș̜@e��Q5@fy���@g:��0��@g�����&@h�����        ?br��y�R?�;6atJ?����і�?���rO�?��*����?ƛ����?�p��?֡t�F?�޲�l1�?�]|^�?罖�Ժ?��ol�Z?�M��%[?�g�%V;?��(P_?�[�Aʍ_?�6D��}�@�R��2�@�:�=�@!��Fu�@�q�ʨ
@^VP!@�<i��g@Ej�u�@��yM%@;�,�6@�^���@m�	��@A(��U@�%[�LL@�x���@�E�G@j�a��@ �����@!��pC�@"��G�@#� �n`@$�� "`@%���m�@'#��F@(N��q�@)~৿)@*�.t�@+��s+@-7�YP@.�S��;�@/��34��@0�����@1C��րF@1�'����@2��P�|@3a����@4�ف��@4�j�WFq@5�T���9@6_C���@7&4�c
P@7�%�ͽ�@8���@9�����@:_�]�[F@;5��!�R@<K��#�        ?a�i�(��?�2Z�?�Yg�?����b?�������?�֍�־7?�}�`�[?���x��?���{
O[?���
�m?��u��?�'9���?���
w5R?��hW�2@�:?��@&��"�A@��_�ϻ@�|*-L@]�Φ�a@��S��@%��ɸ@�b�	@ol�?;�@c�5�Z:@ C�7��@!���|@#�n�I��@%��NJ�@'r��c=�@)zG�;�@+�MK �@-�ׂR�@0	k8�6@1G���@2���ß�@3ֻ!��@51x�e�a@6�慐��@8����@9�G�c@;χIO@<�x �@>^	a}{ @@	E�~/a@@��o��@A�BE�w�@B�yu8W@C�M�&v�@D�!��7�@E��㖈�@F�t|7�J@G��Fz�@H� ���@I��f��@K4�iy@LB!S�@Mq�ΛU�@N���"@O��̷@P�
����@Q9x_�@Q��Y�,@R�@����        ?a�$�s$�?�u[�9&�?���UtZ�?���	���?�0�[�O\?�M�@��?��?��~?�+���c?�2���?�G��f+?�1� ��w?�G�w�ZA?��y!�?����@�X86@%Rfj=Q@��3�1�@s˂��@I�1\@�@UrE�@�Kε�@s�����@+�8S��@BY�i�@ /�c]@!�Ʊ�� @#`�q�^@%*�O��8@'j��U@)�"<a\@+�8���@-5�Ǘ�@/q�`�R�@0�m��"�@2���c@3X?1�@4���6&%@5���u�@7`W���@8����i�@:J�b�@;��vڜ@=du.�99@?�x���@@V�H�@@A1��ɸ@B~M���@B�W���m@C��_M@D��ڃa@Eу��@F�#|�<�@GԻ4l��@H�L[���@I���ʻ@Kc=��@L"�!�U@MEx�C�?@NniXA�@O���Ni�@Ph����@Q�5��@Q�J1,��        ?�?� 6�?�4���C?�0�?�÷��;%?�)�!8�?����?�ę4Ǘ�?��K>��t@���*@/�*Ab�@ �A@]ݢ���@��)��@��7&�@>�7�|�@!mf�-D�@#�W�WR@&���]@)N3�,N�@,?�ϧg�@/Y�K��@1NF�D@3�{�@4���1�r@6�v�N}d@8��MOE@:�犓�l@<���k��@>�.��[L@@�[t�[@A��[,��@B�Դł�@D�Nb5�@Ea�%��@F�C=��@H����@I`�n�hS@J�&Z@L67��Gk@M����@O-�K��@P[4�V�@Q#���G�@Q�.��<@R�۔�9�@S�����@Tnu.��@UKWQ&�@V,@�Ak%@W-)"@W�4I�@X��"�<@Y��\Y[�@Z̢{)`&@[�Zs���@\���@]L;��@^��K�ߣ@_�3=�H�@`m�R�R'@`���z�M@a��\�@b]�Y��        ?a�DE�D?�8c����?����?��X��C?����,:?��9����?�϶S��?����)�]?��O�?⠘�~�?�?���8�?�fd���?�
b�+?�#�)�.M?����N2�?�͗޳�?� �IU@�єl�%@÷=uz@�d)�@�|��@
�Sm�@�eG��@M��o�'@Ŕ"���@L~N�{s@�K�8�@��R��1@;���@�_���@�����@�ںԦ@�Xآp�@ ͙�	��@!�'��
@"���A�@#�l�� @%��H�@&/����Q@'W��d{L@(��k@)����6�@*���c��@,<�/t@-��Z�5@.���n-@0�o�@@0��l\�@1w�q�5@2,�1҃�@2�2�NW�@3��7�9�@4_!D��@5 ��dGE@5�B��!@6��E#Ń@7wT�F�@8Dƣ��7@9!MQ@9�`4��@:���_@;�},��@<sUqգ�        ?a���n�?�͂����?�-#�؞g?�L���o�?�\u�L�E?Ƀ�Tw�?�;�V{��?�i�k�g�?�*B�d?���V�?�%(	V?��,M?�jG����?��Z��%@��v���@Ʌw���@?dط�@���7�@��P˶@A�v�q<@��~`�@'�q)�j@�wA��@��q\�@���Z�@!z�~��@#*�}h|q@$��KI(@&���_C�@(�L7��@*���ő@,�~�@/��Ƒ�@0��1��B@1�-|Z#@3 �E�W�@4h;)�@5��I�@7:p�cA@8���ih@9���j@;tf?�@<�'$��Z@>�\a[>�@@Δ{�$@@�q����@Aʔ�B�J@B�5=��@C�PB��V@D|�a/9@Em�Q�"@FdkD�3@G`Z�S~�@Ha�<� �@Ih�4��@Jt��1�@K�OȞ�B@L�H9��<@M��*�W�@N�F�%��@P ��D@P�DN+��@Q0
z�`y        ?a�FݫE'?�H�$�4�?��ÿ}�~?��0���?�'�^�?�JT���?��a��:?�C���?�K6�߱;?�t��{�?�U�<!	'?�}g)���?�7�3�?�����<@9�c�_<@@�Z��@	mB���@ 㷾p@���/|@��鮉�@ay��
j@o�Wt@�Q"��t@њ�k.�@ ~_/}�@"+�,�@#�a/Z@%ʑ�k�~@'���}b@)ȕ�N'@+�`/�>@.&-Aē=@0<��Su,@1rO�@@2�о��>@4�`!��@5[�O��@6�/�)��@84�a̭g@9��2�@;?ׂ�g@<֭�UFY@>z�㥈�@@��"��@@��#�@A�}#�?V@B�HQ؏�@C�I}�ڒ@D��L�R�@E��*E*5@F��I���@G�s�б@HƈqR]@I��P2�C@J�T���@L9:v�@MD��=��@Nt� F�@O�pw_��@Pr}"��r@Q[���o@Q�S�h�@R^e��O*        ?�uޟ��A?�_8�0q/?Ð��Z?�?��h0?ᾥz�Z?��Y���M?�ax�1�D?�(l�7�@�=�' ]@�W�S�<@�R�>bQ@?�/	�@�-�k0@�b��y�@<��WU�@!t9$1��@#���I̴@&������@)t�A��@,sx�K��@/��t���@1v��L�@33�c�Ż@58kğ@6���@8�R�n�@:�Va�%�@=o�͎�@?C���_�@@��h��@A��膒@C'�OЭ�@Dg�a�@E���{9�@Gd���@H\/����@I���"��@K,����	@L�JTLW@N �N��@O���f�*@P���/]�@Qg��j9�@R8Ghq�@S�R�T@S���K@T��e�#s@U��h�@V�FlA�N@Wr��8�@X`Z��^@YQv�[l`@ZF�1Ǽ�@[@�@�@\=*�iv�@]>x��@^Bɇ�@_K;�B��@`+�F�-�@`���)��@a=gwJq{@a����@bVo��.�