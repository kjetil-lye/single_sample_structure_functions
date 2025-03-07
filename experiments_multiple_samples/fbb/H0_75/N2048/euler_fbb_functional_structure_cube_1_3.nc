CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T133903        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_xml           �<?xml version="1.0" ?>
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
          <value>0.75</value>
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
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�cg��Q�?��?�y?ҹ�����?�	��>W\?�n� �S?�=�q��?���n?��)�D�|@��@�]�݋�@
�ZTD@�f75N_@H���]@�)@��Aӟ�@�'�Ef@�t�A��@ xAgG& @""�7�@#�#��@%�3/�!�@'���k��@)h��B�@+_�c��@-e6��[�@/x���|i@0�LV\@1�)g�-@3�읈*@4'�R�ύ@5R�>�	�@6��F �m@7��M�M�@8��_�@:?l�e�@;�C
���@<�c��Y@>/UH��@?�Ӧ�_@@v.n$�>@A)��*�?@A��s�X@B��oۄ�@CT��@D�W@D���f�@E����@F]���\�@G&}���@G�ÀcU�@H��:mjK@I��eԼ@Jbg(W�@K7s�w@L�=�D@L����@Mĸn�Y@N�����@O�����@P3K���@P��ss�@Qt�E@Q�'%o        ?��ݽ�?�]]{��$?�e�`QL?�P��t��?���f�?�N�k~�?�N�����@ ���bd@.�`�x@	���tzw@�zW�H@��5��@׼�d�@ޘ�܃q@�HR3,@l��T)J@ �ɔ�y:@"�ƶz�@$��L.��@&�O����@(�g��q�@*圠(��@-�,�c@/\�����@0�9*h}@2_ 1��@3G�&�@4�^���@5���Ί�@7*��K�0@8��ʩ�@9��W�@;S�4��@<�+�ԡ
@>?�FC8�@?��:k�@@���P�	@Al\��@B7�J�~@Co�d]V@Cص4��T@D�mξ��@E��^�W\@Fd����@GD�X8@H'U�B�@I���(^@I��q�X@J�'����@Kի��b@L�o0x�@M�k��C�@N���C "@O���Y@P\8�?�@P���}U@Qac�(��@Q�L���@Rl�6�<-@R��D'��@S~7�S @T	8m�@T�����'        ?��gA�9�?�o�?֖�^���?�\)9t�?�M&��?���8<��?��-L�@���y�@Z�y�v�@9��2]@A�jy��@{L��<@%RX6@`�Mhj�@˥�QA@ 2NB7�@"M�ϓ�@$O}t�@&�Q[W@(@�/��r@*x�yI@,Ŷ�<گ@/&�&�/�@0͛(��@2�=���@3_Z�{�@4����@6��@7��m��@8�Tin@:o�_�@;��Z�@=�`[�e@?_�Ktx@@[��k�{@A/2t��@B�ČN�@B���L��@C��Su�@D��L�@E��─�@Fz�d#;�@GjN�}2@H]�;�@IUN*/�*@JP{[*7@KOeE$7@LRb��N@MXR@>+@NbH.tr@Oo�^%�L@P@��p2[@P���B��@QW��?@Q�o(h�@Rt��Y�@S)���@S�V�D�u@T.=l$A@T�� �h�@U],w�A6@U�/f¡O@V��eE�        ?�ĘJئ?�J��?�0��K?�S#Ӂ?��{�@ @s����@
��4@����4@�Gª_�@m�jLF@[_쉥�@!��5��A@$�nW�+@'��y�o@*�E��Q^@."��m�@0�<-�Ql@2�^d��*@4�2�"��@6vF���2@8}1��(�@:��+>�@<�#���@>�=�V�@@���s@A�W��@C�=�(@DA���>@E�����@F��}uV�@H&�c�N@I���rK@J������@LM9��d@M�}][�*@O4���	V@PY>q\)Y@Q�3�^;@Q��7^�@R����v�@Su�v�q@TE��`@UL̤�@U���}�@V�f�@W��uā�@X6�@Y`dإE6@ZD���@[+؛��)@\��c]@]���B�@]�!�_�i@^�ayЩ~@_�R�g�@`hw.�1@`���z@ad ���@a�m�=@bd�i��@b����*@cjT��<�@c�����e        ?�in�/�?���y���?ҽ�s��?�bW�?�p1��?�=�Hm{?�& ��g?��O-R�@v��˱�@uI
>�@
��(!ɗ@j��8`4@,��%�@�)�h��@�Rs���@i�s�"@j$g͑@ E2����@!�g9ά�@#�::#�@%NB:�Q@'$��@(�qT��u@*��=�o@,�+}|�@.���t�@0f��`@1q�n�J@2�s�:@3��T�@4�l[`�@5�E���@6��O��@8+$�6D@9\����
@:��mm.@;�ԘI@=�)�E@>Vf��n�@?�׳&w?@@w��=a@A!���da@A���rz�@B|���@C,�=qM @C�z@tp@D��T���@EJvy�@F2��;@F��n�Dh@Gz��d2L@H9/�i@H��f��)@I��E�@J�3j�R%@KF/M���@L�e@L�o^���@M��f���@No��u��@O>��@PJA@Pp���        ?���M
T�?�ga�z|�?�j
��R�?�Q�t,�?��g��p�?󥾙]�?�B�dl�I@ �/��VD@�x/�A@	�j��@|BCv��@���@�o�'�@��"va@�70�@ ߊʘ<@ �)a�8�@"���u�@$uX\Ly@&e���@(g�o�Ҭ@*z�*p�@,�	==]�@.��]`�@0�˚�Qm@1��@��@2���7�0@4�u:@5_U��
=@6�!'��,@7�/�@9Lh2h27@:��_R5@<]��@=y=�:�@@>�N�@��@@2N���@@�֗^��@A��kԚ�@B{Hp���@CD��hMS@D���|@D�#�@E�䶴@F�-8�� @Gd��g�@H@�+�w�@I p��'@J�<�!@J�N9�(@KХpL�E@L���)@M��q4�z@N��dzk@O���-��@PB�:k*@P�NZU?@Q=T0'<�@Q��`v^@R=k�x@R�t�=G@SB�a?�@S�q#�        ?�W��*|�?�i�)J�G?Ձ#�,�?�l�>��$?��u?�?�ͪ]��?�}~=�_�@N���@;�(+J�@	�kZ~4�@�vs�G@#\��@�*���@���ѝ@:cnW�[@�����i@!�u��@"�vO�-@$ӹ_?ؕ@&ъ�؟�@(���)�,@+��$��@-7�Uv��@/}#���/@0�e�@2.ڥ|@3X�f�\@4��҉�[@5�Z���W@7;��C�@8�0�U�B@9�b|@;d{�Bg@<�K%���@>Oj�IƊ@?��Ԗ�@@��r�A�@Ar�u���@B=��o�@C�1l��@C�v�G`�@D�~��@@E�㚗CM@Ff�j�B@GE��S�@H'���.�@I_�/@I��+�@J�޿:u@K��x��[@L���yZm@M��ܑ��@N�*B�a�@O�W'�ɏ@PT�v�@P�K��S@QWM��v�@Q���mn#@R_�l��@R����ۿ@Sm���a~@S��9�@T�'0��v        ?��w�?���$��?��_t��^?�Ւ��e?�(�(��@)	�b�@	����@w��@�F�a�w@���B�@�x6��@!u&.���@$3�P�@'y۶M�@*&�L��@-YYԇ��@0W柛�@2mb�&@3᭒�(�@5�"m�/.@7�U_� @9���9)	@;�?�͛1@=�.���@?�I����@Az>M�@B7���]@C`6,o�@D�-��@E�E��:@F���Q$�@HAB�Ռ�@I��	�"�@J�-<��@L)N���[@M��Ѡ@N�Z&��@P"�w�@P։��s@Q���>M@RGW;P�@S�䏞�@S�2\}�X@T�I���@UFĺ<2�@V�1,�@VԼ`v�G@W�#K�n�@Xk�?;d�@Y:�v*@Z����@Zޚ_]^t@[����ы@\��%D!�@]d,���@^?]�H��@_��뺮@_��$��@`nBX��b@`ߪw�@aQ��X$A@a�7�i��@b9WTZa�        ?�-WH�kc?��o��c?Ҏ*��q?�ɍ�P00?�6Z�to�?�k��?�ޒ&�S?�i���Mr@X��r��@V��7a�@
�2e��@R��K�@$��zu�@�yO�:@�9���C@yD�YB#@��Ұg@ [\��6@"����Q@#�����@%��%}!N@'[T��@)A���e<@+6���$@-:��Ɍ@/L}����@0�,9� @1����[9@2�v����@4��.��@595Q�J@6j3<yd@7�s��Z@8�ڗ��@:"O{5(@;k�\��@<������@>��V��@?j����_@@enJ��@@AE����@A��3>t[@B��/��@C@�T\�@C��;4@D��7�v2@E�H�$t�@FE�o�'@G="��{@G���Mo@H����I_@Io���*]@J@#�\�J@K���7@K�rL5��@L�P���@M�G{��@NrP_Wi�@OOb�Er�@P;ת@P��}�[@P�?���@Qk�\yx�        ?�� >�?����?A�?��hAo�H?��W�x?�Q��,�l?�DՊ�]
?���ƅ��@ ���g@��lA�`@	0���@����:�@�*c��@]]bW*W@OL���C@jx�T��@��hh@ ��`�@"S3Md@$-��� @&�r��G@(��د�@*$yE�@,B�c9��@.r,it[@0X��L!@1�KQ=~�@2���(�L@3晃[xX@5%�N�%@6k
gv
<@7�E���s@9��M��@:hC�]4�@;����Z@=4b ��#@>�ǹI/|@@�%�0@@����}@A�.M��*@BT��e�@Cz���@C�p��@D����dU@E��R'�@F`]᫅@G8j��&@H�E肤@H�[\��@I�@�J^�@J�V]p�G@K�C��E�@L� �L&@Mt���@Nc�@��@OU�>�@P%N�R��@P�
*@QPf�@Q���(�@R@F�*@R�J���]@S�R��@S�Fi��y        ?�D��}N?�4����?�X�G�g?�&4�%��?�,6���i?����ˌ�?���&-@�dK��>@��fv@
�V�N��@���[@���s�P@ۨ��@	���@el.��@�_1��@!�~��!�@#�D0e��@%@ln@'�E�{�@*1���6@,C��h�@.����@0|?AߚN@1�(�@2��{�qx@4Gy0�/@5��N��@6�	� .@8_�7y@9͈;��7@;CR ��;@<��0�T@>FRN�X@?�KXʡ�@@���@A��Ri77@BSlX�B7@C(��5�@Dl4���@DݾFPf@E���s'�@F���3@G����Q�@Hq�}�TX@I_-�J� @JP����@KD/w�#�@L;�zʡ�@M6Vz�A@N4CX@O5b!��@P�5�_@P��欪/@Q%���,"@Q���J�@R5�?�@R��w��`@SJ<O}��@S��@Teb��ؤ@T�#���@U�Sn��+        ?��׊l6u?�ͱFU
|?���O��?��xܒfe?�29Z�1@2���B�@	�����"@���o�@�$�r��@F��@�i����@!��ʕ��@$e[Ͻ@'[b�:h0@*{'N�o`@-�L(�!�@0�K���@2c�hB�<@4A%3C��@60c���@81HR��(@:CpR��@<f��ڀc@>�#��@�@@o�!W`@A���}�@Bʪi0@D�Ϩ�@EE���@F�y�j�@G�,7�5%@I4����@J���pG@K�����@Mb[�D@NԢ"��@P&�7��#@P�]}��V@Q�)�Ә�@Ro��v�@S8��!�@T�m|�@T������@U��S�@Vyl�.5@@WP��X@X+*Z�|�@Y#�Of4@Y������@Z�aw��@[����� @\�Wd��@]�?_�4@^l��6�@_[b��1@`&D�@G�@`�P�j@a�u{8f@a��x6�@b��B�@b�L�u��@c����@c����        ?��G�"nU?�-_�Hi?��[�?����W�?�9�?�?�Ti[+�?�:\E?������@�=�e�@�թ�O�@	�(�wv�@)']@nmΤ~@�����@��LO�@?�HS�@�>�VU@��&@!j���a@"�'-R��@$C�p�o�@%�Pȉ@�@'��
oXX@)p)��I�@+@�I�~r@-��{�@/D?�@0y8�F*�@1v��:�@2x¼�)@3��U�@4��=��g@5�gI �@6��A��@7�`)�*H@8�o��@:+~&_@;3�k�@<^?1+Q@=��9��@>�$ݚ�8@?��:l��@@�2<�o-@A9�1��f@A۽ӷM�@Bd%�j�@C$���@C�B�bܢ@Dui����@E Tk��D@E��KtZ�@F{NҊ��@G+Lr2@G��g1`@H�>μF@ID�z���@I� ��@J��5Z�`@KlX��9@L&Ł��@L�ؚȑ�@M�PTF�'@N_'��X        ?���ήFM?�O𦁳c?�U�"h@�?�Ai�=?��'P�t?����?�.��",8@ �OA�@�a_Q�@	{�,5@c�{���@�7 ��@����y�@��;�b@��ơ��@	pn��x@ ���*/
@"�:�R$:@$gK��Q@&WCz���@(X�6Y@*k=�E��@,��^�z5@.�*��&p@0��	�]@1��q�˜@2�.�k�/@4F)-U�@5W�WQd�@6�·�+�@7���Q/@9E+҇T@:�i�ץ�@<��^��@=qX�j	D@>��Z��@@-d�L,[@@�гU8@A�����@Btw;���@C=
��K�@D�
gѕ@D�>?��(@E�Ʉٞ�@F}?�->@GT���m�@H.��g��@I�g��@I녶dq@J�
�>P+@K�J��]s@L�@��C�@M��"� @Ns:<�y@Oc/�/q@P*���:)@P�u§�@Q!Q���@Q�uS@Rݲ���@R���x�@Sw�ԇ@S������        ?�`�V�s?��C����?�ǽ��Y ?��r�m?�ŝT׭7?�*$6�%g?�DE���?�'|��9X@eQ�@��Q:d�@����@u�_l9�@t(u�@�7w�#@�Y�x�c@��D�A�@�c?4�@!j�(��@"�_��5.@$r�0�F@&A���B@(�C��@*
J?~��@,\����@.	�`g�@0�����@1��@25A��;�@3Q����@4tG,��P@5��g���@6ʯ0���@7�]@�zD@97���v�@:v%i��@;�	�3��@=!|zy�@>QT0��E@?���ڤ@@~W��]@A,���Z/@AݭۦV�@B��f�79@CFW��~@C�C]�K@D�	�<@Et0lw��@F2�H3@F�����1@G�{��2@Hz����@I@�4�@J	{9���@J�.4 �@K��qiJ@Loz��x�@M@
�έ�@N����e@N��֟@O�)�!@PJ��݁�@P��X�eC@Q%�{ͦ        ?��`Sm�?��!%��?�	���QA?�)�%o�?�!�§J�@mc��P
@��1��"@�#�e�@���`Ew@��@��@�&�Nb@ ���K�@#O�&	��@&S��)�@(���@+��#�=@/x�_��@113`��@2ⵎ��@4����h@6p���@8La`���@:5$�/�@<*����@>,�)�@@Q�e�@A*8�e�@B<�*�>�@CU!L̞!@Dr��߈@E���)@F��1k�0@G�,���9@I�I �@JV�f�z@@K�`vo��@L������@N54X��@Of6K-�|@PZ��r@Q~+`�@Q�dV��@R_�*a��@S� ��'@SÐ����@Tx�wS�"@U/�䪽a@U荛�@V���od&@W`z�ob%@XMM��+@X��`2$@Y�xQ�W�@Zf�D��+@[,���@[�|�G:@\��^��1@]��z�4-@^U�D�lB@_#�7	�@_�A�~@`bk��Z9@`��	�6        ?���ଦ?��_�!�?�����9?�E���?��%�ӣX?�90��t?�l�"�?�")���'@̵�@�M����@W2���@yb�Nb@��p�kW@Q���@-�T�@-�k���@R�����@ �/��@"�(��]@$G���w@&�Zx��@("�V�<@)�4��t@+�i�ާ4@.uq���@0�����@10t�?z^@2OdXO@3u6�?�@4�κ-�	@5�����@7�� ��@8O+�I��@9��Ǖa�@:��|!�@<5�4��5@=�K����@>��/ď@@*٘�@@߮R"�@A�A`�ʕ@BS�*��@C}z4q@C�2���@D�"sm�"@E]҈[U@F'9���d@F�O�!�@G�J�^@H�j��~�@Igb
]J�@J=��2F@Kڲb@K�N�F@Lлr�#@M�Sn]|@N�a!c�@Oy߯���@P0�U��@P��1B�@Qi�2��@Q���(�L@R��s�        ?�{L%�?�接Rջ?�1��+?�����S?����ӳ?�,/2���?�V*2��`@:VeS��@�~ ��@�[P�J@�~j\�x@t�̅�@��w��Y@��N0�>@X�榃�@ �C�(t @"o��@$r.uV�@&�11��@(�cͺ��@*���E(@-T7��K@/����#/@1��O��@2i3�
�@3�0�@�}@5�����@6~.g�<�@7���#�@9d�)�c@:�9�9�@<n�]�Z@> �-ʂ@?�:�)�0@@�'���U@At䞴d�@BNɑ6M4@C,�u�)b@D��/��@D�v�F%@E�!�@F�6
���@G�8��@H���l�@I���sM<@J�xq�Z@K���q�;@L�
,��	@M��	3@Nȡt���@O������@Pv���m�@Q[�J�'@Q�O���@R���6~@R���8@SC�D��U@S�£���@Toh&��z@U��o@U��I�9j@V=�/�@Vۈ��X        ?��9���D?ĵq,�E�?�ϯ�#�?�1VJ?�t�뭩?�����U?��I�X$F@Bļ��H@� ���@
2��vS�@D�����@\F�Կ@E�Q@[>:��%@�]�p�@
 "��M@!P)�no�@#/n$վ�@%"Y*��=@'(p�%2�@)AC�YF�@+lj�&b�@-��7c�@/�/[ǁ�@1,BGC=@2dt;5�@3�-�j"@4�h�&�@6?�6��@7�����4@8����@:`��Ze�@;Я!+��@=G�J��@>ƙ~|~�@@&5��B@@�%�@A��r D@B��F`�@CTʴ��g@D(�{���@E S'��@E����]�@F���iI�@G���yW�@H}��K^m@Ie3|X�@JOsQ�Ũ@K<����X@L,�9�@M ���L@Njy�w@O��@PV$��@P�����@Q4-Vd@Q�-l��@R
{hG]�@R��MD�@S��@S�1��ް@T$�W*��@T�Q/�G�        ?��Ͼל?��VvK?�3-[�?�|dz�z�?�+X*��y@�w`	�@
�(7pL$@��y@^8 '�@4��6@��.��@"AX~d>1@%'�E{K�@(;t�H)@+zѼfRq@.�t6i�b@1;��>.�@3�l���@5	9,�P�@7�Fc@9"B�|�1@;I����@=�	�%]@@?�R[N"@A1d�T�@BI򮴩@C�ĿA0@D́��n@F4<r�@Gp)�ߞ@H����Qz@J0���+@K�70�L�@M���X�@N�Wu�/;@Pwr�mb@P�5��^�@Q�Z[��@RY��Ai@S'�HS�t@S��r�{@T��VZ'@U���eJ@V:AZ[�@W\�(_*@X=Ǧ4O@Y!��9�r@Z\�r�@Z�q:T@[ޞ��f.@\�:��@]�Iz@\�@^�Q�F6@_��#��@`S��#�9@`�pW�*t@aRf�	n�@aӲ�3}@bVQ��'c@b�Ak�e@c_{��@c�
���@dm�p�-L        ?�|O Ȭ?�Os�ޮ?��t��?޹k2�0?�g�q?��dO�Z�?�_�V۴?�jx���U@�Σ��@�t�BW1@	�_��*@4�Q躴@|�P�@���n�@��@:�@w�0D��@cN]#@m��Z>@!K����(@"�����@$���/m�@&`�A�H9@(.9��z@*	e*H�@+�ќ�z=@-�?����@/�qH+��@0�w��9@2	��a3o@3F1��?@46�;6@�@5Vw{��@6{��kȗ@7��kV�@8��V{�@@:Y�U�@;J^���@<����@=�ϱ�W@?#�?�@@8fs0�@@��?h}�@A��̨^�@BB�n�b@B�����@C�b_e�@Dc����@E1,X@E�
G8o@F�bZ�@G\T�w�@H -*�@H�^y
�@I���U~)@Jy��{�@KFɾ�@L	vƖ�@L�w�3@M�`�p@N��[��@Oh�BjA�@P!J[�5@P�L�!�A        ?���e��?È�t2��?Ԃ�È��?�5)e�?궟F$V?���:�r?�0n٪�@ /z*��@,ȝXR�@��1%��@H�W]i�@/���$�@�g�N�@ƺwD	�@�E!~'N@����#@ )�g)@!����@#��U��@%���f��@'�l��8�@)��M+D�@+�+��N@-�Lȃڮ@/�Լ��.@1;\�@2<s����@3j�O���@4��8-��@5�+_i��@7 �bw#�@8j����@9��ԳSg@;p�ni@<qi��n@=սo9�
@?@V��yi@@X�NI�@A ?��@A�tZ���@B��!5�@CX@O�)@D�ϛ��@D�h�P@E��T���@F�n3��!@GYӠ��@H.Vmӏh@Id��J�@I�&�v�b@J��+���@K����b@L�Oi���@Mf�&d�5@NNQ��#�@O8�ad
X@P�<v\:@P�@�/d�@Q�|�s@Q}m��@Q�1���@Rt��k�@R�	���`        ?�(4k�ޥ?�;ϗU��?�O��qdP?�B�A+v�?��Nע��?�3 f?�@�oX�K@ ��]��b@
��I"@	�>]�W@�]�<Ȱ@�K��@��:�Lc@�L� ��@�Z6!O@Q� (b�@ �	�\@"���)0@$��Pm@&��]��@(��2�@*��g��>@,���$@/-���5@0�o�� @1���	��@3%Zi�o�@4d}��{f@5�6��@6�_;�d�@8N�d�9@9�u�
��@;t��\@<y�lk�\@=����@?cw_@@p�~�\�@A3R���A@A���d�@B��Za�@C�� ?/@D\[�v@E.!��4�@F�Lâ�@F�u��f@G��	��_@H�X��+@Ir�Ԍ�@@JU�z��Z@K;oa��@L$	����@Ma��a�@M�q	d @N�1��J@O�:�>@Pkي�i)@P�4J	�O@Qe�
���@Q��C��@ReR�ǹ@R��y�@SiO�x�@S�O	C��        ?���G"�?�
��?��?�"��0}?�)<��W?�%l.���@t����@��;:�@��P��@ͬW� B@�X;Kr@��:y��@ ����@#�U�޿@&`��o^@)Z��N�@,z�w;�D@/�����*@1���@3W�4�_�@5,��;7@7`�m�@9�<�4@;a3�R@= D�צ@?C0o%r@@�,]�J+@A�+�I!@C ����@D.�]A@Ec]���h@F�ɦJ��@G����@I)���	�@Jx�.���@K�JˑT�@M*1�r~�@N�V��Ю@O��EE��@P��$(�[@Qk��	��@R)�Ez@R�>�(��@S�X���@TrM�IM@U;����@V�>���@V� /���@W�t��?@XyҢ%s�@YP>[:E;@Z)KCE.1@[񣆡%@[�*�[��@\���s�@]�:�@~@^�MOp6@_uG�VNI@`/�o��
@`��Els@aX��@a�P��M@bu{$`�@b��Y8G|        ?��!��r�?�]bs��?�HB7�l?�Tͪ���?�ަ?��?�٤��	?����\�?�.�~�x@u��ѱ@1!�2$@
L�O��@��P(@�+jj@{�ȱ�@8.�+�@Z�4w@l��w@ ��7@!���!2�@#m�[���@%-
Me��@&��W��@(֘�i�@*�Y��7�@,���:��@.�-8}8/@0f�E�
i@1u�2�ͣ@2�+B�Q�@3����*�@4��&ˢ3@5�y��'@7	��ć@8N���@9��ތ,�@:ĤbDd@<ȍ�F@=PB{��!@>����m@?��M}X�@@�s� @AR����z@B�pT��@B�n�~�U@CmT^a��@D%��Cڨ@D�V���W@E�g�Db�@F\ϭ���@G�L�)y@G���
@H�ڄ.ܮ@Iqd�t�r@J<'�xЉ@K	�[@K�? ^�@L���E�@M|�Lb$@NRp����@O*��#�@P�E�T�@Po�&Ը`@P� A        ?�H]��?ļ	:��^?�����&?�6k��?�]x6�=�?� r�A��?��>D�@-��2�@h��T��@

���"@[b@9��Lf@�/\��@$�kY+@Z�;�54@�K��?+@!Ŝ&p�@"��W>@$�$���	@&�a��a4@(�a��B@+�'E�A@-5 ���K@/t�o��U@0�bj�8@2FC��@3I�T�N�@4�(�S7%@5���|@7�B 1�@8s#��"@9�s�27H@;2�~��@<����@>���@?�,o�p@@���:.@AC�Ȧ@B	`��÷@B���VQ@C��Et_@Dl�p�#�@E>���%�@F�c�ϔ@F�u,�ږ@G�\K�@H�-�a�@I�ܾ�n�@Jh`���@KN�O��?@L7�|W��@M#�Uj`m@N?1]@O!�鳘@O���]��@Pv��V|�@P�����@Qp�����@Q��!-�@Rpw �@R�\"I@St9��q]@S�"���        ?���S�?Ĥ����G?�����,�?��!�?�fnk�CJ?��`���?���V�@?�?�lv@�M��
@
3P+�ϓ@H�6xq�@`4``aT@K�a��S@eA�|?Z@�t��x�@y q@!\_4�w�@#>�(��h@%55o>}�@'?3�O��@)\P՜y$@+�#��y�@-�L�ܵl@08���@1D���@2��@3ø*VK�@5!�_��@6d��@7�t륧@9&����@:����@�@<���	@=��/.�~@?�Ti�g@@H<Q��s@A1�7��@Aݾ�s!�@B���,�-@C�uS�\�@DX�:[�@E3���@F�E��@F���i�@G։E܉�@H�C���@I�4g<b@J�RUU�@K��3��$@L|��/�z@Mtl���N@Nn�����@Ol���@P6��9)@P�O�,x @Q;��B��@Q�G��&@RFr����@R�
�K�@SW��Ь@S�z�	�@Tm}V�&w@T���#�        ?�o�l�?Ә^1}��?�h�?3^?��I��<?���7�g�@�2C�)@	wE�k�@a(^>�@o��-�>@�sH��P@���%�@!r��O�@$6�U;�@'%�Hd@*=p)�_ @-|����@0q<�qK@26�&ut�@4�D�d�@5���>t@7�P���@9���#�@<��-��@>?����@@<A�9�@A`ls�(@B��6̳@C�ڑ���@D��@��@F9g�=��@G����C�@H�U�i@J#ל��@K���I@L�����+@NHE�j�<@O�)�3��@P�����@QQ�"-;@R�B�na@Rԥ�!S�@S�E�1n@Tb�0}��@U-�S%�@U��J�r@V̮"���@W��S/�@Xv6d�Qz@YN�~-g@Z*J��,E@[8
�N@[�ӟ��@\˶����@]�8�&J�@^�42��@_���f�@`8=͇l@`��%H�@a(�]��;@a��1C��@bǠ�I�@b�ɸQ�@czϜʭ        ?����B�?�,��A=?�$�Yp?�i{��[D?�qN-z�?��ah�U?��p��?�z��s:@8�,C�@3���i@�V�L�@O�k�&@쾴��{@�/Sd�@��w��@��ٿ>@�6?���@!0��6��@"�h�[�J@$�<��5@&�����@(�=N���@*��p}
�@,ӢR6��@.��p�T@0����%c@1�@�J\r@2�Fܸ�@4#�ڞ	0@5_耣�a@6�NjU�@7���κ@9?��;�O@:���(#@;�`a���@=_vr��@>�v3[�@@ HpS�@@ݠ��ɣ@A�7��?@Bb
I�@C(��i @C�]��@D�AO
AI@E�}r��v@Fc�gs�@G9�0���@H}�a�@H�$�i��@I�\��v@J��*0�@K�/�c�k@L{]�q�N@Me;�M|@NQ�Ӓ@O@��^~u@PK2M#@P�izE@Q�'�@Q�` c�Z@R	0|�_=@R�4���@Si�O�        ?�Ŕ����?�<�?q�?�a B���?��q0F?E`u�?���{7"?���8V�@���@*DzÀE@;b+�J�@��V��@��ґ�@-Ul��@eU
���@����@ ��`A@"٦y��A@$����_1@'[%��2@)U�K��@+��+@.���2S@0M{k�K@1�Is��7@2�!3VE@4PQH���@5�A�p'�@70K����@8�Lv�*�@:8#�}�J@;ʲ"� �@=fׄy�@?u~&��@@]��M�7@A9�w3�@B|SN�@B���z@C�Q՗�-@D�e��H2@E��?���@F��Rݞ0@G�ڟD�Q@H�P��\�@I����G@J�"�q�@K�P�޸@L���� x@M�y�DR7@OW�p6�@P.�e�&@P����3V@Q:c9#�@Q���yn@Re�~5��@R�~'�@S�9���@T5��&@TԬ�3]�@Uu_q�<�@V	}ڨl@V��OdD@Wc9��	�@X����        ?���T���?��Ȩ�$?��]��jX?��Ow4?� }A�Y?�(�����?���e �@V�u/��@���@@
S��C�@nf��;X@u�P�@dc��?z@��R��@ʳ��_�@?��1�@!o��6��@#T>$*�@%L��AT�@'YK .�W@)x��]I�@+���n�@-���?�@0#��I3
@1X����@2���/6s@3��y�j@5*p���`@6�T���@7�x�r%@9G�����@:����K@<.'��6@=��逖@?3���e�@@`�y��@A+�����@A�9>R�@B�Y
@�@C�j�j`@D{Q���@EX��@F8T��##@G
�ޔ@H&��D@H��1R��@Iۈ ɸ�@J̻83n�@K�;;��\@L�"�Wl@M��|b@N�E�� �@O����w�@P\+�e�@P��Jr�@Qe�C���@Q�#�@Ru
�ȝ@R�&'��@S��8�}w@T���iN@T�B:^�@U6D��R[        ?�N�(�K�?�U�p�.�?�l�����?�_��D��?�[
p�>@� �P�@
�����@i�Ԏ�@W_��@�f�P@��k�@"M�{��@%=`�O@(\�υ��@+�Ƅ8M|@/%�&�*@1f=�w@3N��Y@5K�pl��@7]h}��K@9��,ø@;�{�nv@>.n���@@2��X�@AkmZ�\@B�BӡV�@C�N�M@EI�.f@F�@�r#@H�`��@Is�	�"@J��,�#�@Ld0Ú*[@M�[߽:y@Otc�a@P�ԡM�@QQт|z�@R#T�c�@R���20�@Sс��T@T���O�@U�/����@Vq�oa#�@WX�d�@@XC�Йw@Y1���B\@Z"�|��p@[z�KG�@\[�`J1@]
t::V@^����@_
 �O��@`O5�~@`�FF�@a[D�%@a�Z{l�@bX�,��@b�U�Q@c4�G@c���P@dN��
�h@d���6R@en[X-.�        ?���]f�?�+���I�?��֙B�?������?�w�>�?�=6h�9?�Msc0ݪ?����0��@�5��@�%����@
m���@��u�3@���r%�@^���@@���=@��U��+@���b@ b'�@!��"ɺ�@#r�r5@%7�y�6'@'�i�g@(�˳��t@*�	A,@,�R5(��@.��@-m@0���*�@1����]@2�r}j�I@3�6��U@5��J�@6C�E��/@7|�����@8�8��@:ٓ?F@;M��-�R@<�C�Ul@=��Ҿ5	@?WvE��@@^�DP�@Am�e�u@A˸�_�@B��ܪ��@CER�@D�#ق3@Dɮ�l5r@E�1�%@FYo���<@G%b
�� @G� ��C�@H�E7��@I�'���@Jo��=J@KH�2Y�@L$J��@Mi��J�@M�	g?�@N�!�HX>@O����@PI�l� �@P� _d'@Q5_�c�b@Q��6�K�        ?��o0���?�r)*��?�y�=+��?�b@��g�?���ʑ�?��{��?�q~6�_@$;��@9);A�@	�j	^@�4B�M@%u�61i@
Υ�/@�Å�@\yp�H@�ͱ��"@!.׸vd@#�C�]U@%��^�R@'
i��*c@)%���?�@+T(KWNF@-�O�=ʹ@/����G|@1'A��.�@2b��R=P@3�u�lU@4�����@6J/�O��@7�1�5@9y�ϒk@:|�c��@;�o},�@=q��#��@>�E�Yi@@C5�E�@A#+��@A��J�d@B�b󩍅@C���Z��@D_�;���@E=!0��1@FN�j�`@G�/s�@G�RӔ��@H��o@I�PՌ��@J���@F@K�H˥ @L�m5��@M�'SY��@N�,	�3@O�t3�h@PW|-0@P�X�r@Qb�DO�@Q��,Aٙ@Rtp�P^@R��S�
H@S�Pe���@T����@T�XϑE�@U;�>���        ?���x@�?���~L?��mpk{?�
Ө]	?�z<�ٵ?�b|X�?��Rt��@ �2.�}@�f]���@	F�""@(�� �@����@����@@xK�TQa@�� ���@��6��@ ������@"v>��8@$T����@&D��8�l@(F���!5@*Z`�m�,@,~���d@.���>��@0|���P�@1�dI��@2�Qzx/@4�5�֚@5V����{@6�W؉��@7�i��o@9I�]�%U@:�Gb�C:@<�x�щ@=}U�M@>�8ˏq@@6c�F��@@�B_��@A�c _�k@B��w�H@CM0��Ph@D�9�`@D�]���d@E��Vkb@F�z�~�@Gn��j��@HK���.@I*(���@J��/�S@J�sI�2�@Kנ'q�@L�pE�@M�ڭ��k@N��_8��@O�a"�V�@PA6N&?N@P�y���@Q8�&�a @Q��V�ia@R5���K@R���g�O@S6����<@S�j���        ?��S�vv?�h�T&m?�	��9>?�;VIU�?�B�q�^B@���ͬ�@Օ"�Q�@�cj-@�=﬍�@O��@
�kF� @!���_@#ʬ�o�@&��E�HQ@)��|s@,�7\%�P@0(��'	@1�C�}Z@3�q*�@5�zЙB�@7�Y�Cj@9��/T�@;�Ů�_@=�*��`�@@�K��H@A=8�bi@Bk�Lw^L@C��#4�B@Dߑƺ6�@F%
M�v[@Gr ��t@H�Y���@J!�ݸ�@K��Y1�@L����@N_|U��@O�4IX��@P��Lz��@Qmv���n@R3b���@R���ٺ�@S� �(�@T���/�@Ukegq{�@VAKJ@WF��`?@W�O6&2�@X�[d'�@Y�bp�c�@Z�].�`O@[�Cj��@\o�m�%@]\��4��@^M'0<��@_@j�4`;@`:�Ar@`����e\@a^��@a�v��3�@b���e@b��Լi@c�ؖ;@c�d�]        ?�5��6�u?�����(?ғ����8?�Ґi��?�<�rZ^?�>wW��?��c��<�?�n��O�@Z����@Wv�,��@
��{k�6@NM���@ ����@���G@�1��D�@i�Dc�<@q�w�@ M"ŚJ�@!�KL���@#��� �@%gG5B��@'8P�{��@)��M�e@+��Cz@,���h{@/��]�@0�S%v�@1�;���@2�d@z"8@3ӰN3�^@4�V�p�@6 F՚o�@7O`�;��@8�;m��@9��Z�@:����C@<D���P@=���b'�@>�)���/@@��d@@ȑ�gL\@Ax�,��#@B+|�3+@B��m)Y@C��Mo� @DR���5	@E�"��@E��WSt�@F�[�㼲@GTOCk+F@H�`"F�@H�Dο�@I�;�Î@J{~��Қ@KK
�s��@Lܘ��@L��2�@M�A]��#@N��
C�n@Oz����@P+��cC�@P�A���@Q��j��        ?���/(]?Ġ﮿�?զ��Y�?�Ԓ��F?�0AG=� ?���M�?��G@��>@@�@H�O��@	�꿯Ք@�F���@!V�#`�@�HQmo�@\xL��@;C74@�@7��@!�B%�@"��l��j@$�@�Z@&�N��Y@(�/�#'@*�1��o@-)m�=�U@/k�*��@0ߢ;m��@2���I�@3K�2��@4���S!F@5װ@2}�@7)i�Er�@8����9@9㶒�@;L+Zvx@<���KA�@>2ƃUx�@?��%y��@@���B@AaԞK?@B*��@B�w;$�g@CǪ�!,@D�&G�@Eq�*��(@FK�ggN@G(�U��@H	O���@H�s�u�@I��t�q*@J�G�<U�@K��W焜@L�-&�$�@M��T}	�@N�l#�;@OxH�~��@P9�5@P���i	"@Q9U>���@Q�B���A@R>�p�K4@R�Sh�@SIo�+@S��n�u
@TY���*�        ?��T��?A?��5�ш�?��(
��?��/�?�Kv��?�?����?��/�p��@ ����sK@�6,�|
@	�S3��@�~e-,�@��[>@K" Y#	@8]=�y@NTY��%@���@ w�°�I@"<Y�g�@$|s���@%�u�5�@'�]*y�@)��PTlH@,��$��@.A�pQ�V@0=�RV�z@1b�^�?t@2����I@3�<�vw@4���s@6>��V�@7�xԮ�@8�'T4��@:-���r@;��)�g?@<�^�/{@>X���7@?����@@����@A^n��U{@B k�Fc@B�
�j�@C�'u���@Dv�O��@ED�;��@FC$ �O@F�Q����@G�*���m@H�Ǵ'�@Iq"�wZ�@JO4Rl 5@K/�T �K@La�X;�@L�o�X�@M���P�@N�]uE@O�3{k��@PU˫��]@P�B�J@QI��_�@Q����%@RC%">��@R��:��@SA2�v�        ?�� "Kq?Ӫ�%ф?�)��?���7h�?�����W@kC��@	��`�@eA�R9=@r��C�o@�@�TV�@��I���@!p}*�1@$24I�3	@'�Guj@*1�#�wo@-l�6���@0f�d���@2(�H��@3��?S�q@5���Li@7�t���l@9�H��S�@;���@>�X
@@&���@AG���<D@Bp:�Y�G@C� �O>z@Dֹ���@FC�^b]@GX���}�@H�V oԹ@I��'�@KL^XC�8@L�e��@N���@Oyy�aT@Pt�����@Q04Ҍ�@Q�RnQ�@R����`t@Ss��f�
@T:�����@U|WMX@U�,�C�@V��e�8@Wr�vW�@XG��[@Y�6dA3@Y���T�@Z�+h&�9@[��*�N�@\�LNj@@]~IYX�G@^e�e]H�@_P���p@`\,jOU@`���dRl@a���l�@a�����<@bPx�@b�ὸ��@b���� ,        ?�L8�v�?��7j&$?ҫf�B�?��ϥU�?�X>�K�*?�-,(2?��v�o�?���n~�@i6[�@g.����@
�D#�@^�K�g�@(r/�Ě@���ja@��ßL@mbcaH
@r�\ү@ LD���@!�F�� @#���t?*@%_y�IY@'-R�p
0@)��w�@*���Z#!@,�H%��@.�=h`�@0|��h��@1��QgJ@2���(�7@3�S��@4թ�n7@5� ��~G@7$���$@8SS��*@9���1�@:��=��@< Yxw@=D�4��@>��Z�<�@?�RDn�g@@�L8v_�@AA��=[@A�Ւ��@B��,Ux3@CQ�^_@Dc��-4@D�����@Eu���@F0��1�s@F����],@G�̔�˚@Hm�~��@I0�h�*!@I��u�]@J��XR�@K�ճ��@LP���G{@M(��@M�\�@N���c�@O��l�Ծ@P0�#� [@P�W�#��        ?���ܪ?�|;��y�?Ձ
�ED�?�c��2UK?���I@��?󶘏*?�V^J���@ ��kS(&@o�
��@	�"e���@���Bv�@�G�:��@�9�b�#@�hqo)@�FR���@p�^�@ ��j��@"���@$i�(���@&Wd��@(U���f@*e"���@,�����w@.��%�0@0y���}�@1��VB@2�T��@4`|;�o@5B�S�ƭ@6�"k�,@7Ҥt�0c@9%M�N�@:~sc�@;މ�D�D@=EG%b@>���=��@@*-I�h@@�9��(#@A�lA�96@BS��/@�@C
���?@C�_Z6�@D���zz@E~۴w�@FP��L��@G%��t@G����0@H��a�@I�1]���@J�����@Kw�%�~@L\�oi��@MDբ|��@N/Z�V�F@O{s��@P���@P;$�� @P��F�@QuNb���@Q�:�fjP@Rpf,�v@R��� ��@Spt&���        ?�O�Mn�?�m��j_?Յ�E ��?�p6WiS�?�z�a�?��K�+�J?�~5��)�@�ѳ�@:r�y�Y@	�y�� �@��P�CJ@���4@�' ㇓@�ܗ�]@4�Q��@�`7-�@!W;镍@"��>2l�@$�{[�@&��4^�@(���9��@*�ٹe�t@-2b�3�p@/w2[���@0�|"��@2�����@3Uk�8@4���p�Z@5�
p�z{@77Ny���@8�J��Ҷ@9��瘿�@;_%�"�@<Ў���@>IqL�:o@?ɒ����@@�n%�oU@Ao���@B:LNj�@Crt��{@C��TF�@D��"�@E�TN1v�@Fb��[o2@GA��C�@H$9�<��@I	�hDh�@I�|���@J�rR�ʌ@K͗��CB@L��n1��@M�[�\�9@N����L�@O��;E�|@PT(]�R@P�	L�@QWj"��@@Q�H�H/7@R`���W�@R�q��ia@So����@S�f��G�@T��~Z��        ?��8Bj��?Ӽ��T��?�±����?��F��? ?�:Cɳ@�~�w@	�x-#�8@l�l���@zg��.@�2��~@��r�R@!q���:@$1q~>��@'�֝ۮ@*+�e�i@-b���d�@0_;l�� @2�j�C@3�#�V�@5�!���q@7´8
�H@9���א�@;�lF�+@=����@@���[@A.�i�@BS{�SE@C �]�0@D��[@E�KB��@G(q��g�@Hmq�c_�@I�~�D�B@K	|��m<@L`Q��Q@M�����.@O	��@PCgC���@P��u�m@Q�@x��@Ro%5�fa@S-�i6�@S�[�O�@T�:o���@UxCl�?@V@��b��@W�CqE�@W��#lKZ@X���l�)@Yzu�
@ZN�ti�r@[%*j�z�@[��8=7@\��#��@]�Μ?ND@^��eV�@_v&�Z��@`,����@`�Ou��W@a�ۇ@a�z�S'�@a� d;�@bst����        ?�}ޤ	?��Q9݋D?���j:'�?�/���:?�컁x�?�j����?�P�4+bv?����!�@����q@�Y:#�@6���W@�<]m�@���i�G@6��ev�@�ñi@	�4H�<@)�^�@ �p���6@"g��@$)ֹC0@%��L��@'�%���=@)̠n׏�@+���}e�@-�הe��@/�����@14��m@2,����@3N֯k/�@4xD��c�@5�@H�C@6ޭ�e}d@8s�.�@9^{�7��@:���_-�@;���@=Lb���@>��\-ː@@v�7@@���,�@AnW����@B'�	5n@B��n�f@C�A%�>Y@Dc�����@E'�=g/~@E� �@F�����@G��!���@HR�b�Xf@I#��@I�6*ޝ @J�Ig�@K��)Z<X@L����@M^0aen@N=�����@O nvM@PN2�u@Pu��R�@P�Co�>�@Q_�gD�c@Q���P�        ?��K�>�*?ģ��c�^?հJ�ژ?␄b�8?�C�Z��?��&x��?���h/t@$��5��@`��<'@
�=$�@�:%��@;�k_��@�j2�>@/��j�@j���@�-�(@!/N`���@#
ak|�@$��L��@&�qK�@)�$�Z�@+3���b@-k���8�@/�ɜ�@1�X��@2=HL�6@3{I93c@4�~	���@6�L��~@7fl�TB@8�1ύ#@:*ue��@;��p��z@=��� @>�b�	K�@@�y�*@@�]x&��@A��'�3@Bbr��-@C2��&V�@D��>�@Dݥ_W@E�$9��$@F����@Gw�v�,@H[j×@IB�z�L�@J-��XR@K�M�S�@L�b���@M �(22@M����m�@N�_��P@O��a��@Pw[��r@P�ɺ�4n@Q{�=aV@Q��IY�@R��Yl��@S����@S���@T��өV@T���o�        ?��D��z�?��S����?�����?⸴ί?�$�x?��G���?����I@D�(��@�:�w�(@
-���@9v���2@R`1���@5��+��@E��9d�@�V�XN{@�V���@!8Fڌ�]@#��4:�@$��lz
�@&� K2!@)~�S�@+2�\��@-goO���@/�&��Н@1�.��@254�aqo@3p�\���@4��;@5�>h=�;@7R^�>�@8�x�3��@:Lݿ�]@;wy �~@<����!@>_mݖD[@?��D�t>@@����>@Aw�${{1@BAp���@CNB0�"@C�u���@D�ݛ�! @E�|���/@FbKO��D@G?Buc��@H[����@I�!�kB@I��D�~g@J�=�Я�@K���.��@L���T�@M��L�D|@N��H�L@O�KP��y@PD�Tm;L@P�ܜ�6�@QD^9�Ou@Q�IX�_@RI��x�@R�O�7�@STbG��@S���21@Td�z��7        ?��?w��?���^ʿ?��h}х7?��r���?�ki���@\�$�J�@	�=��s@�T�"��@��[��@V�,�;c@A���3�@!őT��@$��$�q�@'�� ,-�@*�G�V�@.i�Q�@0��>0�@2��}�_@4u�j��@6i�Ι7@8o�$�4�@:��ҷ@<�v~/��@>�ǽ�$x@@���Hhj@A��`��@B���H�J@D38 ��v@EvHt$�@F������@Hr&a�L@IkMM<>@J�1W-�k@L2�,� @M��=93@O jX�M@PG���@Q}�҈@Q̜6D@R��y�@S^j�

�@T,��O@T��e�@U�go�H�@V�]�p@W��K�λ@X]Ow
�4@Y<���WJ@Z,w�@[��/�@[��^o@\֌ wo@]�๯9p@^���+�@_���|&�@`M�4ְ�@`���g@aGI�Z�@a��-��@bE�,Ŏg@b��u��@cI:7,0@c���#)        ?��Yj�?���R���?�u#�
�?ߜ؋�e�?��lD?��Z�zX5?���Iޠ?�:�u"�d@:7a��@0�1��@
{;2�q@�,�d@��(
�@��^O��@\����@>;i̒@B��@ 3EV�y�@!�N�n��@#���n��@%G/!=�@'2��@(�8���@*�`�"�M@,�5���@.�s��f?@0xm�� @1��_
�@2�#1��@3��*�@4���δ�@6�@77%*!U@8l0Z��C@9�c���@:�ö���@<.$y�^@=z$���@>˲��@@]�ԛR@@���)Ht@Ap}b��@B$	�ݝ�@B�3���@C��:5�@@DN;8��@E�5@E�AV��@F���l@GS�f��;@HB^d�@H��<eƌ@I���q�@J~�X(�]@KO֕�@L!y���@L��ނ�@M̈��x@N�%�<�@OǗ��@P.4J΢�@P���>��@Q�,��w        ?�	��O�m?�58�迸?�I��??��� ]f?�U*Jr�s?�f�Tw�?��d��@i�RD�!@�����@�
'���@��߬��@�Ns6�@�lR���@a$�2�@��9a@ �����@"�wI���@$�ÁI�<@&��B�@(����&�@+/�T�c@-����@/���ͧ@1?��{�@2��V�8�@3�2��f�@5@fA�<@6���J/@8�ƿ��@9� n��@;34g�6@<�Vp���@>=W�D9�@?�!x�0@@��( �@A���5+@BvA5���@CV��}>@D;����Z@E$�����@F�w�@G.���@G��:��`@H���vz�@I�uF��r@J��f{g@K�Q7�<@L��R B@N֋�L�@O��U@P^4��@P��X{}@Q3�l+�@Q�����@RU�m�@R�lfY�@S~��@��@T2íZT@T�C�y��@UJM]ۏ@U氃���@V���@W%��3        ?�V�[eQ�?�fsz|�?�co�U�?�r���q}?�wBT�B?�ǳ�o�?�i䧪�@ 177wy@И��@\�&�@��jXh@�&��\@���~>�@�̘�4�@�-w��@��Ϲ�@  ֓�< @!���{d�@#�Ti�@%X�Ѧ��@'A��Z� @):���$@+Cn��s@-[c�Z�@/��ȱp�@0�Gz��@1��dbƲ@3%EI-��@4Tv�V #@5�=O�B0@6�q�2��@8DO@9Q�%�{�@:�<�X��@;���Zu�@=O+��%�@>�8�u!@@
n�@@���ǧ0@AxC��.A@B31�e��@B𾦀;�@C�ߔm%@Ds���ܡ@E8�J�G@F ZF��@F�k��Np@G�⺲��@He����@I6ڥ�H�@J
H��v�@J��%м�@K��)D�5@L��9�;@Mn*b�<1@NL�OX�@O,�1O��@P�����@Py��t�S@P�<�iR@@Qaz���@Qֲ��@RL�&�>P        ?���
��?Ӹ�WEl?�ݕ��*?�P�u;?�~H�.2@�a�̯@	��8Ѓ@l���>�@|i�m��@��o��@�<G*B@!y��C�@$<�VY1@'*-SxC�@*@g���{@-}�ŞG�@0pk���>@24?�)��@4	�7���@5𑔗��@7�}"}k@9��-] �@<��+�d@>/,�@@2�����@AU�+RB�@B��x�@C���*0@D�5�y�@F)ڭ��u@Gpi����@H��.��@J�{P �@Kl�真@L���+@N5���_@O���h@P��!�@QIZGt�@R	��15�@R�$��Q�@S����&@T\�'P2�@U)[�oQ@U��I���@Vʹ�K��@W������@XwG�U�@YQ�z�Q@Z.��,6)@[;�D"9@[�g����@\�]�7�@]�M�h��@^���!�Q@_�
]��@`@A[}n@`����ӎ@a2@.I��@a�����@b(�,��s@b��!��@c#�ap�        ?����V��?�=[I��?�xz�:i?� `��?���X�?��A+>*?�D#��Д?�����Y>@�9��KP@�J3KV�@	�3;㫖@D�Gt�o@�>F��@ F���@��	O@`��c��@>s*��+@8�~F�@!'��cR@"��mV/�@$es��i�@&�����@'��5�
@)�9%T>e@+vGO@Vi@-W̓���@/D�AD��@0�)���r@1�t	��\@2�b��@3��]�o@4»�l7@5آj�@�@6�s	��@8D՞@97{�2�@:`���հ@;�>Ճ��@<�|�D��@=�82��&@?2ch�Y @@8�@�[�@@���@A~�!R��@B%(e��@B�h���@Cw���J@D#�[m�m@D�BN���@E�v���@F4����-@F蔌.�c@G�pV���@HV!�w�@I�-EĆ@I��W���@J����+@KF��ȸ�@LJ��g�@L��Bh�@M�b�3.@NR�t�wP@O�9*        ?�׭P�o�?ø\Ӭ�|?ԴN�s?ᶒ�q��?���I'?���N��?�h2�b=c@ RF�䆇@V�ן5�@��'F@�e��+@OdOCJ�@	ixٳ�@����#�@���؀?@+��/@ A|t��@!����Nm@#Ϟ��L�@%��yt��@'��Գ��@)�U��_�@+�����@-�5���Z@0���~@1&o4�N+@2NU&BpJ@3}��a*�@4���1q@5�b(z^�@75���s�@8����t�@9�� .@;+�;P@<���f"I@=�!it�4@?\��%A@@g�@A#R�|@A�-c@B��>f�@Cj@P� @D2��,Î@D���r�@E�񃛭8@F��t�I�@Gp���@HG���=@I!4��@I���p:@Jܢl���@K�tŔ�u@L���1�@M�2���@Nt���>@O`�����@P'��ȿ�@P�����@Q�eJ��@Q�6����@R�hMa@R��X��@S�	��G        ?�K��I;?��u��?ԅ�Q�?�?ᑛ��h�?�:����?��^�g:D?�-����C@ *xZ���@!܆6z@x}�'�@* 4�
@8����@�
�8j\@���)3�@�ލ��,@���}�.@���ݙ0@!����&@#w��i[�@%LP��@'1 fB'y@)%0hF�m@+(��*�@-:�\�=0@/[WDb� @0��M�@1��(�@3�%���@44�F2�m@5gpa�p�@6���`6�@7�7ڰ�[@9&,Y�u=@:rc�|N@;��m�?U@=H�x�@>{���a@?�?6�8@@�E�g�@A]M��}@B,�O�F@B���}}v@C�H\�@DYpl��E@EI�fj@E��*��@F��L�@G��M�mR@HP��A\�@I#�w��@I��i�N@Jвm7�=@K����@L�ri�)�@MfhI�-@NG�I�z�@O+W���@P�>bB�@P|�B��@P��*PҘ@Qh<EO�@Qߡ�33@RXB�[        ?�����oo?��M�?�TYx��?�,�R濒?�%�����@p�\���@�Z���@�)�^�G@�����@�ǝ�MP@�¦<'@ ��20J\@#]��O�@&!VTQPt@)��/tB@,�X�@/=�%���@1D)�^�[@2��� +@4��K���@6�_�}�@8l��3�N@:Y�Şn�@<S���^�@>Z��L��@@7�.z�@AF�oTd�@B\�-�@Cx��T�	@D�k
��@E��fr@F��I���@H!6 k�@IY���v@J�8�E�@K؜�ռg@M (��*:@Nl���h�@O�n���	@P�����B@Q8@�=�@Q�g3Mժ@R��rK*6@SO���@T�L>�@T�|1�--@U|.��@V:_��@V� �0�M@W�NvͮF@X����6@YF�t��-@ZQr7=�@Zټ#�� @[�(?�x@\t�TT��@]D�]'Y�@^2'b��@^�_&,Ӗ@_�j�V@`L�٨��@`�����@a'H���        ?�\�;K�?��1��{?��%Wm�?ސ'U+�?�Gz�С�?�n9��?��K�?�E�3��@��"$:@v�J�@	�qsm�@<^/��@k��ᦃ@��}O��@��Yr�@e��(c@Q�7ˁ�@]d�!1@!D��2@"�b�ُ�@$�rv���@&\�SҊ@(,?�.'@*	ZK>�;@+��P�!�@-넊@/�_0$(@1 ��GM@2m��@3$T��|@4?:�{@5`��@6����W�@7���c�W@8��)@`f@:B�9��@;Y*�H@<�t��@=����@?/�r��@@@�33�@@쓢wҏ@A�����f@BKW�a]@B�v��|@C�ԧh�@Dl��u6@E&}j�7�@E�M��I%@F�z6ļ@Gc�F�9�@H'УĔ�@H��7�z@I�Pr���@J��8nH@KMζV�I@L�	y�x@L�$^�@M����S�@N�(�{�@On�jt@P$Z�4$�@P�Q[��        ?��d:T>?Ġ�ֿ�!?ի3w�[?�Gڅ?�=S�3[P?��/��?��<�|�#@"�]���@_��Hݱ@
�u@�X�@?�p3\I@%�)6�H@:yu@z�@��'@!>C��X@#��$�>@%]-���@'��P@)2���=@+_��JsF@-�xt�)@/�e
�߲@1)�s�Pm@2c����@3�a�]@4�W5��@6D�m�|�@7���,($@9�"�3@:m��B@;�����@=Zݸ�C�@>ܟ��Gb@@2�9���@@�ɨK�@A��a۞@B�G��h�@Ci�V�w@D?ga�VU@Es��t@E�g �@F�ci@G���KJ@H�Ţ��Y@I���
z�@Jw��8'@Kh8�}�@L[�#W%�@MR�1l�@NK��[�{@OHn��7@P#�/M@P� >D�@Q'��i�@Q���2�W@R1����@R��3�a6@SA3uü@S��w�<x@TVB+&؊@T����        ?�Xe�41?�~R�@�?՜��%k�?↞�mj�?�:ã�?��1��|?���g�0�@#����@`�"�@
/(��!@�W��!@?�~��e@%K\]2E@8BҬ\�@wJPn�@�/")@!:@�0�@#6��@%	�μA@'�*�?�@)&����V@+Q��@-�bc�٭@/���m�@1�l;��@2UП���@3���3{�@4�xd���@60��'�@7��*�!?@8��F�@:S?.��j@;Ý�O�q@=;�;4�@>��b�x�@@ ���f@@����	@A�vP��@B��s�E@CR\���@D'�O�j�@E N���*@E�|�M5@F��ᄀ@G��A�@H��NhU@Io?I_��@J\L=��@KL����@L@@Hٝ0@M7�z�'@N14
Cy�@O.����@P����@P�V9�m-@Q�yIy@Q��Ɲ�j@R(E\1@R�Z�;֦@S9�
ME�@S���-@TQ�*�5�@T����q        ?��)���U?�&��-q�?�'4��?�D	\�dc?�NŸO��@�ruf��@��X3�U@�D�a �@�׏܍@GR݌�@�r[��/@!�U<��@#����@&�@�R@)�k��O@,�9Ы�@0#	 s@1����'@3��f�+�@5h���2@7T��s3@9R 1yJd@;_)�<�@={��찡@?�~\�[@@���@B�]��@CA�Se5�@Dtg,�j�@E�0h�y@F��5G��@H6BK?@I�����@J�`��9@L3+��O@M�F����@N���m�$@P4�,�-@P�W4�2Z@Q�$f�e@Rj�[�C�@S-�uuH@S�J !}p@T���1^�@U�,�}	@VU]1Hd�@W&Y����@W����@XЛU�E@Y�ѐ:�@Z���&Y�@[dD	R�g@\Er���.@])<芫�@^��c��@^���yC@_�
�m�@`i�c@`�J����@aZ��p`@aՉI!��@bQ�"¥O@bή�69y        ?�l�p��x?��Z)?���ac�D?ަ|@���?�Wj<��?�x�s+��?��/�A)?�T�JVrf@�0l�@�aV�@	�"�]@E�E@p�VV4@�n�ai@��-P��@i����@S��p@]�'(@!B�Je�J@"��nM!@$����&@&V%x���@("�0��B@)���@+�T�4@-�W�H�@/�`�A�@0���Mе@1��wj��@3�s�n@4'��8��@5D��AK�@6g�;�D�@7�8X��@8���>1@9��k@;)V�3�Z@<f�"��@=�L�A@>��@!h�@@�p�@@�X�P��@Arq����@B�V�xb@B��'S	@C��fG�@D6f�#@D�$)~�@E� ���@FaU���@G�ka�b@G�N��Ds@H��_��@Ic�U��1@J)�W�e3@J���K%t@K�0�/�@L�:���\@MV}��e!@N&�r_��@N���W�@O�l|cY@PQ�7��"        ?�vʲ�)?�@*�8�.?�D*�US?�2b��t?�K�p-?���&?��,o�@ �H�]�@麖]�@	q`�N@ZR��@��;^[�@��%Є�@�Zu��@��2�N@V(��@ �s����@"�#oV�@$k/�\)a@&\ ��@(^]r� �@*q��4�@,�;���@.���fj@0�7u1`�@1����j@2�m���@4�t��@5W��[@6�G�}>�@7���s>@9?����l@:�3�7��@;�k�ȟ@=c���@>�{Qr�@@"�j���@@��,y��@A��s�@BcT�|�7@C)�ޙ��@C�W�]�@D���aC�@E���z�@F_>\���@G3�e� �@H ��4@H�	L�@I���iTp@J�$c�X @K�8N��@Lg��hn[@MOL��@N9A>���@O%��m�@P
w���@P�PT' �@P�n���@Qx�p�w@Q�pMȾ�@RsNM3��@R�f��@Sr�>�&        ?���ux�?Ė��J�?ղ���?�F@/2�?�W3SU��?���(?�Ɵ��,R@8���L@} /��@
,#p��@A����|@]�g�.�@J]���@e����@�@�S@!<y�@�@!_��,�@#D��@%<����]@'H�9-K@)h�nЉm@+�m����@-��X��@0L�mE�@1Q*����@2��uJ@3�L��8�@5$I�J"@6{����@7�s�%7@9CaM�ڻ@:�`,�*@<+R�Er�@=��k��@?2�/�@@`�=��@A,<��a�@A�M�'y@B��SuZ@C�kTgm@D~aPHE�@E[�Bhz�@F<�B�ʑ@G!m�!�/@H	c��u@H�����@I㌞��@Jձ (��@K�+�E�T@L����u�@M�
��+�@N�a,%6@O��G���@Pc�ŕf@P�T���@Qn_��5@Q��o숅@R!�z�@S	�FMH�@S��^�@T#π�])@T�V�H@UC�@⮒        ?�5]���?�Wޫ
>�?�Y�䡩?�n��<�?����,�@�uD��C@	[y'O�@ 'O�@����c@{T�Wo@8Z:_�@!'o��B@#��FZ�@&��0
�@)�}��@,�t���@0#��z��@1߲��8@3�Ȳ�o@5��f�Y@7y
d~E@9wH�@_k@;� �F�@=���x@?͹���@A�Do@B(0pd�@CS\=���@D�[�k�@E���F@F�U/G'@HC�~�N@I�9�db@J��r� @L:?[��l@M��%�-�@N������@P4����@P�VF�@Q�l�j�4@ReY��܋@S&�_�)@S��Y��@T�����o@Ux��n@VDD���U@Wv�-�@W�>
-��@X���I3�@Y�r-��@Zd����@[?�{�p@\�R�c@\��޶�@]ްa���@^�*k�l@_� �b�@`I�/l@`�Vo)g?@a6;k:�f@a�C����@b'l@ͺ7@b����<R        ?�3��[�?�����Z?ѰZ�C�8?�G���`?��b�?�?).�Z�?��O���?�����@\�u�R?@�N�d�@	#v�v@vM�$z@'6E�:@t �]�B@ �`��@�Ka��@p�ntY@R��vZ*@ �bu�@"25�n-�@#�Ne�[7@%lH�!o�@'Ǵ���@(�x��^�@*�OTe@,hK�q��@.A�����@0�凋w@1	��BA�@2f(:�@3�fG3
@4
��[�h@5�[��[@6"�>�q�@75��i�@8K��<J@9f�_�L�@:�����@;���<e@<�[D-a@=���mx@?(��9;@@-\"j�A@@�Jj�u@Ae����@B��n@B��{�#�@CE��7��@C铏�%@D� E�L@E6T5�@E�ҷ��@F�+ 
�@G5���@G�wm�=@H��@��Y@IB&����@I�+	1G�@J��ږ��@K\�uX��@L�g�pS@L�~�7R�@M��!���        ?���>��j?Ï�
�?Ԉ:*..?��||�?���F�?�о���?�!�+�V�@ !�ڡ�@y�ov1@h���@���)@��R�9@�I�Y*\@�A}�LE@����@�f�\�@��IiGe@!����ׁ@#_��&��@%1�Ez/@'����y@)b��8�@*����R�@-uvw�@/&yZ�h�@0�0D�A@1��>�|@2����v@4
@&��7@57����@6k��t�@7�n#:x@8�%��(t@:*��S�@;v�Cq�@<�al�E@>�%�("@?z��a2@@m�C�f@A!d��y�@AיqIt�@B�pM�@CK��@D	�B}̅@D�s.�)�@E��3�)=@FS�$9�@G#X�Kf@G���@H��}l�@I��Q+�h@JSk�㑍@K'j8<f�@K��6Tw@L�Sd� �@M�.7K��@N�C�/S�@Om�5�ln@P'��KR�@P�Sp�@Q5��`@Q�%U�n@Q� jBҦ        ?�`����?å��~M?Գ����?�ᩨ��?� ��N�?�C�B{�?�u��W=@ [°,�@a���@�~���@��u�@X��̿^@����@�6q��@��`'@="w��E@ L)"4S�@"F��(�@#�p&���@%�5�|�@'�.��B�@)�����@+�1�mR@-�}ؘ��@0��a�@1:���m@2d���+�@3�����@4ώ�	�@6��9c!@7V����@8��Eؖ@9���W�@;U�$a�@<�'x�-@>!���E@?�]w���@@��Oɴ@AA[װ�@BZ��)@B�0q�r�@C�O��R@DWh��O�@E$pv�f�@E�^|�P�@F�*s��@G���&-B@Hu>�A��@IPx��~@J.q�_��@K%o)C@K򊬅�@L؜�ա@M�R��@N��4�b@O��}_�@PE���~@P��e��@Q9����@Q��^�H�@R3(Z5�@R���E�r@S1g�m�        ?��߂d�?��d�}��?㻤�8�?���[�?���F�l	@ �xkJ�@9�L{�@��t�@_e��@�'��?'@�Cl��@ o��z|@# W��h@%��e}^@(���+�@+��%R��@.�w�>d�@0��-EO�@2�m!�L@4N��E�@6[���@7���wo@9�]3���@;�N�O��@=�m��jw@?�n�<�	@@�1�]�@A�2��@C�����@D���r@E:�
�S�@F^L��z@G�ڃ���@H�_�lx�@I��Z�`�@K�ZQ�4@LY���@M�W.9	@N����<�@P�{��@P���-m�@Qc�a�~5@R����P@R����m.@Sj� ǧ@T�3� �@T��`�Ô@U���/@V:�F��_@V�t��&,@W�z@Xj��~�@Y(�I���@Y���l8@Z���S��@[nc�P@\3����@\�{��z@]���g�@^��Qi�@_X�~���@`����@`z[��$�        ?���A�J ?��Q�' �?�x��'p?��܊iM�?�΅��ov?����?��q�g�>?���|�\@Q�,*�@[�*�{@	5hu*�@�qZ��@-@8��3@�i���@U�o،@-Q�h�@
�����@#� �@!!� R@"��m;%�@$}O�I��@&A��@(�ףI�@)�@�P~�@+�㭵�O@-�k�_@/�Yt@1�x|�@2�[�؜@3/�� �@4O��C4@5u�����@6�o`��!@7��y�@9�8Mc+@:L�`[�7@;�0�ǒ>@<ۿ嗰J@>,���y@?�9��}�@@o�Yq@A�$Ԩ]@A�.�T�P@B�gK�U�@CBV�L&]@C�����U@D�9����@E}�@F@�u��@G��_�F@G�O��~@H�x�"W@Ih#�@J8G4Ģ@K
�pD�@K���]F@L�A[{.�@M�<�xM@Nm��5@OK�ʠdV@P$�C(Y@P�����@P�X�19)        ?������?�բ~b7?��XP�E�?��kj,�?�����?� nq�g?��#e��@ m�Y���@z��,�@�-��t�@�<�N�:@p,�zg@0|�L�S@�(�S�@-��2�@hD�[�@ dF�C6@"&��)@#�D��!@%�:W�@'��?�=�@)�HΑ"�@+�ӑ���@./7�@0*�����@1Mzl���@2w�g�D@3����%@4�Rk��@6"�V��@7hɿ>
�@8�8?��h@:
L
?w@;d�u�՞@<��71��@>-bg7+@?�
v�	@@�k�,�T@ADX��@B@u�s}@B�zOAC@C���~+@DUw�b�@E �{�s�@E� ��@F�l$�j@G��j��@Hj�'�A@IB��E��@J�����@J��<�ԧ@K�FJ8ω@L�r��o�@M� /g��@N�Iԗ��@Ox����@P2�D�?�@P��Q���@Q#��a@@Q���/s�@R��z��@R�B�A��@S�)��g        ?���9q?�Ou�=?�lO���?�^PF{x�?����f��?��|-�V`?�sjU���@3%d��@9챮��@	��R�~�@��R�i@"�lf�@�&�f@�Fn{@Q7��M�@�C��P�@!$�^F�@#+��@$�f]�@&�l���~@)�V�@+5MH�k@-p�X���@/����@1;�!b@2F1evg�@3����%#@4�q�U�|@6 }Ԕb@7y����@8��PH�@:C��iO@;���
]%@=-AVl��@>�g1b\�@@�M�@@���s�@A�Y˪�@B|<�.9@CN�J���@D$��!E@D�N���@E�RAU/�@F���j�@G���-��@H�����%@Iq>���_@J_��#@KP9�U�@LD7�C |@M;�s��^@N6 ����@O3�4�!@P�� �@P���D=@QjH?�@Q��/;	 @R)��&�F@R��K/p0@S:�ǯx�@S���5�@TP�yѦ�@T�L���        ?�CUe� �?ҍ��B(�?�M���v?�z?��~?��Zm�׼@���a@ 8R��r@K�@<�@cA�kM@��@���@;�OR�@ ��f�R�@#?A��E@&��8�v@)	:$�@,)�D8Z@/q.R�J@1n���M@37P����@5��@6�U!@8��J)�@;��!�@=#�t�o@?QX?`W�@@�4�M8I@A�u�� @CN�Yd�@DP��Y�@E�Q�ī"@F�C�3"'@H^�z�b@In����@Jǭ�R@L'��$�@M�{T��	@N���A��@P8	ٍ
�@P�[<W�i@Q����pu@Ry�+���@S@���j@T
S�Q�@Tד����@U�����@Vzܨ�+@WP�|��N@X*� �@Y�4s @Y� ��E@Z��3O�@[�ex��`@\��{���@]}��B@^j� �@_Y��TdO@`&{r� @`��{��@ac� D�@a��	l6i@b�m�@b��RKc�@c�;]�        ?�#JdR�Y?��"\15�?�zh��t}?ߦT�:�?�����?�J�R?��\���?�<B����@9-�ߌ@,0�\w@
s1��5Z@
wu���@�E���>@�ǵW+@H?���@$XbV@!&)fL�@ Ŧ9�@!�A����@#h��}�%@%#G+�CU@&�ג�/@(�c�(U+@*�� @,��T,��@.�0c}ò@0O��zS@1Z�#�\@2j�?��@3��Z�K@4�HwQ��@5�bjso�@6��TW�@8��5`@9G5�)J)@:~�
r�Q@;�?A�`L@<���iz�@>Cf�dE�@?�ӎ��@@o�
�N�@A���@A��S�*+@Bu���M@C'Sre�@C����wT@D���'@@EH�H�Ƒ@F�y'�@F�O.q+p@G}��(J�@H>#�"�@I ��mt�@I���'�@J�����@KS�5��@LK~d��@L�Z�@M��#*�@N����W�@OZw�d�&@PV�:@P��Y�P        ?��X�w	�?ēڛ��k?՜�`�?�}Z�@A�?�#�-R*0?���8�[S?����)�@��No@>�ۉ��@	ؼ�s[�@�[e�N3@R@�Ot@���@����U @,.Ҁ�@���g�z@!��*q�@"�B�L��@$���*�@&�l�Y=@(�5����@*�r=@-D�zY@/T`T�e@0҉"?@2|�vb@3;|J`@4{�w@5��?�ύ@7}�0G�@8j�E�ѣ@9��i��@;.�p��2@<�� Ɍ5@>��@?�d��$�@@����}@AJ/P��@B���v<@B�p/�cn@C�nEGG�@D{�(T�v@EO�?�DF@F'b`M1�@G��5�-@G߁���@H� ���@I��~�#�@J�[4Ԩ@Ks��pN^@L`i}���@MO�P��@NBt夞@O7@0P$x@P�T!�X@P���5�@Q�\�50@Q��'�z@R�cn�@R��yb��@S�z�@S�יn5@T)����R        ?�v
�qh�?�}��W?Ք+�Y��?�|�@W�?�'漹t�?�ݥY�@�?��Lc݄G@W��4�@K�Uhs�@	�D�`��@�}��R�@(����X@�ݜ�m@A�ZJ@L�� /@�/��]@!I�U%@"��/I`�@$��±-@&�$ aHl@(�CG?�@+:�.�@-J�N�.`@/�A4�Y}@0􊄢�i@2(��el@3e�<���@4�U֏��@5�7�.@7L��@8���轭@:8��c@;y]Qٸ@<�<��@>hI�]�@?��p�9�@@�bD��p@A����=�@BOV�a @C��U�~@C�����@D�a=]�@E�W}{%$@F��d��@G`Q�G�@HDBc��W@I+u}䡤@J��'�m@K~�Z2r@K�Cx�1�@L�(l��@M�&tg�@N�6�/�@O�R�j�@@Pk9j��@P�Ǽ!@QoЁ##S@Q�O���@RzA�8t@S�$���@S�k���@T��b@T�4IC�a        ?��~W?ӟ��X�?�W��?���هc?��%�ƙ@��ޓp�@	g�@��}@S��!@Z�Ʃ��@�AO���@�k6��@!Tmd
*@$�!	��@&��ǉ@)��u��K@-,�R�5@0@�?�_�@1�B�1Iw@3�����@5���Y�@7����"�@9�2� ~@;����[@=����qw@?��l[�@A	��\�m@B+��*+@CTB���@D�d=��@E��ѨQ�@F��k��@H6lf.�@I~5z���@J�ט9��@L5��,d@Mx5� 9�@N־h�b�@P\K��@P�6IY}@Q�S*��B@RC:.�C�@R���6 @S��^+�@T�9�'�@UD7{v�@V
��I!I@Vӂ[@W���W�2@XlU�	@Y<9��9@Zd윶@Z��"ػ�@[�t>S�o@\�I��<D@]mI����@^Jj�e�@_)��Ȩ�@`{:��@`w)Zș/@`�ڏ��.@a]�<i�@a�<X�L/@bG�1)*�        ?���5��?�Yg!�
�?�@V�7�M?�D���(?�ы�@�?��?�#��?���П�%?��7���@⡜�@��蝅I@
B�ܼ4_@�>�Y�@�s�[@y�`��;@8V�#3�@L��@�Ϙt�@ "D�Ӽ�@!�e"���@#xK���n@%:�- �@'ρ�@(��J\@*��4j��@,��/�g@.���e@0{����&@1��h3�@2����J�@3že�@4��tǰ@6�2@7H A��@8��TP�@9���s@; Y��@<IV]~o�@=���g@>�/��:@@"�g�93@@�xA�;}@A��q���@B9r ��@B����r@C��K'�b@Dg0y�s@E%�]���@E�;TnV@F��3�9�@Gp�f���@H9d(�Gv@I��c@I��9Ҕ@J�U",� @KqȬ��@LEky��@M5���@M�!+�@N�&h�*Z@O�?�B�@PC�ψX�@P��,��@Q$�!ě�        ?��?[r3
?����ʘ?�F�]y�?��?�_��?�ĩ<�f|?�K#D��?�$�I��@s����@� ���@
~t5��@�*e�.@����=�@�� �b@���h@�]d7��@rڹ�@!���$�N@#s0�ϛ�@%o%�-@'~�^��e@)�����@+�h�v@. �����@0=�H�2@1th��@2��A��@3�z��P@5K�^�W�@6�bu#@8'���@9m�m�@:ޜ�+&�@<W��w@=� �)K@?^u��@@v�PB�"@AA����.@B6ۚR�@B�M�!�X@C��~�5@D��`_�@Em1�[q�@FL�h�� @G/�H.0@H�:��@H�y^���@I�ܕ�C@J������@KΔ���6@L�ry��@M�V@W�@N�9��+@O��_��@P\�@���@P�Mfq@Qc�*�J@Q�V�l�@Rn�0n�x@R�	��@S�ys�y�@THZ##@T�q�Hy@U$�gTfC        ?��6oz?İ���.?�����~?⫢<rW�?�q�#Y�s?�yg��?�ޱf`�T@H�v��@� ը^�@
C'�g�@]�M��@m��]M@]3��@{M�#�@��o� �@>v&��=@!p���#w@#V�v� �@%Qϗ鯅@'`�_�@)�[mJQ@+�;�$H@.��}@0.�� �@1ey���@2�9/7@3��Q9C@5>���@6��&I�8@7��@Rl|@9e!�m�i@:ל@���@<R�c�=@=�v�Q��@?^�	:@@x6ܡ�@AD�=�Q/@BU@��@B�p�E6@C�0h�A@D��3�_�@E{l����@F]�{�z�@GC��;J�@H,�ZPŹ@I�8sT{@J	��j@J�	I���@K�ɩ95@L�V���@M�'dr?@N���v 2@O�L��m!@Pzj�ˋ�@P�9׵.�@Q����~{@Rk(RK@R��ĉ-4@S!�����@S��:�]@T;�*�2@T��=DU�@U[����        ?��I�߲�?ӧ:V���?�I��k?����+�?��Xn@�����@	�����d@ii|��@z���'�@���S3o@����pK@!��xH�@$I~.@ʰ@'=����k@*[�r+@-��	?�9@0�mX���@2R���L|@4/>�^�j@6�=��f@87�"�p@:/����@<Q�]C�G@>�6�C� @@cR<7��@A�ZJ�/(@B�8�{@C�G�J)@E4�~�@F{�=Ir"@G�С�)@I�9��@Jzⶐy@KݹlW3x@MGM�a#�@N��v���@P(k⦠@P��0���@Q��V��b@R\����@S$��U�s@S�@h��@T��inJ@U��Y��S@Vb�<�ck@W9�3��)@X2ء�@X�z�@YοR���@Z���H�@[�6$�.g@\|s5cb�@]fN��b*@^R��`H�@_A�h61@`�Ѝ@`�����@a��jr�@a�=ۤ�@b۰�8@b��eJ@c�P��@c������        ?���n�z7?�u*i��?�Nc�
�3?ݠ�ێ�?择�+�?��,ݙr�?�={�K�7?�F(��@ ���5Z@�:�H�@�aF��@̓׀ 2@��J��"@'c�6@�u�e`@s��5@��n^'@�Ժwr@ Dj["��@!Ś�{�(@#R��
"j@$�3�P��@&�٦���@(=I/��6@)�6�Vc�@+�\��Z@-�{�jT@/]V>�-/@0�݅�!@1��ic[@2�30�E@3�'���@4���7b@5�.u�X@6��k�<@7�0�p�@8�c� P:@9ؤ`��@:�����C@<�@=6��@>\��M@?���H`@@[��:@@�6�w@A����y@B+z���@B���QIM@Ci���n@D��ȋ}@D�����T@ES����@E���޷�@F��:ZT@GLf�lN�@G��fas@H�R"��q@IR���W@J:DK<@J�d�/�p@Kf3	\@L7���@LϜ!l��        ?�!��?��
d�(?��r~��?���0R^?�BՑ�D?�99y˅*?����ߪ@ ���Z�@���`1@	�K��@�AC @�E/�@N-m�@=�>�
3@V.���@���ɲ2@ ~���>@"E0�}@$�l���@&�Ĕ�@(�T�a|@*S�^�@,-��@.Z���@0Kx�\�@1q���,�@2�q\cd@3Է���@5Z];b.@6U>���@7�H��@8�[�0ɯ@:Ka����@;�?f��@=��V[�@>$��@?��͜�@@��tv�@Aw^Δ�@B:����@Cd�t�@C�6��#@D�BTk*@Eh"rp�@F:��pF�@Gʉ��@G��я@H�@�6�@I��wE�z@J�����@Ki2
���@LP
-�y@M9�Z���@N%��b��@O��:�@P!�ɹ�@P}1�z@P���\@Qu&��Qg@Q�#��@RrţA�@R�s���@Ss���b        ?���
?�\��c��?�ec����?�x��S?꛳�
q?��D�cƂ?��Oſ
@ !q"�m@�#l�,@w5���[@0N,[�y@!���)@�@��@��y.��@�!*Ҕ@�7f�)@ �u�@!���~�u@#��ѮM�@%�n}�@'wCBl�*@)w�����@+��܅�+@-��� u[@/��'�<@1���2@23�����@3b����@4�T���@5�< ��L@7"�e@8c��Z�@9�����@;栣4�@<l���@=�q�2w@?>w�	-@@Xra�I@AԶr96@A�[��lk@B� &PS�@C\�݋�@D%�ZS�@D�YM=��@E�0�k�@F�''l@Gf�֭�@H>��P@I�cb@I��(��@J��[j�@K��C�c@L���B�*@M������@Nt4NI�@Oblf@@P)���@�@P�z� ��@Q��%%
@Q�+=�@R˼�V�@R�����@S��U        ?��X���?�P���?�B�|U?�|���?�:�"�@�Y䂒\@��T��5@\]U�R�@�у�@�6��L@\�K��s@ 3,�-@"�y��8n@%*Y{��@'��@*�7�`J�@-�L8R��@0}	}$�O@20z�Ƅ@3��$�m@5�-�%��@7J��J�@9V���@:����T=@<��T�@>��� �~@@o���!�@Au�r�@B�iSb��@C��-B�@D��|��U@E¾�	Z @F�w���Q@H8.�@I0HA���@J^5�:��@K���.~|@Lǽ����@N7Ѝ]�@OC��\@PC�۝0@P��o��@Q�>�H�@R6����@R�$g;:@S����@T<����@T�k�
�S@U������@VR�V��@W�қ�:@W���1��@Xz$,�ȫ@Y5sB���@Y�}&�۲@Z�=��O�@[q��@��@\3�V�@\��tɲ�@]�
����@^��^�@_L�W��@`�c?�R        ?�Sƣ�4f?��-0'�/?Ҧ�����?��C$覈?�T�r���?�+�VI?��`���?�����@lzr���@m~��d�@
����@@n���J@3�a���@ֵ9�8,@���,@��r"@� ����@ b�R��@"	R�TYl@#�)ׅǕ@%�6 #7?@'[9�h�@)>v��́@+0��̢@-/s� �c@/<�x��@0�{�1J@1�I�)��@2ّ���$@3�9�A|=@5!*�qy�@6NN'��@7�����@8�ܤ��@9�$Q��@;?U�5)@<�^���1@=�-�D�	@?1���X@@F�mt�y@@��9��@A�O�[�@Ba���>H@C�f�n%@C�&���@D�\�@EU)H���@F��5@F�b��º@G����;�@Hq���?�@I>���!@J���FN@Jస�W�@K�%�%��@L��'5�@Me
53m�@N@m�x��@O<�i�@O��8c(h@Pp���@P�)	Z@QU^�0'�        ?�p=��?ĵ݀�?������?��8Z?�Zb��a�?��N��m?��ܤ��@5�0Z�@wQ���@
"��ң@4�}(�@TA�1�@=����@T܃P��@�{ c`@*,T�@!O�;�u�@#0��:�@%%n��w@',�0E�@)G�5�@+uFG�z@-��]�z�@0.U�/{@14�H�< @2n�{���@3�N��^@4�,$ķ�@6O6���@7�N���@9T�"�@:x*��o0@;��>�?@=d��Т@>�]�4�@@7�G��@@������@A�N�S��@B�l,��@Cl���@DB���@EC�IZ�@E������@Fغ��
�@G������@H��)��|@I�Fp؈@Jw�տ�@Kg	#6��@LYk^��@MN�
��@NGQN�V@OB&�ٌ@P 3ʍ�@P�|�9,�@Q"LWA$�@Q��ӗ@R*��@R�KԒ�@S7XWb@S��9r�@TJ��Ղ@T�[�Q        ?�Gm�F�?��]��?�	�[$H�?�����@�?�ԾE.?�H�UJ��?�"7�s�@qYE�B@��U%|@
z�a�s$@�D�G�@�M�#��@��#)�@��\d��@�2�Kj@bHC>�$@!�m^G��@#f{�t�@%^`5�ў@'i��ط�@)�Bҙ��@+��z��@-�C�o+�@0'���_�@1Z
p �@2��J�r8@3��'$��@5#_6{@6vc�@7��A/-9@93?�X �@:�!��j�@<]2��m@=�ԩ��@?my��@@F�yȄ�@AK�PX@A�y|�@B�B�,�@Cu�O�@DI큯�@E!9����@E����@F�NE+�@G�l��<@H�ҍn�@I��1���@Jn�#>W@K[Qz��u@LK<)��@M=�<�9M@N39Ҏ��@O+���RD@PV�|�@P�F1C8�@Q�����@Q�4��j�@R+l�	�@R�q�"�@S!����@S��KG�@T0��S�@T�lūO�        ?��F	�X?��|���?���S���?�ݮ[St?�7�3T�@6󛄛@	����Bi@��^:}@��c��@�T��g@�a���	@!�n5.�9@$a�sy�@'U��T�~@*r��S@-�Ӳ���@0����@2Y޴���@442;�Et@6 ry]�@8�&u�@:*�)q2@<Hn�Ÿ1@>v9�5�@@YЬ��@A�-S�T@B��K��@C�Q��Z�@E��WR�@Fc�;^�@G�M�&˂@I c</@JX�!��+@K��1�m@M��	n�@N����b@O��cI�@P��B�@Q{�E"�@R>���@S8� ��@S΋m$*&@T��Dc@%@Uj:z��Q@V<���R�@W�����@W�ډ�&@X�Ը,%@Y��X	~@Z�@Yb!K@[f�NpX�@\L���	�@]5�����@^!���@_*��,@_��+g�@`y�?�@`���r�@ap�W�f�@a��x&�@bl��_-S@b쇉��@cm�sxV[        ?�#�Us��?�vG�v�?�nsP]��?���q��?�a:��?��l�k?� ��}�?���j��@I$X�i@��E��@��"5�@�i m�@%zޕ�@�4�@�@�3�l�@:�k�@Ja\�d@!Zr���@#!:��E@$�U� @&�����@(��<_��@*�� ��@-�w�$@/8̖T3@0�L]��@1�Ҁ<q@3�erD@4F��N�@5��`��H@6��1+��@8�V+=@9jsC��@:�t4�G6@<'�B�@=�}��'@? UEc�:@@;xa��~@@���9@A� ŗ�@B�I��Z�@CI�~X �@DmS#�@D�H2.�s@E�H�ԭ�@F�f��@Gc��κ�@H>� /J@I�.ޓ@I�Pk'cU@J�}wT��@Kɔ��T@L�����K@M�d1
�@N��UB@O��߈�@P;�\8@P��7��<@Q55U��@Q��^��@R3��@R�8zu��@S7׌J��        ?��u�P�?�Sq�?�g���?�-�W3 �?�3d��T?�����?���`.�@���z�u@#̭/�@
�q${�@F+C-@�P���@���t@	��87�@eN��w-@���g
@!��6���@#����@%�s���<@'�Ө�c�@* �۬��@,=`���@.��F��@0w%�7$�@1��"}�T@2�^cZ�@4>{��3+@5����@6� �4�j@8R%Il^@9�]'�9�@;2���K@<���O-C@>2TJC�@?���) h@@�`��Z@Au��贎@BF�jt@C���@C�K��[�@D���@E�:�m��@F��N:;@Gv��U�@H`r���A@IM:Ż"�@J=LV	��@K0��2So@L'%�,
�@M �z[�c@N��nnQ@O��d@P`�
=�@P�t��3;@Qc���@Q�5
ϬX@R%��e�@R�	@S9��t\=@S��e7H�@TSvk?��@T�q�H@Us�        ?������!?�g�W{�P?։��-?�Mj�?�c��;V?��p�;|?���[��=@ѐeL �@7jLs�@��`� @!OY�s�@�/\�h�@�3���1@���@v��@��W��@!�#���@#�`�z|@%�uwM6�@'��J'@)�"��h�@,4�3[��@.��qs@0m��L@1��cbt<@2�����@4+:SP��@5z�U��@6�.k�t@81e����@9�;��@�@;�]%��@<|2oJ�@=�b�@?}�@@���%��@ALޚa8�@B&���@B����,z@C��	$N�@D�̚��}@Ek �~a@FG��|��@G'1���@H	���Dd@H��J�@I�$&]~@JóꢦI@K�'�i�@L�sS�(�@M��U���@N�r�n�@O�f�B@PB5�	�@P��_���@QB��0�e@QĤ�/A�@RH
k%l@R̳���e@SR��!��@S���V`G@Tb%��#/@T�[�ߚ        ?��v��?Ԓ׵���?�VW۝?򏭁9%E?�K}�fNI@����@
�,�ۯ
@:>��f�@��ջ�@7�ݔ�@S����@"j[P��@%[_��-@({F�:�o@+șT��@/B��@1s#A�@3Z%�5td@5U�g��@7d�Y�S@9��pA��@;���e��@>F�cf3@@0��<4�@Ag\m��@B��sb{�@C�=�}l@E@3�Ze]@F���|V@G���aDR@Ie���@J���? �@LR3�#@M�g���A@O^f��@Px	�!
�@QD����>@R�� @R��N 9@S�Ë��u@T�&��v@Uz��� �@V]b�9@WCO
|/@X,��ai@Y�TU�@Z	��4�j@Z�H���@[�'ݾtP@\�L��@]�{�"@^�AKQbd@_��~��@`{o�I]@a lЉ:�@a���t�@b�G��@b��K���@c#��F�@c���@d>p��^@d�i�}��@e^<�>��        ?���d%.?�Gh�Z�?�-�H.�?�%���?��$�?���z~�?�l`���?��!�<�d@���.I@�/'�;�@
.G�#d@¾�-�@�@��d@kU���y@(Ly��@�˿e�@-?��@ ]���@!���LQd@#mj����@%/N���@' Ib�v@(��i	�@*�:���@,ʠ/e�l@.��O��g@0v~�Q�q@1�?�3z�@2���S#@3ބ��@4��Ec�@6���/�@7H�JȄ�@8��%T��@9�����@;l|��@<QRX��@=�n#��X@>�_LF�@@+
T�^@@�>p��\@A�C�=@BG��S@C �Zi��@C�����@D{���E�@E=e�Th@F�2��@F�_�V��@G��c	t�@H]����@I+�bw�D@I�����@J��@y!�@K������@L}��[wo@MW�'�(�@N4xHT�@O_/-�R@O�!q��@Pk���@P޶�ܕ�@QR��"F        ?��-�t2N?�����:�?��/�b��?����X?��*e?�a��\�?�
 t�F@ ak�)��@jW�5~@�߾�H@���E��@b&k1M@�}[T-@I���@�K��@M��^�F@ T�"�8@"&Aݐ@#����Y@%�E��O�@'�&N��@)�4�N��@+��h+@-�p^c�@0��K@16nG�,�@2^$t��C@3���}'@4lj��@5��h�m�@7A�%�<@8�w ��@9�gk! @;1�Sa�@<���@=�Y��@?Y!�*�[@@c��S�@A�63;�@A���i�_@B���+�%@C]Y�γ@D"W��@D�@D�@E�̔@F��EP��@GQ�؃�a@H#�"��@H����~�@I���A4�@J�iᔳ�@K�^�sw�@Lc�9���@MDB�F=@N'$(#t�@OG]Ţ@O���
@Pn����@P�x/�[�@Q[g�,��@Q�e��u/@RLo�^q	@RƂ��H        ?����0�?�{=���?׵�5=,B?�U�PY?�]P�&?�芫n�?�X���m@� �T�]@��82TZ@�
=�5@4o�;'c@=�i��@~f�>�3@�U�^��@�] ��@!=�j�72@#D�fv��@%dvx��@'������@)�xRi�@,PN�K@.̈~D�@0�v�$rF@2�w�щ@3bih@4�׈ɵ�@6?��e<@7���B�@9F>H���@:؟袽@<t�i��@>�1�A@?ʹ���8@@���e@A�t����@B���n��@Ct]U�@Dc²�׮@EW�ɓ�@FP8QP�@GM2@HN���9�@ITi�F�@J^�f���@Km '��@L����@M���"�,@N��V�=]@O����@Pz�mЧ@Q�s�ɦ@Q��NX�@R;Zu���@R� �=�@Sp��Q�@T�H��@T�d�O�@UP���@U��FBI@V�\��?�@W@�,��8@W�ZH@X���E'        ?��Ƽ:&�?Ӳ�oٟ?�E�Jͫ?���!��?��X�@S8��@	��䕭�@xemZ��@��p	�8@�V1q@�hyy��@!�ǰk�U@$au��N2@'ZA��!@*}=�T@-�r���G@0�����@2l����@4L0[��@6>���_�@8B�!dO@:X��Rf%@<uv@�1@>��� @@��4��@A���1H@BߕB�Z@D[&�{w@E^�/>�@F�ʟ��@G�;�_@IV43�S@J�	�\�@L7[�19@M�v|�.K@O���|�@P@�e�Z@Q�����@Q�H.���@R����v�@S]ŭ��@T,K�x
�@T�ҝ��V@Uԋx�a�@V�l��5@W�m�'�@Xh��@[�@YJ�44@Z/�.~��@[	C��R@\)a=��@\�4SsI�@]� *VL�@^��7�@_�t1#�@`b�Ꮑ@`��m�@a`U)h;�@a���@bcc5�	@b�z�h^p@ck"��c�@c��>�        ?���b�-?�
���?���I��j?޹j�\��?�i˱�j�?����V�?�#��Q?�~�2���@�K���|@�5<�ib@	��.9tz@o�>�:P@�'��!1@8��3@�]��(H@�͓k@��6��@�ϋ���@!������@#H}C�@%�$'@@&�c���@(���.Z?@*�둬��@,�Q�QW�@.�ʐ�?@0`�}-@1r���<�@2����{@3�w0�u�@4��TP!@5���-77@71�+��@8j�J�2o@9���s@:�5�͈�@<;�_d��@=��6[�@>�L�S��@@!a��b�@@����k�@A�v1��@B>�|�ّ@B��E�F�@C��N��o@DuG�|�@E7����@E�� ��@F�>E�
�@G��͍0]@H[v��l@I*����@I�`-�@JѠ �;e@K������@L�H�t�@M^InV\@N<�ҫ��@O�!�y�@P ]��@Ps%���@P�@c)@Q\9n�d        ?�,.��2?��}L1��?��h���?������?�"S!���?�!�WY��?����4u@ m��z>@y"�JL@�V�9@�$��@mˑ�&�@-���@4��j�@'��N�;@`7���@ _o� o@" j)�� @#�wxN1<@%����G�@'��1)b�@)�Rrm�P@+�Ď��7@.�j�1L@0 ��֏@1B8���@2k05*$�@3�Z�s��@4ҙ5.�@6�S�ͷ@7Uۛ2�T@8��o�w@9��1��@;L��3_@<�&�h'@>��o&@?}�a_�@@w��,��@A3�_p��@A�|w�@B����?}@Cy]��5@DAY97c@E�IX�@E��n'IQ@F��d�$@G|-��@HQ�߶i�@I)��hs�@J���@J⪢˿�@K���.z@L�ﶖ�!@M�v�� �@Ns����@O^#=�uP@P%�r(�@P�_chb:@QZ�#@Q��O�#?@R�:h �@R�y=��@S0s���        ?��h��?��(��>?���n��[?�����?쯽8�"�?�>��*?�-��A@j��p3@��~���@
s�=�~@�癪B@@��ݣ�@~�H�@�'$��.@����@e��I�@!���Գ@#k>5�=@%e���cU@'t~��>$@)��K`:@+˦zѴ@.nc?�(@06ķ�g@1lҦ+��@2��A��@3�ZAW�_@5C�GФ@6�/����@7�%��nm@9fN
�R�@:׉�eۊ@<P�a�S�@=��g��O@?Z~)��@@ul'�`�@AA[�|�@B���}@B�[ca�k@C�Y�x@D��J�S�@Et+Id�\@FU���I�@G;7{�@�@H$��G�@IJzU��@J __2\@J�2@���@K���t�@L��6��@M��'�M�@N��O@O�y�&�@PvP�� @P��{�
@Q�P�+��@R
���?@R���t@S =x��@S�VV��`@T;����<@T�"M�@U]χ�~        ?���]�7�?�1��(?��4�?�5�lù�?�<I��@�0��"@������@�}H��@���@O��R�7@m��@!��T�~@#;�'�@&����"M@)�ǾW-@,�v=Қ@0,t���@1�iLn �@3�D��*@5�%?hӒ@7�����a@9�?wP�@;Ƹ���^@=�S�j@@qۚRD@A<��&@@Big�R�(@C���(>�@D�<�\�B@Foֹ��@Gk%�R@H����U@J��Ie@Ky�H3@L�+���@NP<�Y�N@O�(8���@P�mR�@Qc��]@R( �Wi"@R�hK�78@S���|r�@T��h.tk@U\�sb @V1�Ε�@W	Ҡ��@W�m�R@X�o�h�@Y���	�@Z�5�&�@[p��`�C@\Z��@]H(�:s!@^8K ��I@_+G��	g@`�k���@`���p�@a
�M��@a���S�@b	��}^�@b�x@�@c���=[@c�S���        ?��5`F�?�Q6Ř?�;�enHG?�?>5(VL?���%8l?��R	���?�{S?��:?�.�@> k�/@��G���@
-p��@��o��@�� 2��@\�@�#	Ⱦ@�(�Q@��s�i@��O#�M@!��0�@#E�{y��@$���)�@&�e�ӻ]@(��bP@*�q�,.@,up����@.t���Qa@0@�  ��@1M!`˖&@2`�}�@3y�O�\@4�/��@5�G{��@6�>�J�[@8��)�@9Op�/8�@:���RH�@;��"�@=1}�@@>`���g�@?�q/�2�@@��61�;@A2�R�1@A㞿ێ@B��x�@CL��,@D�,!�@D��K�+@E}BW��@F=�w�T@F�(Ў)�@GñH�R:@H��64�@IS���1@JN��@J�*|�P@K�&W�M@L�m���@Mc�p�^@N:��s��@O|�E@O�"��f@Pe���i�@P�~�y��        ?����T?�eq�m@d?�kl�uu�?�S��?��� dY?�{)Ez�?�KҬNw@ ���f@%�@	�6
�@�q�(�@��Ӷ�Q@���Ō�@�'\��@�v=&�@<V��* @ �Ȩ�f@"���3�M@$�מlY @&�K��@(�k{���@*��ր�@,�
{���@.�����@0�N�Ý@1Мޒ�@3�h��@4@7Y�?�@5�/i7�[@6�dM4�@8�j&s�@9v�xD��@:���䊦@<;�>+�@=�Qzh|@?��K�@@Jq+4i@A	�G�,@A̙B�@B���ڃ@C[p�S3@D'a]f@D�I��e@E�#�
��@F��~�bz@Gt��@HO
"�@I,\�wB6@J|��@J�b���@K�<l��@L�b�H��@M�l�,@N��k@O�m'�o�@P<�����@P�da�&@Q3d���@Q��&�d@R/,���o@R��;�7g@S/�m6@S�$`�K�        ?��^yb#1?��c�)y5?��7.V?���oZX$?�Zs(���?�J��/�?��T�*z@ �����6@���Z��@	-�>��@�Ꭓ�@��9�ѵ@V��C@E/���@\�%��d@�9�a��@ �b'�@"Dպ��M@$�D��@&7Kg�@'�����@*3����@,"��@.M�}\ϒ@0C���X	@1hО�t@2�&Ԥ�9@3��3xR�@5�r��@6E�]-�<@7��|#@8޲� �z@:5V�@;��ٴ�x@<��|I(�@>`�{�@?ѫ\VM@@�d�] @Ac1���@B$�&�|�@B��;�@C��,�"�@D|U��E@EJG'��@F�2;�Z@F�)��DF@G�v�E��@H���@�@Iye�	�@JW�~6��@K98��0@L&Փ�@M����h@M��A�u�@N�� �	@@O�(�9�@P\�\��@P�ѐqk�@QPѐ�$@Q�JW-�@RJ}}�΋@R�!;���@SH�@��        ?�"��W��?�N�^�T?�T5�]�?�kx�	�?��Ƿ>�@�y�.U@	5`�u@��n@}y�@u�/\s�@0:+��@!!�rI�@#օ6��@&�A�p�@)��D���@,��rB@0Ę~�@1�ޫ�i%@3�S�)#&@5|�ܡ��@7iv���@9fVq���@;r�d(�@=����Ƚ@?���J@@��K��@BGV~Z@CI�����@D|#y}�"@E�x���@F�����o@H<TV̠�@I���#��@J�`�6-@L7xD��@M��д�@N�T�PG@P5v!�s@P��2�IT@Q�w��@Rj1���?@S,H�a=@S�?�u�@T�&���@U��<��b@VQ"۴8�@W!W�@��@W�Ix�K@X����`�@Y�E��;g@Z}Ay��K@[Z�C��@\;sҺ@]�$L�@^!K@^����T@_�@>�@`a3�r�@`؜���{@aQl���@a�oM�Ca@bF�Q��@b��ou        ?����j*�?��4u�=f?��2#�?�5�`Ye?��q��I?�P<5�l,?�(m���?����k@��u#@��_�t�@
��*�O�@��"J>@L��s@�hQ�>@��	R�q@�і�>)@�2A���@ liӝk�@"ٺ�@#�t��G�@%��۝@'[�qh@);p��"�@+)v�Y@-$��b�@/,Y2��6@0��3sg@1��*Lƛ@2ȡ��*�@3�ӆ/H@5��Ji@61�ҭ�@7`,9_�i@8�a�n@9��|>R@;FAj_i@<Q�S;�~@=���&=�@>�cf�Y9@@(����@@˚?�F�@Az{��@B+��|@B�e�'�D@C�\&c@DM�,&�@EY�uV@E��_M�@F����*Z@GD�c�z�@H�w�@V@H�ɧ�@I��~\��@J]i���@K(+��\'@K�+f�\@L�s~�	@M��.�sH@NgP�A�&@O;�^�@�@P��&�@PtǗm�@P�sX�        ?�����?�kηLk$?�o�<�K�?�V�t���?��C�	�?�"+���?�Q���4@ ��[55�@����(@	�����@�Li8ka@�mw���@щ7@�@�����@D%��@^C9��!@ ���"�@"�x¯�*@$�_���@&�8�M��@(��,6@*�[�ni@-~�Z@/IUqI��@0�jKSW@2�ў�@3=eU��p@4�,��q@5�6��ݍ@7!g�F`Q@8}��m�$@9�ԏ��@;M���pZ@<��[���@>=2�+@?���dx�@@�2�1�@An?�a�@B:��/�@C
��Y}@C�|K͔�@D���\u�@E�r�Y@Fn��;@GPL3���@H5Xzh��@I���N�@J	~�KU;@J���Y+@K��!�c�@L�T���B@M�~B[�@N���D@O�� }Q�@Pk ���@P�q5އ@Qq��k{�@Q�:q�;@R~Jl���@SӇ)RP@S������@TEߪg�@T�*%�sJ        ?���}�?�(	�
?�'��GY�?�v�o�?������?�l��2�?���6��@ ��7�@�_�@	>�H%�u@3���@�k��@m�XW�@]�_1�@uctF@��hp��@ ����@"Qo���e@$'�H��G@&v��|]@(��#X�@*���s�@,)6�X�@.Qg��!�@0Df���M@1g�LU�l@2��&�j�@3�s��@4��i�$�@6;4ceݲ@7�+�{Z @8Ͳ��{@: �|rW�@;z 2J@�@<َ���@>??.V�F@?����@@�Oޤ?�@AJ�+<@B��D�g@B�*�W]@C�qD�I@DU|*1Va@ECL� @E뾵xA@F��G~��@G���t�@Ha-�v�@I8"ʮ�@Jyk���@J�i|T�d@K������@L�����@M�Ƕ0�F@NuP�t�@O],Y[3@P#���˴@P��zC��@Q-����@Q���,&@R�� w@R}���	�@R�Ov2�+        ?���٩�?����-U?��sA|�.?����H+?�8�8���@4Ө<�@	��Gc@���Cz)@��er��@�qb�[@��K�@!�mA@$J�^�@'7Q� =@*Kk9�+�@-��T=t#@0rq�	G@23���@4d���@5�p�|�@7�I
���@9ྒྷP�s@;�i�{@>��}+�@@#_eX�@AC�^��@Bi���e@C��988@D��G�
@FDD�s@GH����@H��8k�@I�c��/*@K3�΄@L��ndU@M�0.4@OU�^�@P`���@Q�}�(@QՋDEaY@R��5�ߕ@SU	���@T���z4@T�	��D@U�ފ��3@Vs1و�z@W@���U�@X$`���@X���"@Y����o_@Z���l�@[h�v��@\D{��0I@]"*>a_Y@^��U�@^�ԡ:�@_ǾB�Nf@`V�#�@`��q�"L@a?�>S�@a����n�@b,k��+=@b�-Hm�        ?��Y�eS?�����
�?ч"pvqU?��<��?���с�?�-�Hݯ�?��4u�O?�⋜��@gڽ��Z@5my>�'@	V��ڿ@�V��b@C���J�@ȴ$1��@q���]�@=���m�@+\Fڀ�@9�T�0W@!4)ԑ�h@"��@XK@$����@&U�(��@((�$c`6@*
df(�@+���R��@-���&�@0 ����u@1n�d
�@2�Xr�8@37P}�(�@4V2����@5{?�32@6�b��6p@7׆�y4�@9�`�3m@:K�T��@;�Ic��@<��1`�@>$�c� @?xׁ�@@i&�Ǯ�@A�=�9�@A��r<
@B�wSr�@C7��s{4@C��ߵ�@D�־eZ@EnnRF�@@F0�Iio8@F�`�υ[@G���J�@H��.*e@IR�n��@J!�As8�@J�R�V�@K���A�N@L�ƍ@Mu��a�@NP���@O.���@Pަ�#8@Pw���@P�b_c�        ?�D^W�q�?�!��!�?�({���?�J�ԗ�?�ao�G�?�v5'��0?���t�x@ �he�A@�$s�8@	h;�*hz@S��<��@��Ӫ5�@�v�@�@��|�t@�a�@Z��^Z@ ��-(7>@"�Rc��@$~�J��@&t�%�R�@(|��W�}@*���՞@,��Z�@.��0��@0�w���@1��_�@3
�vm@4Iw)7ƥ@5��|��@6����@83�Mл=@9����mp@:�\Sʃ@<`��ʣc@=�J5���@?L��&�R@@f����y@A*����R@A��*Yu@B�*�}��@C��M�w,@D[	�J@E/X?��@F�	R�@Fᆞ�
@G�V';�4@H�@6��@I�;��@Jk@>m�O@KUD�&�n@LBAY�y=@M2,ya�@N$���y@O��+�@P	�J=��@P�2(e��@Q2����@Q���W��@REErCd@R�P��GN@S�^ʐ@S�[$s�Q@TT4sn        ?�g��ʹ�?�T��eM?�|D�ӊ`?�G)���?�ca+�{�?��	m�(?��O� C�@���a.x@Q�LS�@0���@>8zu�R@!����@$vM|�z@a����@�f��@ 4��~?�@"��Hϳ@$�A$�@&"a!�@(G5 �m@*����@,�=�>rE@//�o���@0ҫ�u�@27�y�@3d�E�@4�&w�h@6�P��>@7�8�A,�@8�ĄOb�@:t%����@;�>���R@=��Ng�h@?*&Z��@@[��B�@A.�b}��@B�r��h@B�3���@C�x�C
@D���y�'@E�	�s�@FvGl��t@Ges�V��@HX��;g_@IOm�Ӎ�@JJ"��:�@KH���D�@LJ�pr�@MP�v>	@NZ9���#@Ogf�j�{@P< ���@P�A�$��@QR1�Ա @Q�� 0�f@RoMn��Y@S p+���@S�F�p��@T'̳k�@T����}@UU�]	p�@U�W澎Z@V�v��5B        ?�� �σ?� e�^?��I��?�(���G?�)��
"@{�v$(@��E�O�@�{oB�@�FM���@>�;��|@�~�6��@!����@#�h����@&���@)��SiG@,�y+ᙂ@0��*�@1��z�T�@3� DE��@5�ƞ��@7�m'67@9��d�*@;���u�@=��>��@@�+��@A%PU6U@BPJ��z�@C��K�4@D����λ@E��W�@GF �f"�@H�J���@I����T@KH���W@L�\ʘ�@N�$Z��@O���MM@P�dT7�@Q>��@��@R �wT@R�I��.@S���
s@TZ\�tÐ@U)��%@U���(&@V�c�I@W��uV@X��H��~@Y_C.qOt@Z?�-�D@[#]p:�@\	Y �I�@\�p�C��@]�]ޣ�q@^�uF&@_���3�@`Yz!��]@`�A-�@aQ��(�@a�%S�K�@bO��ZY�@bХ4$@cRᯛ�c        ?�s�X�i?�t!��?�)���L?��Ю�?��De�?�:��%?�7.�,0�?���I�8@��p��]@��І@	��MCL@TF[@��1|��@�� m@��+�,�@���l@tF�$m1@}�W��@!R��+ ,@"�V�]/@$�z
3�a@&c�2��!@(/kOC�S@*K�SP@+��T6@-���L�0@/�g��;�@0�;�"��@2 �W��@3S L@4)?؟��@5F
R��@6hc����@7�3��qe@8�d����@9��=���@;'�؞{@<d[�0�@=�-�OU�@>����2@@Gir�@@�|c�(�@AoC@B� j@B�$m��@C|���_@D0Gs��@D�+����@E�>+�[@FXwÔ6�@G�e5�&@G�G�n��@H���j�@IVo�4��@JNE�o@J��	h��@K��I�@Lu3��A	@MA�s-j1@N�]�8�@N�'1��@O��js �@PDO��        ?�5arhl�?���H{O�?���Љ�C?���T�?�s �,�?�$�;&�9?��/�/@P$�03F@��]��@
D�*�D�@X)hs@fR��U@O7$�@e!��i?@�����n@=&�)�@!So~	Ld@#1���/0@%#j&[�Z@'("� d@)?q�>�+@+h��1A@-�H�iQ�@/��멉@1'�- I+@2^肗|�@3��}*^�@4�Os��J@66�z�i@7���~��@8�uѻ@:T��Ÿ@;©��9A@=8�Tsj�@>��K�v@@)�yK@@��)ð�@A�0A���@Bx�=.+@CI��P�@D��V9�@D�TDҩ]@E�p:��@F�� R1e@G�g�xŸ@Ho/DdB�@IV�o��@J@���@K-��o�@L".Ty@M���g@N�2�l�@N���(�@O�@�t�:@P|P~��@P���#@Q~؅bZ�@R+@`z@R��R��0@S߲qu�@S�;^j@T���@T��ϐu        ?�#���f?�R��ѫ�?�Wn>���?�kl���u?�G���?�GCc��?��f�I@ ȸ�M�@wߔ��@Z5���@���g@
����@�����@�^��n@�4����@�O=�<@ �`j�/@!�`}���@#����RI@%\�/a��@'G�)�Q�@)C>���@+N��:>@-i�$�]�@/�2y�Q@0�����@2)��@36y�z@4i&��V@5��tp�>@6�����@8*;�{�@9x���@:̒��@<'��_��@=�ѫ>?@>�pχ� @@/%�W��@@�(*�@A�6~�?]@BfHvt-�@C)U�uA@C�V|i�@D�?�&�@E�	��\@FR�IQ�q@G$G���@G�T�O	@H�M�j��@I� s�@J�c���@Kdp.�B�@LF!'c�@M*i���-@NI�U�k@N���G@O氲�P�@Pj����2@P��vg=@Q\ʠ��9@Q׾��t*@RS�(.��@R�R328        ?���R�.�?�5]2���?�;v�R�?�V�بE�?�k\&��@����8[@��9�e@	�-�HE@�v��x@U��ރ@��,@!	F^�u@#��fs�@&�1)I~@@)��k9�@,�,цr�@/��t3]@1�)Ed0@3xN�Q!�@5N�yO�@75nh���@9+�.:@;0�[%�6@=EE��a�@?h,2�@@̲��;1@A�VH�Z}@C�%��6@D@(6�s@Et�8�!@F��=؏�@G�UKg*@I6o���@J�����c@K�;=G@M0f}�4,@N��ly#@O�����%@P��	���@Qg�\�Ѝ@R"�!��r@R�DHè�@S��O��@Tcz��@U)?���@U��'�@V����r`@W�աG�/@XXi�kw�@Y*mÃ�@Y��xep�@Zլ��i�@[�ۗ=~@\�cn+�@]h>�.�I@^Hi����@_*�/Q�@`�(�@`{N���@`����@ae�YVX�@a܇R�=@bTxǺ��        ?��&R�?�l�	�x)?�T��	
D?�eHSȉv?���쟐�?��ɠU�?���C4��?��(U�"@Ⴙ�
@��J�'@
8 ���@�~Ͱ
@�;fN)~@\���@z��@���@�B �@�s;�@!�f���@#3!�tf@$��ݻ�	@&�M�JH@(z ���J@*V�GA�>@,@�\�_R@.6�ݶ�t@0��6��@1#�l_��@20�f�3�@3Cj�$kw@4[��c�@5y�LgF�@6���_!@7����N@8�ГjA�@:&�Y�s^@;_'X��@<�X��d�@=�pAl	�@?%Y��@@8�;�K@@੡�փ@A�!��)@B7�n��:@B���iͽ@C����@DK��F@EH��.@E���EC\@Fr��t9�@G.�eL��@G��>T@H���#O�@In�G�@J2���@J��:��`@K�8���@L�ZuE��@MV[�ƒ@N#�(�Z@N�G�Pn�@OĞ��X@PK�cw        ?��u��FF?�%O,�?�3\pse?���*��B?��rc��@?�c�[��?�C�
��.@��}�@֏r�*@
�)����@�f#| @�%	�y/@��2���@�SΜ��@��< @�@fʃ���@!��95�@#dn2�_�@%Zc��
@'cMș��@)~�iWKp@+�-��>�@-�GnW�(@0���^@1Ni}�l@2�D���-@3�8��}@5b�}�@6aĬ渠@7�?�=m@9���@:���RU@;�Q�<��@=d�Ĉx�@>�1r@@2:��:v@@�:w��@A��\�C@B�;�N@CY�Kz�@D+���fw@ES��@E�F����@F���&.@G��(�N�@Ht`wz�@IX��@J@]鷑@K*h
��F@L���H�@M�X`�=@M��U��@N�g�>^�@O����}�@Pr+�_@P�;�Xy�@Qq�s'G�@Q�w�'>@Rv�N��@R�/�9@S����M@Tv�u4@T��raV        ?�Ѳ�at^?��a�	?�
؊��?�%��
W�?���5�y?�aw#"Z�?�����?��roY@��y�@�*4b��@d8nb@�GY�@<0qX�@�t]p@�i���@��$z@����@!*��_�@"�]��d@$�b6�9@&s1�^�@(S�2\@*@�S�@,;��<�@.D3E�A�@0,�^�@1=N��j@2T6�s@3p�d�@4�i�uY@5���Q@6�ίT�@8�*<\2@9U���i1@:��I�X@;�����@=4�:�@>l���i�@?��e�x�@@���4@A8��P �@A�0�@yK@B�Ͽ���@CP�ox�Q@DᾤyZ@D�C2w5@E|�a�$#@F:��2T@F�d�*�]@G�TlB�@H�Tt��:@IF^k�}�@Jk3>�@J�s�_2�@K�p�%�]@LrZ���@MB)���@N����"@N�R�d~=@O��}P�@PI�l�+@P�G��@Q#��c|        ?�a�� �q?�~�� 8?�~ɫq?��V���?������@��ء�@	<�ɰ�@8q��@7���5@��yv4@U"�� @!5<D'2�@#���@&�(4��'@)��yIr�@,��h>@0 %��O�@1ר�觴@3��~�&4@5x*�s�0@7`2�͌�@9W}����@;]��z9y@=rV�K��@?�8z��@@�����a@B- ��@C(3:vt@DT[���@E��ʝE@F�a�Z�@G�=Ƅ��@IDr8@Y�@J��kni�@K��ezR@M7[Ʊ�y@N��j�@O��4Eʤ@P��̤�@Qd���;@RD�7@Rٮ��d@S���<�q@TX��\�@U�]���@U��|1@V��«@Wt�Ctq�@XA�1���@Y�A���@Y�I�7@Z��B��m@[�ޒ�L�@\e[)^P@]@H�k�@^�L �@^��J�'�@_�/Ƣ�@``?��|�@`��3�@aF�f��$@a�n1ѱO@b1.�        ?��$Br#?�QY�=c5?�5�T6�?�-�b�n@?��-|?�1�
 P?�`�G݃z?���<o�@��,���@�،-�4@	��G� �@q��6<(@�f�`�V@!� O@�UI,�<@��t.�~@v,�*�@zq�1�X@!M��ܼY@"�bh�@$�����@&R4Fe@(f�LL@)�hs�@+���x=@-�=O��?@/��/J�@0�M���+@1ߊ�[�k@2�iz���@3��-�D�@5�@��,@63�T�/�@7Va�F�@8~�1V�@9���"@:ܻ��^a@<� ��@=O*2Z�#@>��x?(@?Բ�rݯ@@�6�R�@A6Y���@A߹�u��@B�M��_�@C9^���@C���;i@D��ى�O@EOF@=J@F<�!��@F�lO��\@Gw��LW2@H3� ��N@H���V3<@I�����@Jt�Ϋ�@K8��+s@K�䰝,�@Lŗ{��[@M�"���@NZ��vg@O'����@O����M�        ?����l�?ć�%���?Պ�&͢E?�m4q�8?�
��`y�?��A�̸?�p2�ڟ�@ ��M���@,����@	ï��6@�Ř��@
�R>�1@�7�g>�@��.[��@��;�$@sF�$:;@ �J�U��@"�d��ZB@$�r����@&����a�@(���q�"@*����B@-�Yx�@/Fp2��@0�l��4|@1���'�@346�C55@4t��4@5��%��@7)� ��@8cGv��@9��,��@;'{����@<�X�	��@>?��6�@?����@@�crF�@AF�
�kF@B&=_;@B��5��a@C�V$�d@Dx9d�F@EL��6�@F$F��@F��s�"
@G�i��
@H�}�~&@I��!x�@J�>�}@Kot��ڋ@L[�R�5@MJe%5z@N<�B��@O0y+�#�@P�Ѯ��@P��qq��@Q�!�!@Q�|���-@RRkx��@R�o�Ħ�@SЙAE�@S�q��<y@TO�R��        ?��qYL.e?��y$�R~?�ގT���?��
3�?�4r�=�?�.�uy��?��J8 �@ xLzeӚ@�8�ŉ4@�e���@��5v"V@tuj�@3aA��H@򂏬�@,��p��@dBg-�L@ `�[.��@"!�f��B@#��V�l@%��<��\@'�su��_@)�v��ʔ@+�~�)f�@.-7
�@0���CT@1A K{�@2i�^`|@3���@4�Ԕ��@6��@7S�%�fa@8�s��,�@9�@[y�@;J
p��@<��/���@>��'�@?y?��k@@u& ���@A0�C!$�@A�2SnT�@B��?r��@Ct��rU^@D;���@E{��:�@E��G@F�����@Gr�m$�@HGC����@IC6 �@I���NX@J�����@K����0X@L��-*�j@Mw�o�}@N]H���@OE|R"�z@P!�NH6@P��=ۼ�@Qs!1/ @Q[����@Q�k�N�H@Rt�@�&�@R�����        ?�&?5U?�@_���r?�>9F��?�T�r���?�c/ǜ�t@�w4�O@ṻwx�@���`�@�";o�@7���@�����@ �+��7@#�<*_˾@&bF#��@)U�Sܯ�@,l���=�@/�'=>�@1�`F��\@3=�^�m�@5
���I�@6�c���i@8�����@:����ic@<ДnYPX@>�s�	@@�l�`@A����a�@B����!�@C�U��@E�����@F8"�p��@Gn��e @H�Na�W@I��g�A@K5�٠&�@L�����G@M���8Ar@O/��
EN@PF��lJ�@P���T@Q�����@Rc��@S`��@S�G�� �@T���S��@UXce��@V��thQ@V����7;@W��o��@XrӜ�r*@Y? ���@Z�LL��@Z�`�3.�@[�G���@\�T|���@]]�U��D@^6�S�C@_#��l�@_�E��@`g�bP(@`�<���@aI���>@a��x���        ?�˽�iD?�P��|��?�5�v���?�.Gx��?�	Ț4u?��o��?�`
g�/?���W^
@��5�d�@��5:�@	��C�� @f�H�r@�T�@�[�@�{�2@�@z�H�z@Z��Ů@Wͭ�@!8A���@"� �x��@$x����@&,���@'�sG5�@)����y�@+��rX��@-pRp�c@/]�zĉ�@0��VKA@1�E�D�@2��UpQ@3�E�SE2@4γ��p�@5���8��@6���-G@8k��Hv@9?t�v�@:f�UWR�@;��L��\@<����@=��X�G@?.��W
@@5����@@Ոz�8�@Awyske@BM���@B��R��@Ch��5A@D�����@D��X��@Ei��g��@FL� ��@FȋE��O@Gzs�| �@H-�����@H�'�3R\@I��i��i@JR2B捎@Kh�@K�]�aL@L�/B�9@MBy�{�C@N9���@N�kd�z        ?�	�,9-?��}��?����\?��s��X�?�%Upхp?�#�W�%?���T�@ m����@wֆ)Bi@�T��k�@����N+@i�4ʩ�@&�r7@��P�@��T7@RP}V@ V��R�@""1�f�@#�;��2�@%�j�/�@'�;_kCT@)�A4�/k@+�o�!_@-�[p�ok@0�\��@12���C@2Z&���@3�wJ�/@4����b@5���Q.@7<g���@8�����-@9�@F
��@;+1lo>�@<�Y��@=額#�@?Q����@@`���@A2C	@A�1_Ae?@B�'�3V@CY�l�#�@DlXI"�@D��e���@E��@F�2�<@GQ�����@H%A�\@H�k�ƃR@I�=O�@J��d8�@K��Y��@Ln:�\�n@MQG�~@N6�W�V@O��b_^@P��c�>@Pz���@P�u�ǦT@Qk,NԦ@Q�1ŕ@R`��;6@R�3�p:�        ?� �$��?�0��r?�B�2d��?�5�:��?�&%���?�\&�?�%R�~!@ �����@,�@	u�u
9@\����$@�Ω��T@�Uz�Wn@�3���@�Ԁ��V@��3���@ ��;IQ@"U�,��@$Z�\��@&Gb�K>�@(E��B�@*S<0s�-@,q����@.��ȽX�@0n�-!Ӆ@1�����@2¹Ä�@3��ђ�@53���[@6v�2I��@7��zA�W@9=�'�@:hZ2���@;����@=)�)�	?@>���Z@@BOڛ�@@��"��.@A{�)|��@B<�b� i@C ��	��@C����@D���>�G@E^	AHx{@F-7�%j@F����@GәY�@H��[5��@I�lF1��@J`��
>�@K?j�ӵ@L ���.@M\��.�@Mꁘ���@N��Bs@O�����@PU�3+�@P�(�<�@QFz�v_m@Q���5.@R;׿KDo@R�0=~r@S5�b�t        ?�Y`��v?�5��pC�?�4N���?�L2��?�Uy�A!@�V�*� @�J���q@�w���J@�M&��@$L`|�@��Fl�f@ ܴ% X�@#~ڽD=L@&F�
�4�@)31���@,B#�2@/r�k0�@1`� ]�@3!��)@4�$[�@6�u2��O@8��@��@:�R����@<��@M�@>��&�w@@P^=�l�@Aa}\#E�@Bx�,��@C�v`�D�@D�5�@E�/ d @G�}�ܷ@H@��2�@IxȬ�@J���@K�<Mc@M?]O_w;@N�L���J@O��I@P�����}@QEw,H@Q���#�@R��ܦo@SY7�9{�@T�+ؼ@T�I�i�,@U�9�7@V;����@V� %�@W�����@Xz܊v�@Y=c��%@Z�:0��@ZɎ�3Y@[�WZ��@\\�XT��@])(%+aT@]�!4Y��@^�Ƣ+��@_�1��\@`5���@`�Ǯ�v�@a
����