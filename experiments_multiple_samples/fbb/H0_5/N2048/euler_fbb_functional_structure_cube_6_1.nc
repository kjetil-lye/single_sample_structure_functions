CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101531        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�����;?ӽ����I?���M�@Yd��@�]��Z@�{0��'@!+��]��@'X`�>�@.v��R@3C!���@7Ŭ��\4@<�1R�Q@A <.�3@D!޽q�@G\z����@J۶�Lj�@N��?�r@QN�N��@Spv�.�@U���@X۟���@Z�-y@]Cba���@`j�2\�@a|h�k�@c����=@d���6q@fF�wU'�@h:�>�^@i�"���@k�r=�P@m�0���6@o�\�,Qv@p�v��J�@q�i�z@s 	�%�@t(5L$��@uT��G�@v��g�}@w����=~@y[g�@z[�R�*@{���.�,@}�^a�@~�N(7��@�V�Ҟ�@������@�&�a	�@�H%�k@@��ЩT�@��ˣ��@��;ۑ��@���A��@�~����X@�e��<�@�R��%�x@�E^
q��@�>:Ӊ��@�=p��@�C�?��@�O[�\�@�b0Ď�&@�{��FF        ?U>��Cr�?���:Gi�?�Y��ZA?�9�~6�(?ؕ��{b?�X�q ?��:��X�?��h��I�@3Pކ��@2;���@l̓�l�@�dĢ��@���z?�@|���D@"���}@&�S���x@*�C ĀI@/��S줡@2�n3z��@5�	)��@95�4l�@<��Wd>@@�Ir|p@B�I�ʚ@E"�.b�@G�N]�-�@J��d҄@M�n����@PY�ƭ@R
]ŝv�@S��;w�@U�3	\�@W�%���@Y�a����@[��m~��@^8�H2(�@`J4/+�7@a���H��@b����1@dB����@eu+�n��@f�z��{�@hO:{0�q@i͑��@kW˰��L@l�_�]�4@n��Y�(D@p!���0@q�pRO�@q��,��@r�����@s��q�B�@t�~��U@u�$��@v���E@x m���@yN�E׶@z����@{�˺��@}�)�1�@~zl��@�I�.@����ă        ?hhj���?�L/"�^?��.��a?��ԇ\g?��� �1?���N�NN@9 ,0b\@	6vb
�@��d�c@t'�z@��`
=@#k�֛�@(G�K}�G@-�%�얻@2-�[�]�@5� D"e@:�q>g.@>����=h@B��[7�@E �a�r�@HU�lܝ@Lb���@P�	˿@RhC`G@T�+��r@W�J�>0y@Z�[s+~�@^c��/�@aR�s@c+��UQ�@erq�(�@g�@j�)��)@m���!�@pj����@r(�!e@t	���ٚ@v�va~�@x>h\�V@z���{�@}P �@����n@�J���A�@�Ζ톥@�j�i�x@�{�$�@���]@���#��@��`���N@��O�1�@����>�@�DH��0�@�|��S��@�Ò��=@�b*�Qo@�{�ij��@���Gl@�n�CWeE@���c03�@��2�m��@�O����}@���X�5@��ٛ�        @��<�@E\�>i��@bK1�<�@t�����@��-	�@�1����@���!c@�r���@�M�L@����-�@�솢��@�w���F@�[>Z��r@��^L�'@�)ʰ%�@·��]�$@�|L-p^�@�y��<�1@˰���v@�"���u@�h���@�^�*���@�t� ��@ת���.@�L�"��@�{�xPR@��п`@��d�uw�@�\�7_�v@�ߗ��`
@�t��N�@��&�l�@���DY��@�o��t�@�~�fB�y@�o.�v��@�9(���!@�C����@�X(X32N@�u�N�@����8ck@��g��@��bz@�K����@����1�@��F���@�R�-��@��t��@�1�Ab�A W��lA[`H�[A�q��A�I&[O�A��g��HAW�+��A2��Ri�A�*{�A�JjW�^A��W�9A�J���A	����	A
�$�ߌ�A�\@�u?        ?d�XF-?��'S��?����4?�7EMW4�?��/�ku?�:�I�?�"N�Do@�U����@
����Ӹ@7s�� @���~�@����@�t�]��@"헩'9�@&#� �{f@)��,uK@-R�9�.@0�i�p�n@2�c�C[ @5�ݽaf@7dߧdY>@9�r�PB�@<��UZd@?Y� �&�@A$._�@B��j?*�@DJ43"�h@E��k@G�.G �@I��9��@Ks���@Mk'�K�@Otui �@Pǌ�(�*@Q�b#�hl@R���ՙ�@T" ���@UP�#�5@V�>�4�k@W�  �jl@Ye[x,�@Za��J��@[��$�}@]���@^��}o�[@`�����@`�Ǉ@a�c��i�@bSoi"HZ@c#�Hx��@c���.��@d��Z��d@e���á@f��}B#@g��٢�@h}Z��s@@iw0ɉ@jw�-�g�@k?w9��@l��H�b@m�<�/=@n�.��E~@o�
��        ?\�r�?��Ųbw=?��U��:�?ӥ#(�(�?�+���V^?�۾�,L_?��
 ��@ ��WH%@q1@�c(@���vF�@@3��C)@���&�@Xc�4@ de�k>@#p�T�4w@&ٜ�-N@*����\@.��ۣ
-@1�lY�%�@4Oڊ��@7��l F@:'��T�@=vP��t�@@�Erq��@Bs�ґ'@D�c	�{@F���`�X@I*�Ķ�@K�~�oh�@Ny�m�[@P�s~�Y@R@1��\@S�r�0n�@U��Н��@W~���@YrJ�G)�@[�U�.u�@]���p�R@_�k�X@a'�o�}@bfq7@c������@eߤdd@fz宏F*@g��p`�@i~��r}@k�k(�
@l�*�\.�@nz�F��,@p"8~\2�@q���=@r{#	�]@s�A@t��h4B@u��(>&@v5RH�a�@wXC��{@x�,��s"@y����@z����S�@|DMau,@}�`��*@~������        ?T>y�{�??��rY�q?�#����?�,�R�U�?�VB7;�?��Qi�F*?�	P9|4?�J�(�?���=�9?�t�Ss@�2��@�Z�a9@���5@���\�@���]O�@�g�牟@��=t�@"�if��F@%���/@(���\@,����i�@0uS�1�o@2���-,G@5E���_@8���.�@;'���@>Fu[Nr8@@�wz�1@B��U�@D�D�S @Gz�߹A@Io���@K���D��@N��ƨT@Pχ>�$(@R^t.�F@T^s���@U΄�"@W���LϽ@Y��	|�@[ԱK[I�@^�y��@`;�{��@a}�H>@bГ����@d55(p@e���@<�@g5)�aRT@h���5[D@j�~�M�g@lHA��!@n#Ȇ���@p
͸��@qd���@r�֌P@s9G����@t_���@u��g��@v�Nk�\�@xc�d�W@yb� bG@z�E�7^�@|#<��,k        ?���5��+@I��I)s@@��_��@U�6ĲW@et�/�.@q������@zm���@������@����G�@��A���@��^�MI@�HQ�
l�@�#" �s>@�6��A�]@�� ���@�(ԟY@�r�>R.�@���#�C@�����ŝ@�Ⱦ�O60@�י���5@� ��X�@�C���:�@��S�8�@�f�bpX@�V z���@������@�'˻�u@Ā�J#��@��:o'�@ǈ=��b@��U/m@���v��@�n���@�(#uʎ@��T�6$@������@��i�=;�@Ҿ^?\�@ӷGǞ�@Ե�f��@պ!\g@����k%@�չ��1@��(O�B�@�7���L@�0��L@�[�PL,�@ݎe�1
@����n�@�B�0�]@����@�O���y7@���a��@⩷�WR�@�\��-��@��(�@��g��q_@�S��*@�S֒c4�@���5@���!�@��Fc�        ?��ůU͈?��:�Q?��8�F�R@�r�bG@ �E��@*���e@3�"	��R@;S�\&��@A��U��K@F�TUb��@L_�װ��@Q5%$7K�@T��Υ6X@X	���@[���z��@`�Yzc�@b?Fʲ%�@d��a�j*@g
�k�+@i���+�=@lU��oB@o)�
��@q��Z�X@r�{�/��@t*��{@u��>�#>@w}�8U�@y9���z@{��p�K@|��w��@~�����@�N�"��@�I	q��,@�I$��@�O���@�[=n!�@�mO����@�����ͩ@��2Q�6#@��;� m�@��F2�oA@�,���8@�hc-�@��C�@��O��@�&^d��@��=��O$@����n6�@�Au�0j@��<���@��r����@��S����@�Zo�)�@�.��m�@�	�/�J�@��6 ��@�һ$��@��u�}�g@��O��{@��-B�w�@���H�C�@����}.@����A�        ?yCPS���?�����V?�A����?�{\OO��?�f8���3@֥}�0�@r�K�]@?��*-Y@j���a@$�MK*_@*��z�@0Bf�|�w@3��?�F@7�m�t^@<��u�@@�dqP��@C���i��@F�QqSw@I��I:.�@M�3���@P�)�_Dh@R����2W@U 7D&t@W�Џ�#~@Z/FE��@\������@_���Հ@a�2Eh��@cF��m@eI��nx@f��T���@h��S-@kg��`@m7�z���@o��U�p@p�E��- @r3�ہ@s��f��@tܔ8dY@vG?N{��@w�8[�u�@yKUQ��@z�LA�A�@|���ɮQ@~Mc�#�@�1����@��"�@��v'\H@�����R @�� ըY@�#{���@�EX�g�@�qB ��;@��N!�2i@�畻�,q@�22@R�4@��@�[@���5�4@�Q9�a*�@�c-+K��@�#}*�X@��Rgk@������b        ?���~ʵ?�g�'��@�A'��@��ϵh2@*=�r�@4f�o�}@<�	�v'P@C�n� �@Hfx�@Mk�i�5@Q����6@T�4	r�u@W�\>��@Z�dxk6@^qB�M�@a!�nWl@b��X~@e�!��:@gGÙ��<@i��A� @l/j]o�@n���2d@p�'6/E@ru2D/�?@t��e@u�5T�@w�Mc4X@y��B1>@{���ϰ�@}����V@�x��@���Y��@�;ĉ:@�m�A�@��k� @��}ת�@�.<�2�.@�|�T�@�҈]]0s@�/\ޮ�D@������@���`��~@�tLt7@{@�xǒ��@�<r?U�@���nM@����Ct�@���9=�@�y���h�@�UH�[�n@�5�R���@�^� ^�@�W�h�@��o��
@����8@��sQ��@����	�#@�ъ6^�@�֕�Xޤ@��T1��@����TƜ@��G��#y@����T�        @<X{�(�@o�<�Ȕ@�Rf3s�@�B`��`�@�������@�	�+�@�h��
�@�Q$[�@�j׍0�b@ӣ֤8�@��Af�=�@ܛ�V�@��Ұ��M@〳�בS@�\�z:�@�c��@�l��	@�����@�z���@�2պ��@�q��H�@�j�>dF�@�ud��e@���7ߦ�@����;z;@���RC��A&[:��'AU��}A�65o@�A̎��~A՗Dw�Ac�;�A�Gq ,A
�֫��A�H�C5�A�"�Aj�4�A�d���XA��I2
A��"�W(AXAf<8"A-��h*A	kE2�A����A���M�A� �#�mA��r��A�Į8�A��a0��A��[J�Aʣf���A�>�SA?9��lA4o�!�A 4ߙ�
A �ZM�A!w�.��dA" ^�\N�A"�Q)8F A#~��?��A$4���M�A$��m� �A%������        ?b:E0w�?�!����?�Q%��~�?�#�6_�i?∧�_Y�?�bb?�?��E@ 1��Z@~̵�P@�2Ǥ�B@P�@4l�K*V@�'��;j@?���B@!��È��@$�&8���@'��ɄϠ@*ݾ�(/@.c��� @1��'�@3X�r�D@5/�7q�4@7j~�Nڵ@9�2k�@<9#�J�<@>��Qa�@@�At�ë@B'@�C�b@C�x_X @E'�@��_@F���gtK@Hn<-�@J.�
��@LX�`�@M�A���@O�z�9<@P��z�j@R0X�	�@SCxKܯ@T?�(��@UhC/">@V�Z���@W�mz�5�@Y/�^]J@ZW��E)h@[���A�@\�a9��]@^[�ޠ��@_(�@`��4HX�@aTD��x�@b�&�@b���нY@c��Hm��@dkz�>�@e;4[Ȱ@f��ɯ@f���?�@g�A�ř@h��'��=@i����@ji+{X;v@kS��Hi        ?9*Uڇ�H?w�	vSQ�?��d��j?��(`��?�N�tp�?�A�x?Ԡ0�&�??�:l�p֋?��.���?��@!^w?�Fy�?���*�k�?��"<��?�����~@-�@�
���@UO����@*��:@ t�T@4�V���@�"&C0�@�@Xך�@!,�1~��@#��Sݟ@&wJ�*6`@)�:�K�@,󕓝�g@0Yȥ�l�@2iQ-��@4�à�Ri@7$�٢Ņ@9׈�(�7@<��o�@?�����@A�@���@C�u~竆@E� ��_@GǶ���w@J����@L�V���@OB3)@Q�Z��@R���}As@T&��%��@Uد���%@W�����@Y�]~S��@[��rb��@]�bqT��@_�2�#�@aO�`4*@bN����@c��C�@d�l4[�@fVm �@g�[��@�@iY�z��@j�NҌ�5@l�]�ɓF@ngk2le�@pp}�A�@q�.��@rΎ�3�        ?8�h'��?q�;{g��?�5���>R?������?��y�?���VS�>?�(Ә�8'?�s����?�
t�?�"��d�?��[�o�?��6�:�?����S�@�sS��p@�
K�2@
;���l@Z�ݷM�@�
�r�@ֽw ��@����=@����@!�
8@#�^��.�@&x"���@)��^�M�@-y�)�@0wK��p@2�"{y9@4�D��܌@7}��zQ@:M����@=`�[L0k@@\����O@B-���h@D$�&�b�@FC9{\�@H��d�k@J�*�H7@M�7���@P*� ��@Q�kW�^-@S-s��O@T��pG��@V�xI>�d@XQoTɭ@Z2�H�-u@\)E6�@^4�-���@`*�+��@aE"7^�@bj�t��@c�B��@d��S�M�@f��~j�@ga+8܌�@h��f�1@jtb��@k!z��@l�)�,$@nlbwc&@o�%��@p���r��@q���8e�        ?�����U(@T�k�@4��ce�*@Jo��|��@Y������@e���B�@orhq
ea@u�� �@}���U@��� ʰ@�-���@�:��T�[@��r��_�@��1c��+@�9'�@�ɘ)7A@������@�^?�bj@���Ud�n@���A�i!@�ZBF>�l@���D�� @��r�ś�@�A�2�HU@��-6F�@�M.b�&@��C!��@����^�@�`�'�@�8����@�'N�>�/@�-:\�m_@�%��`�@�A����{@�i�����@Þm�
]�@�ޚL�x@�)ˉB͆@�_�g�@��ۅ12^@�G��@˺w�F�@�6O/���@λg7b��@�$�\�@��7Lc8@����@ҖZ.���@�p��X�k@�Oֈ��@�4NE�K@����T�@���"�@� ��y8@����$��@����Ĩ@���''@�")��@��T��)@��7�s~@�1W��b@�%@۝A�@�"�ܿi        ?�uj�?D?������?�+��2rr@�s/��@Lu}!�@�SA��@$'����V@+�b׈�@2'�N�(=@7�sP	Y@<����|@ABM�O,@D�;r�P@H��P5-@K�(-�J@P�M��@R<�*�Y@T��e���@W!���'@Y��Ӕ�W@\���潈@_���]BK@ak��_��@cBM1@d�g�z)�@f�*�E��@h���ȭ@j��W���@l�M���&@o�Ѹ~�@p����@q����g@s��s�@tg��K@u�sF?�y@w� r+�@x�H���T@z�/���@{��g{e@}����@~���Ĭ@�/�װ��@�1�/��@���g��:@�Պ(�0|@�ŕfo��@��,��7@��op�h@���@�@��St��@��r��@�H9��@����{��@�����@�N��#�@���ᙲ�@���G�P@�tۼ�m�@�J|��uc@�)����@��Lq@�~�8�@���Ӯ         ?��|�^B?�J���A?�y�Ռ�?�J���!@
R���_@�����@�ט�@"Z%+ʇ@'Z
�zD5@,�6�o@1�/[��@5n6�9@8����&@=0��ʙ�@@�$D���@C}m��t�@FD���e@ICg ���@L{%[�[@O�80F$@Q��X ��@S���	@U��z�N@W��]��@Z|%�.@\W��9g1@^��7�G
@`��6���@a����W@c?��%>@d��辑i@f%�
��@g�$�-�@iX�?�@kj�6�@l�]��V�@nɓ6���@pdWL�[�@qp$p�~�@r���kE�@s�ҥl�@t������@v!2��@wpp�p�@x��b��$@z=m[�=�@{��H��e@}L┿�a@~���V�@�Qjg:�@�4�eP]J@�!�]�k@���=	@���X��@�%V��@�=M���@�b~�@����2�s@����e�@�"�S7�m@��UՀ�@����2r�@�u��~�4        ?nG�P}˸?�����?���<���?�F��7�9?࢛�Yy?�����6�?�kG4]�k?��f%��@]UKU=@�ֺ���@�9�ۢ#@���� %@�����*@"g����@&��7��@+I>~��v@0aj��-�@3��\���@7	V,�O�@;equ�n@?n�I�{"@B,
�ƒ�@D��y\@G�A��<b@Ku���@N�C�bu�@Q@���|@SU���1�@U����m@W�����@Z���^-@]^x���@`*��j�@a�s��
P@ck��C�@e31�R�@g���t�@i	�Ղn@k/����@mi��׉@oÒ[�=@q���i@rmU�5>@s�!~@u>�S��@v� ��@xZb��@zO�6�@{�Q
\�w@}��P{@u�0�fT@��ck��@��B�C^@��M�pz�@��Km$~@� ����@�(\����@�Y9���p@���[Rf�@�Է�-�@��Ѭ˫@�s�I0H�@��5��,        @&h2����@[�Vs)8@x���c��@�OF��@���`n�@�T�F^@�i��Q �@�S��D��@��=�d�@�53��ô@��.��@���3�@ȯ_�<:@̌�)��@�U�tR07@҉:���@��D�4�L@�_�X�:@���0�@��f�d5@߻% ]e�@�h0r鬭@�v�tW@�K('_@���L�X@�]����D@�P�̢,�@�X�jd@�@�u�ի�J@�R��,i�@�t��$�k@�(�I@�Ӽ�9��@�@�_ڤ@�XX\�@��F'{�@�HF7��@�i�0��J@����$�@�R�aɇ�@��n�
A 2� �A ���� AЈR
BA����M]A�3���)Ai�M�BSAW
Ja�ANr_AP��+$A`fK:�A	}º��>A
��x�f�A�>!�kA6C�9j�A�t���AA
���A�P�4�<A���\�fAm�Z>�ARn(ACh���AA)M�        ?h[�3�|q?������?��&a�B�?ժ&&h,�?劐��}?�8���Ak?��^��@�hr�m�@
�4��)@4�'��@�X��p�@�P[�U@ ZU@#}VZ�;@&P��,��@)λx�@-��3N��@0�)�Dz @2�[St6@5!�[Y�n@7�˖w@S@:�S��@<��1�j@?p�b�SD@A.g���2@B������@DQ�°�	@F ��z+�@G�Ց�@I���(�4@K��qug�@M��~X�@O���p�@P�w\�d@R
HZF1@S6��Գq@Tn+�>�@U�ͫB�P@V��z��$@XQX���@Y����@[4n\��@\�;�@^	(M|4@_�w��:�@`�cI5~@aY�L�i�@b)����@b�"���@c֓�n{@d�&	iӗ@e��u�~`@fx{�� �@ga:b�Q@hN�>0@i?"Sl�@j4K�Ѐ�@k-�E;5%@l+0��@m,��-У@n23���'@o;��W�[@p$CM�f�        ?5
�1���?wp��;?������6?�#���Jg?�Óe��n?�1�>1@?�ӿ=��?�p��j?꽤5(�l?�ϊ/=�?���od ?���m�@@��Sp��@�֥e��@
��_@�"�IG@eDAМ@���@2���	�@8+K��@ ٖ���@#V"6~��@&�_Y*@)kh���@,m�'DCg@0��338@1�J3���@4"�:Ӌ@6r�?�i�@8�8���@;��`@>�޻�V@@�:`j9@Bt�p�T�@D9s�U@FKӚP@H���@JA����@L��d�0<@N� ��B@P�ΐM�@R��Z2@S��%�!F@U7ke�@V�_
��)@XG��8�@Z	7�@[�vP�]V@]Θ���@_���M�;@`�M�*�{@b�v-s@c9-!@dl�P��@e���3^�@f�]q+m�@hR@`=@i��/���@k.�(d��@l�F��G@nC����@o�����@p�p�,["        ?b/�@��?�!wo��?��r�	?�n��B ?��2U�Yi?�$�ƕ��?����;�;@ fF�-�z@~	_�1D@�i��@H�E@ԁ��]�@QO�@�@!�=	�p@%>곀}=@) �:Ɓ�@-l��DB@1ӟ�aB@3�� Y��@6}5����@9�M����@<��x�!]@@<,eP<�@B,'S܂@DBJ�+?@F�~\��z@H��&� @K|<08}�@N<�����@P� ����@R%�{�(@S��D)�N@U�؋�nv@Wl{%���@YeK;xn�@[{��DX�@]�KD��f@`�
0�@aBg�k7[@b��1���@c��D���@eh�ܼFa@f�V���@h�}��t�@j:N�@s@k��ӑR@m�.Q̊�@o��5	G�@p��cd�@q�:��`@r��N�2@t6��@uIn��1@v~�^C@w��0��@y
b����@za�]�8@{Ų��X@}6&J<L�@~�����N@�X����@���^c��@����
t        ?�7�����@'~D3��@:�!���@Q��o��_@ay%
k�@m����c)@v�taZ@�B��0�@��L��_�@�����E@������6@�|}�!B�@����ws@��yT�q�@�ߕf5@Q@��j���"@��f����@��z�d�@��#��w@��$)9Ɇ@������@�njv��@�m�&��,@����J�@�����@��nk�GM@�SS3���@��d7w!�@�+���x@��r�	Z@���R/Z�@�O@d�@���6���@�S��m@��N=Pˈ@̎D mT�@�?���V�@���T��@��g�c�h@���U��@��ѯC�@ӹp�mB7@ԶѲP?{@չ����@��N���@��.��H@��Vg���@����+XD@����@�;e:�@�b���8�@ގa��h2@߾��)�A@�y��� a@���8��@��}R@�W`��@@����Ğ@��VOmz@�H屷_0@�����@� 3��@�MT���        ?��7A9?�A�׬W.?��^KYp?���`W�@
�@SqF@��n>ך@�����@%P�o��@,9�\?a@1�û��@64�J-�@:�c�#r@@���@B���5;@E�S4�@I �;`�@L�܅�P'@P 2����@R�s��F@T[�u�
@VB�!�@X��4�;�@Zیc��@]N�����@_�DZG��@a@�%�tc@b�>�S�@d3Mؔ�@e�*;gǔ@g5e*!@h�"pq�@j>wb�V�@k�"G(9@m�J�9{@oo)1�@p���@q��@r��7$O�@s��r��@t���'D@u��Ԇ��@v���7�!@w�_&�@�@x��H�(@y��F�:@{_�\+@|0��/S@}ZA[�W�@~�9s;@���2b~@�u�+�@�u�-;�@���1+�n@�MU�C�@��SY,��@��� ��@�0�H��@����}^@�xq�.�E@���e=@����?@�kk�"N�@���˵�        ?��z���W?�(�BH�?�Z3N��@�{Fj��@!sS�_@,D(tR@4�܄�@<��Fb5�@B�F��@G���m�@M`QZv[@Q���ӛ/@T�k�j?@XW˧���@[�]ݭ��@_�~��^�@a�BKV@d���@f3\���@h{�͸�x@j����@mS�p�@o�,�:�@qC+�<@r�dg�~/@tv#���@u����~@wv�2W@x�2�#l@z1S,D��@{�<;J�@}�7@rY
@\^� !@���4��@��_���^@���zEi@���$5��@��d��@����4�@��U�ҝ@����l|@�ؾOб�@��d�G�@�"���@�O!{Q��@��c���z@��7�v@��jRC�}@��h]���@�8��@����Ic�@�����y@�'���P@�г���@�{_��n@�'�Z��@��S�P~�@����=y@�8��-��@��3��N�@��{��s@�[Џ�z@�;1�Χ        ?�B� h2#?צs�k"?������f@Ϊub�@�)ϙ'�@*�f��!@4EF�}+�@<��0���@CB�;�o@H�p�`�@O`yV�QP@SH�' �@WA {S��@[��-
P@`/>��b�@bţg(�@e������@h���ɕ>@k���T�@o��[XAA@qÑd�@s�D�@v3���X�@x��] �@{X�X�&�@~1�jS<"@����}�O@�:��A��@��U1�@���å�%@���fű@���k��@�Ԅ�$!g@�jʠ.@�8XT��@�u�\�KJ@�� ��>@� o"���@��q7��@���@��.e���@�@�����@���%��~@���(��@��i.[@����M�@��+Xf@�ɤ�ܯz@��� et�@��俙�@�2,!~�@�?���@�q-��4�@���B��9@���� }@�B �S�i@��4�j��@�kJ��@�BԸ4T�@���.@����TC@�� .��c@�x�C}U        @"=��W�@X��7�?�@x-Y=
?@��{���@��-����@���
�a@��3��K@��|�M��@�/p�&@�"4.�$@Ǘ����2@�u$�e@��&����@Ӭx�t�@֭L2d��@�ܓ1�K@�9='S��@�aP0"u@�;:�o�.@�*��j@�.�;Xi�@�F��Gh�@�sQ0F�@�%e\E�@��/�i@��2MTh@���ɚ@�6��i��@�z����@�� 	���@�:s��@��I'6�@�d���@��u�%�Z@�
p_�I@���h\s�A <q���A �&��'5A��7�N�Au���#�AG�?F�A�#��A��)�/uA��`�\A��:���A})PT\�AX<9�5A	4N�.�A
�v}dKA
��e�&JAˡ�`�UA�/���qA�D�A%Ah�����AH���bA��B�4A��AV�A��r�A`�\��A�:���A=~7��7A��?9��Aӷ��        ?�qsq��I?��:=�@�S���@#�e�7\�@2�i�aR@>E�Rb@F8���Q�@N���7�@To"��{@Z*��4�@`N7Q�:�@c�#1X@gжJ���@l���T�@p^}iL~�@r��r�q@@u�<�R3@x]Az.@{]�#��@~�W�J�@��0��/@��
Y���@�x#Xo�@�Ywh�,M@�L�����@�Q��h�\@�hu�)�@�����@�e/~%U@��d�	@��4��@��gZ՟�@�,�/6z�@�s����@�����,�@�}� @�z�,7�\@��Ѫ��@�V#.ˤ�@����T@�,�|�@��ef�@��/��D6@���,ӫ@�n���@�N*sZX@�3d�%��@���6��@�����<@�*�WR�@�I�Z+@�,y��)@����2@���Yx�@�1S����@�J>s0/�@�h���x�@�F ��s@�ڨU��;@�rD:��@�8�lcR@��c,��R@�I����        ?�[H���?�p� wl?�����p@��b@�+{�=@!�>�4@"����@)���bs-@0�=�^�<@5;���vF@:K��@?��3e�@C0���$@F�q�=��@J�yӽ��@N���*�@Q�w�b�@TS�h�@Wy@_�@Z¶˨@],�����@`H�1���@b���@d��s.`@fK�Kړ@h:���@jn��Q�@lߦ��]@oZ�Uɋ�@p�*7�@rO��D@s�0WB�@u%l�@[@v����Y�@x/&Q�@y�n����@{o�g�l@}&Z"�z�@~�
�@E@�`��e��@�S��"|@�O:���@�SP'�?x@�`.��.�@�u�A���@����N=@��D��q�@��*k�l�@�'�wv�6@�k�M�r#@���Uk�@�ݲ$@�{b\�@�wM�Ye@�7�q�O@��,�M��@���n��@�����*@���'|��@�d���N:@�O�N�A@�?h�6'�@�5q���        ?��=�z�?�1=��'r@$Yk�@*�$o��@#i]� Z�@.��W�@6HJ�a��@>I7�P@C�Ь���@H�$�6=@Nl�J��@RLF��Q@U��'L&�@YJ�r�q@]7b����@`���&@b�A��5�@ej%�@hi��֭@jʊ��^@m��WZ@pvwl<@r'x�Y�@s����s@u㻝j!@w��1��@z%
_�@||a� ��@~��9֮8@���=�*7@�9�!cL@����@�M���<�@���I@�������@��%�l܀@��8�2�@���p�@;@�\Pd��@�x����@��-�dIl@���i���@�Y^���@�X�$+(�@��As@�
[C��7@�s��}��@��%[q�@�h��M@��r�?!@�EU�Pk@����rK@�����@��q|��@����ѡ�@��
��5B@�����t�@��j]�l�@��w�WN�@��8T�@�����d@��F�N�@����Ѓ�        @E��*܀9@z�ٶg [@�����@�j4�@�� ��&@ŋ_;�DU@�v)3��@Ց���@�B`jM��@����X� @�|�?Z@�r��N(@�`�f�@�{U˒�}@�Y|�˫y@�g�{=�@��K��m�@�$�-�lAU�ġ�A7��R�A/.�`�A;H�]�A	[{�A�G��A�ҫ��A[&�AKbu�QxA�¦��eA�7T�A!,��Ay��YpA�H4��4AE����A�2�`q0A1��FA��JkK�A@����KA j��K�NA!:+�6��A"��b�A"�\(�?[A#��״XA$�Vgx;yA%�.�hA&����a�A'���(�GA(�?i��A)���}A*�&>�O[A+��A]A,�QP��A-�¯��A/�=�[?A0%�7"H0A0�y�Sd7A1`P��A2Y��0�A2�����A3P ����A3���lx�A4�4o��A5]��BA6CY���        ?�S��	��?�?��8݌?�����J@~�ʠs�@�'����@&Y|h"Q@0s��� o@6�hԚO@=�v��y�@C|����@G��Lѧ@L¦Тv@Q)1I,IB@T/y� 9s@Wt�c@1�@Z��28Q@^�}9$L�@aa�s\��@c�E���H@e�U���@h*��m�@j��=��@mSqvS�4@p9G]� @q~� ��@s�J٫@t��ƛ�@v8(�е@w�R�A.2@y�����@{�w��3@}e�{�`@Y����@��J`?!�@��UH���@��/��û@��ZD/@���k�v@�@_7G�@�xy����@���]�@���(^@�X����@����h?@�)�׋s@���R�AO@����@�C�oQ@�
'�]�@��_�um@����	�@�z��qk�@�U��;��@�5r6���@���E�@�7I�@����/k�@���j�@��C�Wn@���h}=|@��D�7[�@�
Ħ���@�#nn]�`        ?t[��?�Ez=O�?�eg!܁?��m��?�:&՝�r@:}Ѵ;�@��׶O'@�=8�K@�KA��s@"�i��w�@'�5��rV@-P�AW�@1���g��@5\���y7@9RЙ@�@=� �!�@AN7����@C�$���@F�Ľ�!�@J/yI?_�@M�g���*@P�.F� (@R�_X�@UM��\�@Wr�)��@Za�֒@\���X�@_��@�e�@aY�E4@b��FqB@d�V��Z�@f�{��@heAp��@jbe��@lv�p^�@n����	@pr^�N_@q���'S�@r��U�L@t g�$@us��zY@v��4��@x?��ȭ)@y�`�,�g@{B�kn�D@|١��F@~�:AM�@���?"\@���rB5�@����T4@��3@O@��^�;�9@��gH�]@��vD|Z�@�	�,.�@�- ����@�ZEp��/@���8Vۅ@��?�( @�!��k@�y
�i�@��o�4��@��Ĩ��0        ?��w5�X?װ��/.?�,���'@��;
@4o/��@"t��/�@*��'˕@2{�;F��@8=����G@>�y�F�@B󅶲Zt@Fީ�ڰ�@K��[�@O��g���@R8$^�D�@T�6����@Wp��n�i@Z@�]�L@]1O�m�@`!�J��\@a�V��o@ceX�c@e|�Z�@f銗�@h�JE�V�@j��#0#�@l��F�@n�
zA'@p`���PQ@qq�[���@r����A�@s�#�e��@t�t"�r3@u�a���@w!�/؈F@xV#Ă�<@y�41���@z�F ;��@||��=@}b�@<@~��*Y�y@�)��@�������@�h�=��G@�Q(C�@�֫-�8�@�����!@�P�{p��@�1��J@�����q�@���0��@�j^����@�9/K�@���P�@��2�S^�@��M�@���ɦv�@��	}��@�j�XK�@�Z�����@�PG,�e�@�&�� �@��>��%�        @)}�Q(9@]!�}/T�@{]\ǜw�@�eJ67w�@��R@�S�@���/l�v@���A/�@��P$c�@�1�x��$@ą��V��@�U�$�w@Ρt�^�s@�4`_�QG@�U�p�K@ص����@�T����:@�`��@�(,
~f@�V�W��j@椤�� @�2$�-�@��5L�@�J:�Y��@��X��@���(+�@�
K���@��x�4�@��S�#� @�byr/�y@� C��F@���7�N@�� ݿ��@��4LI#@A �Į��1A���hA�5���A�&�!l�A��6�A9�:[
PAeLa/�:A���c�A	�0
���A|��qAb�k�&oA�0m��*AՔ��zA:��x�>A�I>��A�����Ak+�l�A.␰ƣA�D���A�t�1��A����R�Am؞��AJLX:��A,`�h�AQ���A 4c;)aA��p�Z�A뷸o6A깅�Y�A�W)        ?�#�? 8?ŕ���-�?���&EN?��ΉRTz@�STJ(.@i�����@����Q@#�p�g�@@*�0�@0�n���Q@4�!Û@9o[H��@=�@�\J@A��Hܸ�@Dp�w�zP@G�c�EJ@J��L'b6@NZ$��@QIE��@S��_@U)�`��~@Wd?Oy0@Y��Y��@\/���e�@^�/^�N@`�����[@bG�Ј�@c���@e}���@f�5b_(�@h6��S�@i�����@k�O�O�@mRj��Ҙ@oI�۵@p|L�(��@qo-2\�@rhE��@@sg����@tm;���>@uyHY���@v���ѫ@w� �k�Y@x��m@y���}��@{�@PSF@|N"��*U@}���cw�@~���@�
��	�@��	��W@�^˄0�@�/l>@���Լ��@�wb��%`@�1z�PF�@��?��GA@���D{!@�u���@�>�gS`:@�
�z_;�@��V�&%~@���[C        ?n�*<���?��=R��?�j"h{��?�`�����?�)Ԇ�G4?�&'C�?��DuG[�@�l�ˤ�@����>�@g�Á��@}��@�Է'@�]n�8@!��;l@$\ڴ�@'q�j3B:@+8���+�@/k���(�@2	ʦ���@4�-�98@7p��f(@:���'��@=�r�@@�q�#�M@B�$}�V�@D���@G-4�w�8@I�4T|�@L-}��@N� %�@P�C2�@Rhrv���@T �7>��@U�@'^bQ@Wn����q@YFF�@[3x�ZF�@]7�>yD�@_Tt����@`��;�@a���/�*@c"wy{�+@df�P��@e��^[V@g��G�R@h���6�@j��B�@k�5K��@mF�R�Il@n�$�,@p]qg��l@qE�Ʃ�-@r5��Ñ@s-��Ծ@t+Zn��#@u0��)�@v<�#R/@wP8b��o@xj�E��@y��f�\�@z�`�3҄@{�i��u�@}#;��~%        ?sf0M�]W?����$w?ǚ���"�?ݳ��+�?�����a�?�t���@�;�,@	�Z�V@5]�á@j��v�p@v(��9Y@!���6��@%�l,FR�@* a��׈@/#T=;;V@2\kdǊ�@5t�=�+�@8�����@<�|�"��@@eVW
�r@B��Vd��@E/Ó�(@G����o@J�Tɜa�@N?���@P�����@R��-<�@T�齊�@W8o����@Y�e	TDW@\I�u��@_@��@aΡoL4@b�5�x�@dc��,�n@f6�xl@h&�L@j4�Pd��@l`�X���@n��!2�@p���0&@qӬ!�.�@s,c�ap%@t�FOj��@v��5�@w����@yJ�,���@{X���@|���*�@~���Q�@�X���@�_c�@�r�&���@��|�i�@���v���@�����@�3��f�P@��4Iϋ@��,�,e_@�D֢��@��XFں�@�:�Kb;�@��j}�Æ        @D��s@E��aB�@d�I1��u@x�Β�_�@�
�@!a@��@��@����@���Q��$@�5�jr�@��RkI@��x%�@� �
g)@�IJ@��k�KQ�@�G�ކ��@���+EF@���ןu�@���Sv;@��>�b@б����r@�{z/ ��@�\�5'��@�T$&�Ȱ@�a���6@ڄ�R&��@ܽ�`�m�@�E�ۼ@��p���@��D��5�@�:��GT4@�����@��F�hb�@�I1�r�@��a�ٛ@�.2�p'@�ɝ�m@�9h��@���{�a@�5��G�@�e��8i@���F���@����@��S'@�[#{��@�q�8��@�b*w�*|@�W �1�@@�Pπ��]@�O>̢��@�Rr����@�Zk�~�@�g+Fh�@�x�켂�@��5��A@���N&7A e�����A �k�]�A��5��]A%�N�A�t�'a[A]~�\W�A��P�V�A����        ?c�g�5z?���>6�x?�u~���?Ӧ~�ɵI?�Ywp>?�6uE/*?��$�@A��[�@"!b	P&@䮒��_@ǤZ�c@�� @�d�R�@ ���$@#�$.6�4@&��hq@**.5��@-�S2Ti@1p�I�@33��Qf�@5�v�
Pb@8�F�co@:�	t3`@=�1s��@@cuiF�M@B��it@C�B�R��@E�����@G���]@I���)M@KƩ��#@N�qb-&@P7�C砣@Qw�q�q�@R�$���L@T#td���@U����s�@W����@X��� �>@Z69P��@[���A@]�&�|�@_}�T@`�ȁW&"@a�ӯ�b�@b�E�嶿@c�P!�%@d�"~j@f����@gM�Z�@h�տ���@i�\/�"@k0����@l�k�J�@n�ǧ�@o�I*�5@p����;�@qU�<�5�@r+A�(�@s�T�m@s��	�o@t�[ �@u�w�W        ?D�Wu�N?�/�eR	?�b�uv�?�#I' �i?ҩ� ��?�+eH�c�?���E��?��U|o�?���يs@ x���z@@��Y�@
� �
x@��"�Y@�I�H<@���,@*�S�+@"����d@%]���@)#�@-_u��,�@1���@3���' 
@6��Ȇ�@9ʇ�؜2@=O����@@�K���@B����K@D����@Gv�C]�@J%��n2E@M�&h��@P��
��@Q��{=@S��_�A@Us�pӪ@W|��Y0@Y����F@[��~W/@^fx��ΰ@`~���X�@a���G�@cQ"�P̂@dٌt��@fw����1@h,�I>�8@i�SQ!�@k�(~Ʒ�@m�)5�K@o�+U�(@q����@r:��qE;@spBS*�@t�k�g�o@v�$(�?@wjm��Ť@x�#� �\@z`<�6��@{�'���;@}�K�gk`@P.^��@��U�vK�@�y�]a�@�p{��`        ?F̈́m�.B?�=x�L�?�]�U�?��s��	�?�!��|<?�x����s?�NU@��?� 	4�?�L��L@^�3��@#61^@�jKA� @�t��)@�#`ܝ@'��8�@!�=K�r�@%+<)k��@)0@�l�@-�g���@1e���=�@492����@7YtMd@:�]�Zh@>�Ɔ�-�@AV�2�L@C��ASg4@F����<@H��ᬛ(@K��f��@N�0��+@P�˾6�>@R���lg@T�CY��2@V�/w�T�@X�K�&p�@[QOpS�@]��1luH@`F�~��M@a�婫�)@c>�@d�ۜ
�@f���@he.�+�^@jO�1!;@lTޒG�@nu��|�@pX��OK@q���2�@r�Vc�6�@t;��@uaw�u�@vɽ���@xBDoo@y����@{d��~�u@}Ǝ9�@~��&��@�M�?]�@�>Ԍ�m�@�9�|$�@�<�Oy�p@�JD�SI@�aU*�K�        ?��;�̌�@�Z��N@8�e>f�@O���M�@`����j@k�Z��@t��!�&�@}"�}V�0@���_���@�KT1nz�@���=�6@��! d��@������@��K)���@�k�z簢@���TP@��\1�@�oc��%@�o�gkq�@���̀�@��9���+@�D�;L{@�G�Z���@�����@�.�,�H@�ސ�=3�@�\F(���@�����e�@�w��r��@�'��Y@��j�T�@��آ~Ʈ@ʿ����@�����:�@��^�>�@Е�\ ڧ@ѿ��δ�@��0�Og|@�9�w���@Պ�xD�n@���C�i�@�X�1	�@��kw��@�b���B@��}ӛ��@ެ�;mGq@�4�_��@��K�G$@�
l�a"�@�wj�ɘ@� ���[@�/���@�+�Ӿ@�0��p�e@�S¦�@�~���@�*E�x�@��G�&Y�@�B�o�3@�����@���I'�@𷥔��@�u邟o        ?�����Q?�P��CeR?�O�e�H�?���� �@����@lW;^D@!_�L��@(��}�@/�ќLZ@4c>�rRR@9XZ����@>�.��h@BmND�@D@E��pc$8@I@���I�@M�g�P�@P��+q��@R�1���@U�ߛK@Wjȃ�Ox@Y�`o&�@\�<QB�E@_E�(�}@a_�QM@bZ���r@c�X�Ͱ@e����\�@g�I�#�@h�T.�׏@jb�M/�@lT��@mӝ �!@o���@p�i�Q3�@q�W�ʎ@r���.��@s�s���<@t��q��@u�XDA�@v�����@w�^�!�@@x��㼢�@y⷟~�n@{͸��@|(�ӯe�@}S����@~�A�b��@�ހ�5:@�x��rݙ@����@��d�=N@�\�4�h�@���A<Z@��%!w�@�U�)	��@���X?@���T��@�clB���@���c@@�̀Z��@��ݽ"?@�=��f�@��@��?�        ?}Q���	?�'
�i��?�{�o5�?�L���@ �^�o@}\��,^@�y�	;w@����}3@#�>�+@(�|��R@.�%��t@2�%po�z@6�k\�@:�	���@?���Y�@BI��UF@E	��@H��9�@K@��~/@N����w�@Q?g̼�@SCBqWj@Uk@�QBV@W��^Q��@Z)����l@\��RL9@_}��@�@a/�fp�@b��}�l@dKȐ�S7@e�Jn	5@g�?ȁQ@i��eO"@kq6�ӟ�@mm���/U@o~�.�>`@pҒ���0@q��G��@s^R�$m@tMMN_�y@u�|�k?@v�'�!�@x-Q  �P@y�Xdl�x@z�i�h+@|w�߉��@}����@���$�q@�����@�qF��R�@�Oɟ5�@�5�·س@�#t�=$@�FΫ�@�����@��\>@�(�ݱ=�@�>�Ɛ��@�]�a�@��.4��@��wy�@����3@�0���C�        ?p3��֛?��FI?�?���VK[?�\]�A�V?�>r��N�?��=���p@ (v-ի�@���4@��~��g@�L�#/@J;�尙@#�wU{�6@)KF���@/��S�G�@3��øA@8={�@<�5�t��@AFE)(o�@Dl3z� @G�l���@K���@P'4�K�@Rzz�@U�O�	�@W���@[���T@^Y�=��@`��̣�@b�I��[@d�C����@g06�!��@i���"?�@l��+&@n��j�@p��q@rOqC��@s��8�@u���^��@wb�g��@yD���ۂ@{@u#���@}U���@��=��@��O�z��@�ZPx�u@�\1|/�@������@��l ?�@�r;;K��@�ꥢ�G�@�p��L�@�ME�ĉ@��:{�R�@�Sa�rXj@��TK%p�@�kx�n@�V0]��@�F�]��@�=�0�F"@�:��hj@�=�Xlrm@�E�>�6�@�S�1=;        @J62�9~@G�oM0	@gꄇ��@}���w�V@���<�@�Ԩ̵��@����/��@�<�|,�9@��[Z@�@�r�R`�@��moH@�(��~@�Z���b@�]� �!@Ǜt���)@���@����H�@�V��u�@�e�)o�s@Վ��u��@�����@�)S�p(@ܙ#9)��@���Pn�@��O�)Q�@�3Y�-�@�Rc)@��l�۴@�r6�!�@��~2(�@�vY�I��@�Ꞽ/@�V/TFU@�E�K U,@��[b�6@�֛$3�&@�?���W@�7���@��2tZ@�}����P@�ueL�@�r⧧�@�v"*��@�LT��@���td�@����5�@���J�{@��w�x�y@��'%��@�%�m��A )��&��A ��0�=+A^^�G�A�6�k zA�d���A>�{Z�LA���R�A����UMA4r��Y	A���=�A��B A=���A� `G�        ?�
L��?�D	h��?�SY�,?�KƐ	h:?����� �@J���Ϥ@�f��@"
CC�@SkzQ�@"�"���p@'i2���@,���-��@16�Asl@4��#*�@7i�[a<�@:�[`�@>�`3���@Asp��@C�Z#��V@F��
�@H�(H*�@K8�7�ˠ@N��n]X@P��8�;�@R0��Z�@S�z-��d@U���\s5@W��N��	@Y���a�%@[���%��@]��9��@`���p@a=j�@bw�o�_@c�7K��S@e�#�p�@fl�t�N�@g�<���"@iH{�s�*@jƍuWk@lOE�VL�@m�|M�ͳ@o�?Z��@p��|&�@ql�{��@rJ�DK@s-ӹ��D@t��?�@u��@u�;HI�@v�瀐��@w�(�q�@x�3�D*�@y�1�.�>@{:>��@|K�m&@}5N��ئ@~V���@|�`�2'@�TBSf�R@��
z��@���!W@�'����        ?;x6$�+?{�r�b�?�.\*f?��xe���?��{sh��?�n�Nf_q?�i36w��?�n!V��@ ���%M@DL�	Cs@z;̴�@������@�ސl�@ �����g@$��Zs�V@)=��T@.n@}Ç+@2%a�w�v@5o��]=@9��@=0�?��@@��W�~�@CSR"���@F/$+)�@I�҈u�@LD~AZ�@O����@QքǅX@S�x��@V9g!��+@X����E@[c�Ĥ�@^L���f_@`����,@bk��!�@d@�\C�@f9� ���@hY=�"�"@j���@m��k�@o��ɢK{@q>$�q4@r�e����@tP����@u�t�NX@w��RBK�@y���9��@{���Q'@}�M�K��@�����@�'�^��h@�a�7�b�@��%m=�@�i{��m@�m���@�瞙�+@�r 4ʐ�@�$��L;@��5�a�@�v]��@�"eW��k@�U�G�V@���)&        ?sd+��q ?�����?�.��'�?�N�!�n?��V)�2�?�[h��@ {P2�FB@ �$�@K8�@2
�\&�@��v',�@�A����@#��ۃ�@'��,˞�@,U�V�Cf@0ƚ!��@3��H�7@6�eI?E@:h|h�5�@>CC�i�@A;�i��]@C������@F����@H�O���@K�C٠T@N˻�fg@Q�,�e@R�v^AN�@T۰+�u@V줗�	@Y�J|�-@[o{8v�@]�eYo)@`;�i��@a�
�K�@c��ʀ@d�/؈��@f�c���@g�On��@itC:79@kB�V�4�@m'.,�!�@o!�J@p�K>��@q��V�z@r�R��ٓ@s�#���@u�-̫@vY=��G�@w�>���@x���[�@zBES��@{��p�$@}�:�$2@~��7YU-@��
Y��@���M~��@���q/T@�q�뮫�@�Or`-�s@�5�*��@�$O�R�V@��ݒ��        @0��"(@4�[s��x@T(���W�@h�-��:@w�4���@�I��w@�����Έ@�̀�@�'q�I��@����H�@��cv�Mb@����6��@��_�~�@�mm��1�@�0�`*��@�(��OX�@�VZiL#N@��M(8@��"��]@�JO��@ı�oU@��%x�<�@�= |�o@˹��j�@�Z��O�U@А:[��I@�
� @Ӌ�>)��@�$e�?U@��u��@؉���\@�V�1^@�3o�9@�!G��F�@���rl@�����@�%��[�@�;7ri�@�X�A@ 3@�}�ɺ��@�x���@�܆�k-@��S�6S@�Wæ!LR@��t���@��Z%�<@�E7F��@���J@�����>�@�9���;�@���U�V�@�$���@�t�y7��@�;�.��@��E�+�@��O����@��Y�s��@��ƭ30�@�dn[�~�@�F:��6�@�,*��2|@�Oe�ǫ@��p7�\        ?t�SWG��?�Č���?ˠ`G�?�}5ou�?�_��!M?�_�ʆu@^p�Dn�@�;��3,@.X;Y|]@B�08�o@!��!�8@$���3�@(���1@-6�d��@0�1n��@3~�w@6,!���@9� $Y^@;���+@?!�A�0"@A5����5@B��3q�S@D��,.�@F�6[�?G@H�U��zV@J�;e�I�@L��V=$�@N̍zl)@P��)�@Q�T�/@R�t'��@T��V�@U[
)�|@V�"lټ�@W��|/��@YY?tN$@Z�sZX�@\.�Gd�@@]����@_*��"�@`\R᝺�@a)���J@a�(���@b�\V�@c�B����@d���N$-@e���@f}�(�@gw���k�@hy
��X�@i�(��d@j���5@k��@[B�@lvП@m�"ػ:�@o�!�o@p!p.��@p�B��n@@q\���:3@q���6�@r�/˖�}@sO���ͻ@s�2ǅ��        ?Vu�,4�?�n�P�J�?�	򳦇l?�c���?ڼm|�e?�L�̢�#?�y���?�菈���@,�? @i]%{�@��I��*@�.��@��D@$���t�@(�x�ʩ@. 	k��@2���8�@5B|�r@8�<o���@<�&���@@Y� ���@B����@D�$B;L@GVF)h�@I�.��@L�B��X@O������@QW%�%p@R�.�?+@T���۵h@Vh(L�q@X@Lq0�@Z+`��h�@\(��u�@^7<��@`+5�~�@aB�@���@ba��x2�@c���o�@d����y@e���-n�@g#�S|�@he797y@i��%���@j�����v@lS]�PF�@m���z�@oћ��@pA��"@p�54�m�@q�w�/
@r|#��Ni@sC�ĩ��@t�=e��@t�x�xn9@u��'�W�@v�s]<@wxJ�̓R@xaS��,�@yP��D4n@zF�!��@{CH�/
�@|F�y�c�        ?\��?����o��?�}�Z���?�,z�1?ԺA�7?�w����?��[���?������?�W���@ s?��p@���p�@	���+q@@�p�P@����L�@�.�@��(���@��'��@!���Y�@#q0N� x@&>�8� @(񿺰L�@,�X5W�@/g��-Ʉ@1�NxQI@3u�1�(@5����£@7�y�%+@:4SkTn@<�e����@?��\�d@A;��$@B��3!�Y@Dwϗ]hs@F>?��D}@H!]`Q.�@J"U�Ӻ@LA���@N~�F�E�@Pm���b�@Q��MŅ�@R�qet�@T[&PZ�@U�-�j��@WO(�;�@X��	�}�@Z��p8�@\K�YS@^�$� @`�Uc@a4W˦@bƌƋ\@c*/�_v�@dQ	*��@e�)fc�@f����@hQ�Nv�@i���>�@j���C@l|�0�Ц@n|�@o�|I��@p�Yy@�@q�qNO��        ?�AS�v�@,K	�i�@MeR�o�\@b�HmrdK@r�c�ɨ�@�߇wB@�6:���@� n�oYr@����|�@����@���5,��@�lST@�]�IJ9�@�����@�sZ(�@�aN�Q�P@���.�1@�tlS`��@�)��擰@��|�z�@�t�N��@����;b�@Ìv�~,�@�-/@P@�ۅ�eW@ȗ]�f�F@�`�7�q@�7���	|@�?���@�

�@���^��@��!й�@��N�@�+CT,�@�C4�=@�`�!՟�@ׄ>�3��@ح��ɣ@�ݑc��	@�{��@�S*(у@ݚp	�$@���t�@�"��1O�@��/H�a+@���~�@�I��웛@��鐲@�Ԩ^��@�q�O�D@�v�]�G@�O�AA[�@�/���v@�ش-�@� �u0@���oO2�@��qT.d@��W�dΏ@�팘3�@���ٜ�2@�{�C@��gvf
@�j��Uo        ?�{r��?�A��j(�?�)��kI#@���2}�@�6�x>@ nR�,"@'��
�@�@0)֥|��@5�Xp��@:�9���@@Nu�x�C@C���w�@G<!?��@K�5��@OJőb�}@Qޙ.�(@T;KJ��<@V��[<K@Y`?�n$@\,Gt�(�@_#�=�@a&#�8a'@b�����@d����8�@f��S�-�@h��H�Ӎ@j���@l��� ��@oW_:��*@p��'8�@r>
4�r@s��+��@u��o&@v��̉�@x��GI�@y�%�K�@{n,�hL1@}-6�@~����@�mc���@�d����@@�d�Q���@�lƛ��D@�|��A��@����=|G@����P��@��~�T@�
��0�G@�@P�[}@�|��P��@����p>V@���u��@�W�)��H@�V- �Z@�5/�@����IW@�d����@�fyj
@��D�(�@���M1�m@�E�F�@�O/�^@��W��T�        ?�����o?���aq��?�Z�ꕪ(?��%'�Q@��Eq�@
�=�@����@�`k���@ ����*@%<�.�@*��]�\@/���9g�@2�?
�^�@62C��;�@9�xC@�@=���4$�@A3'�-�%@C�?I@F#���c@H�oeU�	@KՖP1a@OQ�$�@QH`8���@S2�|�s@UF���)@W���u@Y�|��~u@\}
��-
@_6�.Y@a��Q�@b�I�Qܷ@d/��*�@e�|'�'@g�Ǘn�0@i�G�]@k��]W�@m�_S�#@o���Ey@@q;H��@r<��]��@s{cp9�@t�YwҢ @v wcA�7@w�uӹ��@x�����@zw6�d��@| ��{P@}�Ƅ��&@5�����@�pCX�@�K��Oa�@�,ޏ.�@���ln�@���ne�@��k�Ĵ@��4íQu@� �+ �@���F)�@�)��H�6@�K�)�@�v	�r�@��&Li�@��)��        ?�M[��p�?�P�·(f?ܦ�:��O?����?����0�@	n����@���wJF@����t�@ �ӣ�5x@%>����@*:�ͷ
v@/��(��/@2�j�`@6R"՛�@:�"Pr�@>-��@AZE�0��@C�.PY0;@F�#�-n�@I��J���@L�bim��@P&��Τ�@R���*�@T,�;i�@Vr�7���@X��� ��@[����W@^o6՝�h@`����@bb�B|y�@d �\���@e���F.@g�'��@i��)Z*�@l.L�@nz�{?@prǞN�X@q��Z�}@s���"�@tq��y�@u��97�@wl�.� #@yb���@z�a>Cu@|d�O>�@~0.Fvq@����f@��2�'B"@�������@�WV���@��)a�@�7�}�@�\gx\X!@���uל@��"�3��@��.Ի@�Ozv��:@����H��@��b<��@�it*�@�m�QJjx@�+^W� @��b_��        @.��$5�>@c �)��@���?�v#@�c���x@�a�b`�`@��X�oV.@�X�;O^@�6��A@�nyT�(r@ŠB%@��@�-�@��L�@�'vJ�w�@�����x�@��
�aa@��0�@�I��*�@��N�RJ@��4O��@��QK@��v�G�@�Ճb�@�02W
�@��;�ܠt@�5�ȟ%�@����Z@�,��f�@�ʟsV�s@��h=��@�LS�ԇ�@�0Y����@�+�p
��@�>cVZ��A 4)өj�AT���"A���KDtA�}K!�PA �#<�ARʊ�QA�6w��A	!o&_�A
�_`F�A'�z?A���j�/Ag���A�A)?Al��L��AQ�#�|A;��V�A)��2A�|[KVAZ�]̴A
z��8Aʀ?�2A	|��A��jd�AK����A�l�6A�: ceA&l/ �A35��A  ��*��A �?E*�        ?zR{����?�h�`� �?�KKY9?�HH���?�qP��@\{�r@R��⨠@]��%1@c*�t@ T�"& �@$t���$@)f�̡@.?E`���@1�����@5#U���@8��p⓫@<i��OP�@@H�aӨ>@B��h��@D�d���@G��h�?�@Jh��Q�2@Mclĝ�@PEM}��;@Q����a@S����@U�;K�:n@Wn�'���@Yp�]q��@[��^:|@]���/�@` ��4@a/���yB@bi���T@c�L��h�@d�~��ƀ@fZW���R@g���,.�@i/��}�_@j�����m@l.~��!J@m��,�P@oW�
�O6@p~�"�@�@qV�` �y@r4�g�7@s�����@t�✝�@t�j�X��@u�^���u@v�e��Փ@w����@x�2��@y��N���@{a�A�)@|,�W�G@}MX��'�@~uP�Z�)@�L�Txe@�mI~ɼM@�1�S�@���M�{@�U�@qB`        ?�f<A�2�?�Y��]��?�}�?�&Y(�}�@��h��@�=�r�@��7�t�@"�M��i�@)�\\q@0?;/@4um�fw@98	�b�Y@>�˯M(4@B@B!�+�@E�N1o@I'���@MF)�X@P�ϥ}Y@S	1�_~q@U���EA@X@@[$�]���@^;��O @`�L��G(@b��R0�@d]K�xp@fRAṘ�@hb�ҋ@j��_� O@l�|�Abh@o67�!��@pن
lTm@r%w�sIZ@s~��t��@t��g)��@vZb�1L@w�8�DVh@yk=ie
�@{/{Q+@|�Ƞ���@~d�ԗ{j@�!�3�@���`��@��ӎ\,+@���{~w@��Ǟ��@��u[C@���y*@���{QN@��b����@�Tt�0A@�<�x<A@�gˆ���@���o�`@���`�K@�gD!��@�2���@���T���@����>X�@�>����a@��V�f�@�����w@�s�w�E>        ?b��ŷu2?��m-wz?�HA�G�^?��,��#?�߳�,?�?�d5?�B�AZp@'WH@H4�8p�@��-�2l@��Ͽ��@�$x�@#�S�x0�@'��|��@+�I�Jl@0r8�=&�@3%���@6��Ժ�@9^�P[�@<��IV�@@fL�ַ@B~�Kd@D��ʿ<@G/�
�8c@I���e�@L�����@O�8�(��@Q`-�u��@SN1r@\@T�A��cV@V׿�J8@X�l�^�%@[�,@]y�����@_���M�_@aP��o@b�D�_e~@d7���>R@e�P����@gx�s��@i;;WQ�l@kQ�Z@�@m	���wD@oͮ"�@p�� �R@q���)��@r�A��|�@t�A�u@u_dƯQv@v�M�T��@x��c�@yu�2��@z�&���@|rBD�@~�1�@���� �@����u�@��ȥ�Z�@�pR��G`@�^oO���@�T:����@�Q�_3�@�W^���2        ?���{��z@5�d�<�O@V?K~G�@k�`4�g@z��4q@�
��>��@��W��6@�6g4*@��opV@���Q�@�+Z��i�@���j�e@@�����@@�5��"�@��H���@�i.B,֥@��p��'`@� �Q�@���re6@�߬7��@���e�U@�?ՃM�@���՚w@���+XU�@��8��@�pK�]@�J��9*@ܘ�;(�@��
M��,@��N���@���yg�@�h7��@��Ӛ=�@�D3�n�@��w�-�@�RQ�݁@���aq�@�8��z0@�>�I;�;@����f�@�߰��Ǣ@������@��c�N6@�s�81@���V@��N�Ԓ�@����t�@���eP?w@���6PǏ@�Ս.��@���dU�/@��Q�&@�8B��;�@�d>a\�8@���e���A f���i�A!ۿ��A��ȣwAL7VA��6�`A���/��AQv?��A��z-        ?`����?���!?����eI?��n�?�W�&��M?�Z+o�x?�̯?�f?�ǃ �X?�Y&6�@�oBx@�v�@�U��U@���8@��~ط5@�WX��!@�N����@!#S�)@#��>H��@&����@(�x��@+��z��@.�-�%�z@0�c�v5@2��0Gȱ@4^���ǡ@64Tl���@8�{K�@:�#��d@<2�"�IR@>]<jN��@@O%��P}@A{���C@B�f�Q�!@C�`j�K�@ED!jKj'@F��*i )@H�$�@Iy��ux�@J�b�R�@L����T@N$��y7M@O�EL!S@P�^}Z@Q�U��b�@R�r�D��@S��M�i�@T�+�R�@U�-,QZ�@V��F_�@W�{z�@X�-"�|@Y�(�"=8@[)��D�@\e�:$�@]�Ig��@^�8Q���@`,�$�EA@`�b�m/�@a�#�Ѭ@bZ@-�@c F(F�@c��p���@d�+ �r        ?Ȯ�Q?_�ј��v?��xu�2?�"T�E�?��I��?���-���?�Ļ��P�?�0y��
?�?J�ŕ�?� ��t�@?�x��Y�?�d)ɹ�X?��6TiY?��1�ǹ9@��zn�I@UfHp|@ی�u"o@��Kh@�Qp�&@�~w@*�n ;'@!�r�V�@$H�F#@'AI|a�@*} e��@-�j��%@0���R@2�Pރ�{@5���o@7r򵙞@9�Y�ͺo@<��kxN3@?y��|��@AA#�.@Bݧ��m@D�>���@Fb�D3s@HM1���@JS��*�@Lw_� :�@N��[-$@P��4�#a@QѤ?:S@S&��c؈@T��9���@V�e�G�@W�� Ŭ@YH��E�@[	.�CI�@\�!7���@^�7�n@`l�5��@a}�R���@b����D@c�5�B��@d�Xw�@f@����@g�M��D�@h�'���@j^f����@k�5e�@mb#��@n�w�)"        ?:(�O�?qX�U��'?��..7?� :O��9?��;���?ƀ�J	��?ѯ��d
?��36��?�2<��?�kq"n��?��d��?���f�Q�?�D��q{@ r���@^�q��@���@l��3e@h�S�C[@%;:@w�§d�@j���F�@"�ǰ�X�@%��>AJ�@)3LX�@-��� E@0���_�[@3��n�@5��q@��@8�c��@;�>M^�y@?�S�kw@Acq�,��@C[�g��@Ex�y�$w@G�`=\��@J'wd@L�NLvN,@OwH��Ǭ@Q/��T@R�&$��p@T[��t+@VGc�?�@W����u@Y� uo@[�We��	@]� H@`si���@aD�&F�[@b~H�BV�@cƍ^~8}@e

��@f�S�T8�@g�l�Sv@i��!@k!�!\@l���K@n��&f�@p3�O��@q)�}ɬ�@r*�aD�@s7�)�%@tP�*� i@uu���*        ?��+�wp@
��bn��@+��Ÿ@A���o@QT�~5
#@\�F�#@e�3�$E@n� ؅c@t�/T�bu@z�	p��?@���A�@����[�@��^`{�@���e��@�l�K�@�;��
�G@�;�;Nf$@�k�)�.@��c��@��G�2�@�����@��Z����@��>��Y@�݅"�m@�*�����@��C�L+@�	͐�z@�W����q@��g�~@�����@���"��H@�/�k��@��c/rL@�Z���@��^�@���(��@����LN@��JK�"�@��m��n�@���w\�@����@�@�|-}RK@�Lʦ�5@ǆ��ke@���u8�@�,�PM@�}����@��
��N^@�`�mKh@��j̊�@лji���@ъ����@�`�Sj��@�=l��H�@�!f�@��c9�C@� 6���@��ʓ>_�@���O��@���E�<@�"�v�$n@�A��.T[@�j$�Y�        ?�seKP)?�3�};�@ӵǥB,@#��!��E@1�)բ�@<���`�x@D���h۝@L���@S��&�F@Xl���fT@^dDHD�@b�.�J�@f)�̿:F@j%�y��@nwPů��@q��A��@t�FfD�@v��h��@y�JC_�@|y���O�@�-�J�@�o�Vu�@�&D��y�@��Id�t�@���X	@�@���L,�"@��H>��@��6��9�@����@�����x�@��S��@��z���$@�8�F���@�}j��[�@���-�@�!����@��o��@��U�Ɉ@�]����m@��+J@�_��׺@�wO�-@�C�����@��'ʐ�@��|�E#M@���ֹ�@���(<m@�������@�q�NJ�@�_y(|B@�Q"���@�G��g�!@�B�.���@�B��	�@�E�e C(@�M2qM@�XwfP@�g��E@�=u�E�I@���0�@�VG��)@�兎��l@�v���9        ?��m��9%?����CN@L�B�Ns@�>��@@&a�Z��@1���e@9����@A�cW�J�@GR.�KAC@N�"�ޱ@R�iX��@W6���n#@\�&�v@`�[i�@c���٣@f��MS)�@i�-
-�z@l��o���@p7B�!4@q���h)�@s��-�)@u�U��P@w��E�I�@yj�j��@{X�����@}M)&S>@H�E�L�@���-Dʪ@�����Gt@���a@�����8@���֐5�@��U*$J@�7t]�@�*�_N�X@�U#�Fg@����@��l��@�����@�P���_@��DD�.�@����F@�>�n�'@��M�N�@��L���Q@���iM�@�i��V@�G8����@�+ü;>f@�(�*�>@�	q`H�@�c^g�@������@��jJI�@����А@�!3'o�@�9���c@�X�?\a@�?qj�@��2@�p,\�M�@�̃Xo@���&c�        ?��mP�.�?��liDO?����yD'@�D�-6�@ �5���}@*��ک�k@3�jw��@;��f��Z@BK:���@Gm*��X�@M1�\zg�@Q���b
@UPNe��Y@Y&<f9�*@]N�j2�W@`�ӫ���@cO����@e�v��"�@h�ے��-@k���HO�@n�E�}��@q,ԣB�@r��#e�j@t�\�v@v��(�D@xѽҗS@{���@}S��B@�YC�M�@� �lc��@�p����#@���\�ޞ@�;	_�@����&�P@�>�b�7@��$K�@�|��.��@�2͌��a@���)��H@�g���D@�[{��ݺ@�XJ��s@�^n�-@�n@�l��@�����$@��F+A@�ڎ�2�@��eۺ�@�W�F�@��?���@����d�G@�a�$�`@�ί����@��F���q@�dE*��@�*:?�@��dV�D@�ī�]�F@��	%���@�r$QOQ�@�PI���@�2��wz�@�b㉳:        @P\$y%�@�qj�i�@���}t�I@��|�䓕@�Z���g@��{@�p��D��@��kG0w@��n��7�@�-��c^@���t�@����C'.@�y���@��ۥ��A ���lA�N<y��Am��V�A_]��A
�溮V�Aʋj?�Ak�����A�z��A�>u��A^1=��kA#��,.A��r�A�Ӷ]�A�κ܈AӾ
ݒA r���c�A!�-��p�A"���=�A#������A$�6��fA&	�렎�A'<6﯁�A(u=�<yA)��'��A*�ma�ZA,H�±�
A-����A.�����A0-�7�7A0ᮊ��A1��q�N�A2U^yƍA3h�kTA3�ٚ&�A4����}vA5e���!A61� ��A7VC?A7��G��A8�5�Ľ$A9���x��A:\�nE�A;:�P�gA<y��71A<����ltA=�!�iyA>��_���A?����A@Sy�+�        ?~�c����?�m�K>�Y?���?�q�?�N�"�p?���)�{@	S��<@�n��1@� ���@!�ܗ.@'8^x(�@-?�HD�@2��=�@5�y:��@: p���x@>�l��?@A��PE/$@D�n��u�@G�_��@J�#p~�@N�$��N@P�XM��e@Rǭ���V@Tђsp�@V��q@YAa�J=w@[�	C� @^1� ��i@`n,~:� @a�赈�=@cM�!ds;@dؖ����@fvK�c�@h&���E@i�:F�pG@k�_Ŗd@m�<~�'�@o�ڤ��Y@pٮg%r0@q�~��@s�gq@t)}�G4�@uX*����@v�W���@w�L�뫁@y$@���@z~U�J:@{�^�Ȯ@}T.4;:@~�=k'�r@�,Vd�o@��7�yI@���5�}b@���1�@�|\��^@�blxc�@�O��(@�D��P@�B���,@�Hi����@�V֨:��@�m�B�;@��$��k�@���X/�        ?Y��(h�?�G�mv_?���y�?��r��p�?��t��m?��o %S?�-��}�@���QM@1z��7�@m�a:@Ғ5�W@W�Nȝ@ Z\$�>�@#��~�@(�/�Ϸ@,�J�?��@0�(-�m@3�U���N@6�զR-�@:I�k@>��q�@A��zu@CE�SP�l@E��)��@HUMMY��@K5	yNG�@NU��׎@P�y��p@R�E���@T���8hN@V�2�]_�@Y6 n���@[�p���@^fΫ�@`��N[�@b)��[΀@c��گ$@e�y�ho@gWO[�+@iEx.�m�@kO�On�;@mv�-K?�@o��� !C@q�>��@rP��+?�@s�[�{��@u���@vvy�2,H@w��M�=2@y�>�ZS<@{4)��K@|�M[�@~�e�ށ@�H,�jok@�>�x��@�>���
e@�G��`�d@�Y�mm=!@�u^��5�@��E�jV@�ȚҕA@� p�}��@�A�/Nb$        ?N_� �?��k��	?�?���`?�U��b��?ʳ��>�3?�{5���@?��
�~�?�ujؐ3?����ɽ?�9�(r"�@!��^�T@�l���u@	�g}@;�[E�~@"����{Z@($`��@.�p!О@3P�	�@7�p&�j�@<���̓@A]����B@D~�[���@Gً��"@Kc*���@OX�f@Qko�W�@SW�ul	@UG����W@W:�G�@Y.���L@[#(C_l�@]���@_
ϘcJm@`���Z�@az���' @bw�)b@cw���H�@d{��6�@e��{m�@f��~��@g���o@hֿ��i|@j����@kD!���@l��XG�@m��*�@oO1���@pb�Je@q%S?U|@q�3T��@r�c�dx@s��3c��@ty%����@ua;WA	�@vQ�(!��@wJׇ���@xML7���@yYj�p�?@zo�\r�@{��)u�@|�OQ|�@}����7@.���[        ?�ɉv�A@1>��*��@Q�Ҁ�J�@f����q^@u�Tج@�D*˧F�@�y� jh|@�Lj>���@�ѳ�7��@��-���@���p`�@��:ytn�@��O�@�~��G�C@���n x�@�Rs�M�@�2�p�&@��,���+@���O�3�@�_0�Yϻ@��~J=��@ʴ��ȷ-@͠����U@�\�%Q�*@� ��Or@Ӽ�����@Ց��I�Y@׀�!��@وe�T�t@۫}Սk@��۳3��@�!�vg��@�\�hW�@���v@����A�@�bq���@��_�xg�@�W,�!p@��d���8@�z�6hL@�4���_s@��7���@�_̌�>�@�N�1���@�E��玊@�D��E@�L��v�D@�]Ƒ�@�v=�F@����I�'@�Ă��C@���{A� @�;Qᙀ@�����<@��y=;�@�Bv&��A Y���(A�V��#A޼��<�A��6.1�A����A[��z�LA>�6��        ?����5i?´i�:��?�y��T?�I�W��@Ŭw� \@
@m�h�@�Qt|�@ ex��@%����s@+���i�
@13����@4븘փ�@8�i��G9@=n�2�@A'�9ݘ@C��*���@Fq���P?@I`��d�@LzS�%@O���Y3�@Q�Q�ͮ@Sc&��� @UB���_�@W5��@Y;�d�@[S'�+@]}�rk�@_�- %\9@a�6�9g@b5"�n��@cn��g�@d���&@e�����@gT�4�b@h�G5ɠ@jM��~@k�Ձ�(�@m��7ۄ@n�
��@pIu��@p���Ui@q�,}廣@r���7�Z@s���?q@to�(L̛@uc�XNc�@v_����@wd���@xqc$�@y���y7�@z�&}�@{Π	�#@} ��q�@~<�V A�@���@�i_h�G�@�y+�֘@��˃�Y@��zS�{�@�=�6X�@� ���!@��H�	l�@��`��8        ?s@$)l��?��P�qш?�h�$z.S?�+��?��0%�&�?������@e�z�~@�o�r��@�me-�Y@�L3�\p@��=Ws!@"���Vn�@&������@*�}#�H�@/<ug�,@2��e?b@4�D'n@7�҃a�@;I�n.�@>��r��@A�4��A@C��h���@F460�9A@H��H�e@Kʤ��@N�)�u@Q.e�`2z@S��*Ί@T�2�
{�@W*{�z@YE'�ܿ@@[�ל�_�@^�n�Ł@`R�!�@a���r�@cu��U!@d�a�f�A@f?��@g��)�@iN���@k�M!\@l���YF@n�a\��R@pF�����@qG� �l@rTM����@smG7�g@t��t��@u��U%�E@w$�Ȕ�@x^^�]$@y�h[���@{5ղ��X@|��Olh@~T����@� �l�O�@��gT'�@��7��E@��!6@��U8�_�@�����d@��P�<�r@��`�        ?v��r��?���L8:?��?��<?�H�(�?�~��A��@ ��0�a@	Ȏ�y�h@zM.�`@|���q@ j0�?"@$�A儞�@)�
t�@/f0�@2�u��`@6K<�:=@:#���-�@>b;��@A�3��&@DJE��@F�����@I�Ù�gw@M-�nz��@P\Kɸ�u@RC�����@TM�b��w@V{����@X�+����@[E֏���@]�5y��@`T_b�bG@a�晇)�@cUݰ'�<@d��0��@f����@hui����@jVs�˽�@lN�����@n_�_��@pD�W�� @qg%�[Z@r��2�Z@s�Ԝ���@u'�Q�N}@v����m]@w���]�@y|��@{K�:��@|�f�L�0@~t�\�~@�"!�<�@��n��@���g^�@��	K�u@�*���dn@�I�9]@�sڼ��T@��lPa�J@��s�gZl@�C��u��@���s7�@��I,0@���� �z@���T�        @
���J�@@G���*@_Qdu�J�@s]<晫@��kw�H�@�U+}�*�@��Y��s@�?�
$�@��e岋@�az-��z@�`^�(!5@���;o�.@���/ͷ@���r͕@�9�u��@§`��B@�?�#4H=@�š�@��1��@� �5@О2�6F�@�OR�e1@��Q+�@��e�@�Ԑ�0�@��+�:O@���Qr�@��k�@�_��I�@�@��4�W@�o>�0-@�^�Eu�@��^]_��@�5U��ŗ@�dW�&B@��X)#I@�V�t_]E@��/B`}�@�M6:a@���)�<@�9��-�@����x�@�殠��@�� ��@���o�@�����@����e)@��C���@��F�ޔ�@���0�@��(o�;�@�
��q��@�@!n��(@���5�� @��"�@EA s�A2A  88�Ay]˓A6P7O7A���Uz�A�!?Uq�A��C(d�Ads#��*        ?WxF��?��vZD��?���4�?�*U�'?���^JK?܆��ћ�?�y"��^?�i���?�{���؟?�}$c
�@ �_���@yo�ˉ6@�*X
�@r��لr@P�`��7@%.��@8�H�{�@�Ԕ(�@�i.@ � �<��@#e�.ޣ@%.\��W0@'w��N��@)�gKt�F@,ec�&�@/�܂Z�@0�d��O=@2R-}�f@3�@�Qm@5U*C�@6�1%�@8�t���@:6n��!p@;��@=�_}3�@?������@@�F��4#@A�_���l@B��ZGU@C�v�j�@D�faT�2@E��3d3�@F��G�@G���S@H���@Jgr�@K(��L�@LS��ƈ
@M��8���@N�C�6��@O�4wt/�@P���*��@QB���1@Q�0��Z@R��mR�@SF}��t�@S�q�݀�@T��}U@Ui�)��#@V'���@V�>R�@W�C1��@Xu�=��        ?:�R�x??{T���#?��*���5?��#,��4?�4���b?�\^W�zo?�b��]��?�7�:�?���P�z?��\��*?�q��V�@9���Jw@��D�KV@
��K���@I�"6�@��ʻ �@��j�;|@�TFK��@ _	n4�m@#Z�ݰ�@&�Q�2�@)R���@,�U��W�@0_x!~I�@2u��4�@4�cI/�_@7 PUn�s@9�y{�@<�����@?ys�t��@AS���E@C �ɗ1@D�W7��@F��2~!@H�ݷ�	@K T'!�@MSG�b�@O˓	�@Q5�/�9w@R��/�gA@T��_@U�ʃ(��@WKu]I{@Y�E��@Z�f�C~@\ڥh3D�@^��H�)@`�q:���@a�nQ^�i@b뙴��(@d3�;"�@e�"�N�@f�|��@hv��X�#@j��Սd@k�V�b@�@me!��#@o2y�&I@p�f����@q�?�'�@r���`��@s��X��@t���B��        ?H�u)�v?s�k,R?���6�?���`d9?����<�F?·�K4�|?��ڗ�¹?�q6�?�`���G?㆜ӕP]?��P�6�?�lKO�M�?��X�Z!7?��c���?��X��K�@d�
��@r�He��@'u�X�@��c��@�඀�@Ͻ\0@�;i�l�@ ���hc@"��^�H�@%ib�m@(���'��@+��N?�@/�r!|s0@1�����@3�Vja�@6H]�X�@8��k�@;}�-��@>b���@@���h[@BfNV�V@D*�訋@F]@C�@H+����@J1���Q=@Lu�x�O�@N��7�F>@P�w}�@R|���@S}�/�W@U�7��@V��q��U@XOC�1��@Z���?�@[����G@]���r@`�(���@a(i�@bR7>��N@c��3��@d�Gp���@f)O�@��@g�?����@i��$ۅ@j���ӈ@l)9�_��@mԡ³�m@o�{�n�S        ?��[����@N�~vPW@&�H��u�@<��܍�P@Lv^�&��@W���X|@a�}Է@i���w+@p�5�Ԍ@ueqŤ��@z��@���@�Y�W{@��)�@�Vt����@�`C�L�@��0�N��@�N��.��@��T%��@������@��^��ڻ@��i�b{!@���)K��@�v�@�Y'h��	@�Q��	�@�_3 r\@���_"�%@���%��@����.�@�����1@���}T��@�G��@�S�I{��@��d¡��@����u�@�>��:��@����Y�s@���3�p@�f䊭GF@����Y@�MnMl@�d�'��J@�&���W�@��G2I@³���?@�TGKp�@�Ncw�F�@�!
g�<�@��s�ûL@��Ο!�	@ǰG���@ȓ��\�@�z"�R�
@�e�*�Z@�U�U��=@�JaN��E@�Ct���@�@���\�@�B���?.@�$��˭
@Щ㙗�i@�1Z2���@ѻW2��        ?�NM�'��?�1XVS>?��#` ?�,����C@����k@:�P$�|@d��p@#�l���@)�2 ��@0vt C@4]Ki��@8��Cs,�@=E3��@A!�5�@C�&z@F�/�Uj�@I��m��@L��(�H@P/w�P�@Q���55@S䡗2X�@U�e�].@W�׀I�o@Z-�Q�X@\wx���#@^�fמ?�@`��Yڲ�@a�?�A�@cHt9@d� �x��@f4G�][@g���$K�@iP���@j���IC-@lPly�X@m��	��@o�?πB�@p�a�~�@q��E(5g@r��#�=�@s�!)��@t�m���@u������@v��[�*�@wͽY�,�@x����D@zv>���@{>�j��@|q�� �=@}�S39<�@~���Np�@��T�S�@��|md�@�me]B'H@��.e2@�ͦ��s@�����x@�<.�'qZ@���y2T@��xL_�@�}���Wj@�FPM�@�*p��        ?l�8�!E�?���	?��c��m?ܕ��H�?�j����?�t֤U�T@ �bX��:@���t9@�= #9�@�Fp���@�����f@e����@"#�i�/�@%�$��3@)�zY�e�@-�;���@1b"O���@4����&@7aCރ�@:X��e��@=����@@�+�{�@CL��X�@Ee�nH��@G�ʋ���@J���<�@M�t��X@P]m	�\�@R~�,Fs@S�8=�P@U�*s@W�#A]�@Z$=���@\ᤀ�@^��E8�\@`қ4�8@b8�UjIC@c�l2F��@eABF�@f�&�9�W@h�d@��@jw_2(��@lf��z&@nq����@pL�>0QK@qp��r�@r�����@s��*@u@�9��@v��=_��@x(���E@y� ��D@{au��X@}�S���@~�����@�m�G�@�l��J��@�x:���@����{�@���KB*d@��q#��y@�B}~�^@�W��G        ?yx�����?����&�?��T#�H?ݹ��F�*?��\����?��8@R��@3x��x@MSs��@rdS��]@�=���i@�pl�_@!3�ݜ�@%%(�YL@)���B@.���)@2$h�H@5D�)��J@8����@<�<gt�4@@Y�@B��[<�@E%�O�@G�C6	v@J���XM@M��dڍ�@P�����@R��e��@T{E�/�k@V���Yŵ@X�Ǡ��5@[5�_`�*@]�����@`0��o=@a�F�#N@c�a���@d��^&@f4���7�@g�Ѱ��@i��1u�@k���&�@mn�3�@oqLּ|M@pŐ�ϱr@q�6�F�@sey�|@t4n���m@ur�-��@v����d�@x;���z@y�G���?@z��Q?	�@|���g@~zp�@��K�]8@��l���l@���LH�@��9���c@���J	�@����^�@����+@��I�ҏ�@��?���@�/1@%��        @ˢ�G�@C�@K�@b�CJ�q�@v�����@�4&�MG@�d� B�@�>��h@�#�3�>@�gO�-'@�BE�	�@�V2=��C@��w���@���
ӿ@���N�@@�`�0��@��zb�@�����n@�|�@�@��B�@��s�K��@����2P@�cV�)� @��@|P1@ԙm�H�c@�L�0�Ny@��'n/�@��-&� @��Kz�)�@ݶ9�@߸$�F6@����p@��_�G2�@�(-��@�2�WO.[@�]�mҪ@�:	��C@�ϱ���@�aMV.:@�fWM��=@뿥�À$@�"n^�U@���{<@��j!��@���w�Ck@�)�s�@�R�Y��m@�"�<h�@����[p�@�ѱ�!�@������@��DbdN9@�~�@�bL@�l�wo��@�`F�0,@�Xʔ��@�V����@�Y��c�A@�b h�@�p��i@�����7A N��<�{A �Q�S�Aq�E�f        ?�L�Zg��?���!,y@���^�@>ec��@%Q��/��@1 ��mC@8�ol��R@A!S��W@Fs���h@L���D�5@Q�jՃ`@U�k�gEj@Z<��Xw@^�b �?S@a�S��K�@d�/�{��@g�Ytz�%@j�f�Ԏ�@nE	r��@p핦Z�@r҅r~�@tѨ&�+@v�^{�g2@y�x#y@{o�p�S@}�;ͦ�@�/��Mu@�,/Ō�@��#{U��@�I+���@��y
��@�L=:޼�@��F#k�@��K���@�@RE���@�	3��@��x�԰@��BsN< @�ڇ�R�@�܂�M��@��8"��@������d@�:.��B@�2�;�So@�\�>o�@��dKL��@�ʌXCV�@�kK|S}@�[P�`Z@���Щހ@�r'�fq@��p�O@�s/�rtJ@�/�kx�@����_'@����� @����%��@�O���u�@�#C,���@���v�@��z�o�"@��-F�r�@����;D�        ?ts��2�;?�)�/c�?�"$~�?�"0�|?�.e88�@�D9s�@Z�+���@��JW@ �do�@&YO��@,����"�@2YQ
��@6�N9S+�@<I0��@A> !A��@D���ٻ�@H稢*��@M�{�4��@Qp�r�t�@Tn����r@W�顾�"@[�~��|�@_����j@but��@d�d��'@gR�v��@jE�և��@mwK:�;A@pu%�~d@rP���ao@tP�`��@vuQR��(@x�d��@{1y�A�y@}��T^��@�D��ͩT@������H@�@�F'H�@��׭F�f@������T@�W1��]@�3p�b(�@�$f.���@�)��X'�@�!>u��@�7lt��@�Uxm5��@�{��H�@��y��1@�ܳ(]�@�13K.�@�U?T��@����,+�@��ѐB@�3I5Tw@����`��@��y�4@�"2��/@�ա���@��un�@�Ex(�@�@��"�2y@������n        ?��?i+F?ѻ�Ď'�?�փ��V�@X ���G@7Jpز@fL��m@'fH6K]�@0b����@5�N�s�@<s�X @A�p��z�@F@86-6�@K�
�@PA-��C�@SFJk��[@V�Ě��@ZL/��p@^T��Ѕ�@a]� �3_@c�8���z@f\ɸ�ѡ@i-l��F@l7�;1c@o.d�)"@q�ג��@sg])�@um[�uJ�@w�9�]N�@y���Z�L@|[�*x@~����M@���%��@�W�`�O@��A��!@���\h@�F($��@�U�t%�@�kj:�/@�"
)@�.�Lđ�@������@���7�(�@���Oj�@�\w[��7@���f �{@��B�dU@�v�QgN*@��?��&|@�sYe�\�@�IR\�@����Ro�@�+΢?��@�|f�@��ܚ��@��r3�T@��G�jG@��PA%�K@���23;@���}l@��U��_@�0��wz�@�]9��@�@��Y��x        @4[Y�KY�@h��3@���<GH@�x���Y@�B ��@�N�~�@��>���@�NS�N�@�n���OD@�>��=@�@�^*)�@���[�@�� ��8�@�V.�a�@�K�6�@����e"�@�`�Y�"�@�r��&@��@�2�@�l4���@�ӈu��a@�&{����@���wA��@�'i����@���rY	UAQ���A��m��AM�4�� A���șA�R{c�=A	AE�~>�A���f[AᦳU��A˟ëm�Ac���0=Aj,�pEAy��=5A�t�=Z�A����"Aڌ��A�5k�?AD�9���A�?B��GA�Fc�A"���cA~P����A�s�ΔA '�\��A �s��A!��i��pA"e
����A#,�e�n�A#���G	$A$�M�Hy{A%�(��A&wRQ�PA'T}���A(6O��.)A)��{θA*P����A*���_A�A+�aip�A,��|~
        ?|���B?�ӧ�%?�!�c�=�?��D�!?�9��|��@�s����@ˢp��@�ڻoc0@!Y��d�@&����~v@,y�����@1�9�~a�@5G��qq@9_'�)J@=�*�w"@A[�*��:@C����)@F�9̝�@I�:�Pb�@M#��5��@PO�e��@R+��i��@T%|�z�@V>^�J�@Xv�_`HE@Zϵ���@]I����h@_�G�s~�@aQ�5V�N@b7[��@dENɶq�@e�q��6�@g�C�jTM@i<�aH�B@k
�=H6�@l���~@n�Q���.@prB���@q~(�z�~@r�0͕�q@s�A�|�@t�i�W�@v;u�b@w=I�(��@x|l����@yÅ����@{��a�@|i�/��Q@}���%?@0�S���@�P�zƍ6@�nf�ͷ@���u�4�@��*�kU @�_��|@�/#�I.>@����.	@��ם�^�@��-c�y@�����a�@�vZ���@�\Yz��@�E�1�        ?Q<�br��?� ts�P�?��&�Є?�)�Q�?���ס��?�a�0�K?���*�?��ƏE�@_�z,,@	�
�r�@�u�e�@m\�u��@���Z�@ m�<hK�@#�f.�5|@'�?.@;@,J|_E-�@0�ŻW@3\:>E_@6c'��w�@9���!��@=Z%p>߈@@�a|�@B�I����@E(v�hWB@G�h�<��@JoO#�}r@Me���{o@PK�ྒ@RĻѱ)@S�B�r�2@U�:<ӓ�@X ����5@ZKU�u�@\�~����@__	��km@a�Hk�;@b���z�@d)�-yǉ@eظ��T@g�7��@i�<��o�@k�3L@m�ܽ
�@o�P�f�@q�6��h@r\�w�d@s�*��x@u�2\ @v�t�o/�@x���v@y�Q�)'�@{M��)�@}��~@~�v1L@�P���@�C�lB�@�?XOSg@�C/�s�"@�O�����@�d��� �@��p5r�E@��	[2�        ?��_�d,?�3S��(*?���SkW�@��7�N�@n�\RX@'�(�= �@2Q���^�@:�1�yo@A����p�@G,az��@Mu�	e@RO]��o�@VX�qI�5@Zܛr(�@_���:�@b�.���@e���[`�@h�GE
�@lp����*@pQ잠�@r���Nb@t=f��c)@v�h"
,�@x�d_Ǎu@{o��9�&@~�R|�Y@�u����@��:�>�@�~d�a��@� ɹ��@��;�� @����[�@@��K��A�@�|�I�`@�����@�[i��$`@�}>�!�`@��W:�}@���XF�@�3���7[@��b���@��[�b@�iP��i�@���n]@�����l�@�$���n�@����k�@����ݏI@��35���@�����@��KY%p@��j-}`�@���	���@�ƹ{� Y@��/�X��@���@�>Nj��@�y6�fL@���%�@�G|��@�d��y?@�c|tv�@�����        @�A�'*@HT9y��@i"��qc@�1��1@���d�֘@�lc���@� �g-��@�?�4<4@��Z�UtX@��� ���@����5V1@�����S@��y`��z@��� y@Ϟε��<@�>�V5@�ՍZ**@ז�t�@ڀC+��3@ݕ��<i@�j�6e�r@�!.��DC@��t^�`�@���rew#@�Δ3p>@�� m��@�����;@�R����I@�Xu�l�l@����!@�ޢ�W�d@�6����.@��M��{	@����@��&��
@�,���(@��m�e@�������@�C����&A �Y�0�_Aw��9��Al��N7�Ag�O1�Ai%dִgAp��@A|j��g�A�/���A�X���A	�	�s�PA
�}�F�A�+�qA;�	A�*Ap�S: �A�q���Aw���A�w	��A�S�iAjS(^�<A�\SE�A�T@W�}Ash�`�A$����A�㮦Ng        ?�� ٜ��?�;k	�o�?��`��O@�2���@A\y�D@'��@1/j��o�@7�|u� M@?��s�@D�;@T@I��aRtj@O���}2�@R�:��>�@V}�����@ZR����(@^x
�P�H@avբ���@c�}���@fe�6 ��@iR<� P@k�r��H�@n�z�OfQ@qD��"g@r�t�ȓ#@ty��
;�@vH�v�#�@x*�wTf�@z�Z�Y�@|'���@~BZ�<A@�7���@�W��ƾ@�M��*�@�����B�@�������@�)��PE�@�r߽H?L@�à��A�@�-�b4@�|}|Ų�@��f�0�@�T(�~@��<yˤ@���ۧ6@�gN�um�@�-C��=�@���Ίk@��a`�ӈ@���M��@�g(󙹿@�>�p@�@�L�s�Z@�����@��oA�@��c��T|@���:n�@��T��k@�zh�GU[@�k�RhI@�`�T�1@�Y�a��@�*Q�%#@�����        ?����$�c?�ajb�KM?ށ���p�?��(r� A@Ѩ�ҁ�@\��x@�MU@�za��@#��!齑@)-�v6js@/<�P�=f@2���C�)@6�x�4�@:�����@>�Π%��@A���}�@D �$a��@F��(S��@I���iƴ@L}�� ��@O�a!�q�@Q��X5s�@Sb)��8@UX�t��f@Wr6ʃ&@Y�J'۹�@\mJ�a@^���@`�?�-��@b��j��@c�s��}@e9�-��K@f��L|@h��˓@j���gI@l����X�@n���6�@pqJ���@q��ȩ|�@r�8B�m�@tS���@ul{���{@v�괂Y@xDڈ�W@y�|bp;@{[��wI@|�^��U�@~��p]Z/@�:����@�$�'ZM@����@��!�с@�,Z���@�
õ�@�&9~5�.@�<��th@�ZD�SJ�@�~��@���o�߫@�ݎ�V�5@�wNW];@�X�5H�@��SU;��        ?�y��_7p?Ǯ�]�i?�Q��݈e?����@	�)^��@+<���*@�A��O�@&�)�<O@-���i|l@3��D@7�p�^�A@=�%�N��@A�,f�#�@Ea�5+J@IE��I`@M��6j�@Q)&�@S�c8���@V��Fo�@Y���ݥ@\�Ev��@`>a;��@b%^�=2@d.�|��@f\�<u��@h������@k/Rأ
�@m��9e@pX�)��@q����@s~yn���@u;����@w�]f��@y�+�@{1�fWo�@}p��i�@�N����@�*�q,zc@�}��d�u@��0l.L@�T�E�j�@��!�f^v@�mN.؆�@�bv��F@��l��=@��q�B/@�]$צ��@����7_�@��s���@���8��}@��Hz~׾@�����~�@��r��+�@�т%T�@���WW�\@�e�mJ@�5�|�t@�`�FB�@��n�Y@��~����@���s�O@�����t@���m;y�        @.ш��k@a��h^/1@��l���@�� 1~-@����֫i@�8����@�V�k@U@����-ߞ@Ċ�c{�@�O��^�@�g_+�;@�t�J�@�3R�S�@�]����@��B`!@���p�S@�ԃϠ�@迤<�E�@��U��m@�#�K��@�N5�>�a@�!N�>�@�
��Sm@�	q��-@��J��>@�G
� 9k@����L��@��Π�xeA F�E1�A^���A�wji�A�����AOp�?I�A�=CA�A	S�aA
��06~�A�g*NrA�B��d(A>B�rAN�!gk7A5�{��A�:l��^A��h��A��Ύ.�Aj��Rw�AF�aw�A%܃��%ANM�ڵA��WpA��n��6A��S��A�Ev�-A���xA�e0�NA��@��A�r��9�A�y#V��A G૝�QA ʡ��e�A!N�7�7pA!��`��uA"\���A"��a�mR        ?f��.E�?��o��?���ҙT�?�+Szg��?�z�J��?�縹e?���U���?���<�F�@*���1@
�(9�̨@��f@R6\J��@@�W�|@�'|�#<@ �VE�H@#
CBڣ.@%�ayI�@(� x��@+��.��x@.�����@1	C�"_@2�p�1@4�m�
�@6�%���@8��A4�T@:�Lp�@<�����y@?:�I	O@@˞-�h�@Boz�P�@CG�p�~@D�\5ůG@E����@GUw;���@H��:Y7@JE>�q$N@Kб�:��@Mi���5�@O�7 G�@Pd6J�[@QGc�dzO@R2��)�4@S&)���@T"0@c�4@U&��$x@V4^;�M@WJ����9@Xj��X+@Y�Z-�!x@ZÈׅп@[��;"�@]@����@^�0(�@_�d��$@`�ܽ>�@aN|��h@b��Q�@b�ok�D`@cz���T@d;����:@e$I#@e�P��j@f�-i��        ?%x�*��?e�yY�5?��|�L��?�p��&?���o?�3x<H��?�@��S�?ה��\��?��jy��?�E2BS��?�0���λ?�w%��?�lk���@ ���A�@1�y��@
dE���@D^XN�@ہo'�@��:�@�pJ'{@!#F�r8�@$<ל�x@'���2��@+����@/�wb��@2d����)@5䫐&�@7���޹@;)�yJ@>���A�@A7��9�@CD[ C��@E|W!$��@G��[��@Js�)�{'@M7J����@Pm�`�>@Q�U��
�@S[ro��@U'���R@W�{��@Y�bp��@[C2�*��@]��?c�Q@_�� �ǃ@aC�l@b�z_:�+@d	�_�@e���H�@g\�_ـ@h�}���@j���k��@lUl�Q�@n=k] �@p�]�k�@q(���-�@r>v/��@s_��<9@t�7&\U�@u�Lc@�|@wcҪ�@x\�~M�N@y�?���i        ?dZ��>{?�<����5?��+�?��?ԎPH��|?�P�P���?���?���B���@���3��@��a� �@;Ŭ�)@��@�_��J@!R��-�@$��ެE�@(�h��@-�hp��@0�O�;�2@3��\��*@6uR���@9�"Qa޴@<� �nV@@T񱜀�@BO
�E}�@Dn�p.@F��C�H�@I��"�G@K�R�c@Nf��֩�@P��/���@R%� tq=@S���_V@Udӹ���@W!�N @X�A�*Ǳ@Z�'rҟo@\ƙ�U@^�i���@`s7��T;@a��%�^@b�aǬ� @c����@d��G�@f9�PkGe@g}��,�@h�j:2@j"�>�,>@k���f�@l�lS>�}@ni���ra@o�5
��@p�g8|l�@q�IU��@r`^��i@s:�pOX�@t�7�@u�ƘƐ@u��O᎖@v�X��@w�#� =$@x�}���@y�ë-?�@z�	(iR�@|j#'b�        ?�x�X�0V@��v�A@6cR�)�@L����@\]bU��(@g�o���@q�מ�@y���%d@����f�@�AjH�XP@�b�,7q�@�P"�@�P�u�@�nz�P�@�
}A��@��T2h]@���ng�@�G�Yx!�@�����ٹ@�2=`�W�@��(��I@��kr�#@�[�\��@����s@����:��@�H��d�2@������@��=��P@��|%�!@���-��@�ʼw_s�@�p�&��?@����\{�@¡o>�@��#�d\@��NF#��@�/a�t@�r���@��-�	�@��,0A�@ˀMґ!@���w�!@�p��n�@��-��D@�ɧ���~@ќq��@�v3z�V7@�V�"�X!@�>��șj@�-u��~@�#[~F�@� 4^z'�@�#��X�@�.!���\@�>��/c3@�U���3@�r꩕�@ݖ��,@޿;���@��m9S��@���8yqv@�/�o
*"@��A�Z�O        ?r�|�d�?��5H(F�?˜�\I�7?ᇏ��?����RX?�@����@��**I@n|��n�@��>lt@�Ъ	@��gQ@"̙u5¥@&p-Α�@*gr�=��@.���\%@1��Mt�o@4.�c4�_@6�}Լ��@9��ծ��@<��U@@�ϙ��@A����Z�@C�Bۂ�9@E~����@G�KK��_@I�
]cF@K��ڗ�@N((��2l@PINo9z@Q�ɮ��@Rڏ��1@T7�@�6�@U�I�K��@WxQ�3@X���X��@Z?�U-�p@[����
�@]��qc{@_k�uiJ~@`�5D��@a����@b��H;bK@c�@촩&@d�]�0[@e��+�@f�xO$[�@h�"O	V@i?P�!@jyӂΦ�@k�\��@m	��d�@n]���0@o�%̩��@p����@qH$��@r��Z�j@r��OK_m@s�6�T�@tP�;��@u��+V@u�K��@vĤ�1�:@w��<`��        ?<Yuym�N?z|��3?�z˫'�?��)�=h�?�f�����?ұ�p�m?�jv��?�s��K�?���4)?�DE.�U�?����k,Z@ ����@Z1&��8@
v(�,b@0�m}4@�%+�B@{q`#�@��g�@ r�I��@#A�wPB�@&i�нw�@)�V;O��@-���b�@1 l#�`@3��YV@69c��e9@9+?�HJ@<f�q��@?��
��@A�)0�z@D��
�@FJ�Y�ح@H�~D,��@Kp�#f�@NQ���w@P���f��@R\O�d�@T ����@Vܠ�/v@X�xHZ=@Z!S?�F�@\^����@^�B%ǳJ@`��!��Y@a�D�޻@cF�Pe�@d��\[�@f0Qp�@g��0~P�@iXp�Ó@k��V1�@l�B��;�@n��mf2@p3�{O@q)I�$UM@r(?N{�O@s0V+%�6@tA�|c>@u]��4�y@v��@��@w�c9�@x� �

�@z;��O        ?d27"�.?�I4�RJ.?�.�D�N�?�m��?���C�?�l�n?����N��?���t?�3@Ԫ��i@4ե�b@O33�}�@���5A�@tm@E��@�+�ߠ�@#�I>�1@&�t�P�@*��{��@.��4��r@1׍�B��@4|��}w�@7cFc��@:��?�X@> ��Jx�@@�I��l1@B��,;�@EH�^@Gr�":@I�^�$ �@L����@O�@��X�@Q^����@Seo�Y@T�Wv�|@V�q���@X��=��@Z�$��@]��߮m@_��|�@a��@b[R�=\@c�V�l�o@e@;�\y�@f�vv_@hr��+l�@j*)�P�@k��y��@m�Tl���@oҋ�z�d@p�	��@r�"
V@s'�"Z�@tU�e8@u�]�3@v�p^���@x0�-���@y��\c8@{
RM=�9@|������@~ UȊ��@��&���@���P_2;@����iÙ@��^;�        ?�X�R��@$��o�@E�P��o�@[�+Gh�@kB4�Kz@vv�[7�@��r�T1�@�Z'ڃƘ@��<u���@���"@�p�T�5@���д�@��47!i@���v�@�,y��@�Ե��6@�źv���@� ��/�@�D$5bF@�����{@�=��.)�@���/��#@��P��vX@��qM��@�}�B�
@�%
wX�@��I`�}'@Ǭ����@ɍz!�o@˂4���@͋W�q�@ϩv�h`@��J ��@�����@�DKL�;[@Ԁ�S���@��v�Y�8@��o��@؀4�Z��@��Ja@�i�yo�@��8qՁ�@އ�C��o@�gDIl@����e@�ˈ:G��@��Ү��@����1r@��G�<@剓2�@�;i��@������@�[s[dd@�����@��Y��a�@���\ȟ'@� @��@�Q�V�@@��"Z�@�d���@�Mvf@�APǹ�@�V8>r&�        ?��z䢜?�M���t�@�	�L�@GIk��K@'��L�1�@3Ae��B@<s��H@C���,>@J	�S�@P�l�
��@T��8=�@X���C@]�F4���@as��'`@d:ô��@g4��C@jd��0@m�_�y�@p����A@r������@t�pn/w�@v���@yBw���i@{��+��@~Q���	3@�����5�@��Fo;�@�j��Ȱ�@���MZY>@��U&��A@�14^�Ҿ@����k�@��q��@�zXK�@�[��")R@��)<�@��<��5�@��=�-�@������@���]�!@����ir@��o�@�M��,@���S�@��FKC(@�$��DT@�e&�o�A@�� �Ge`@���*O@��_*��@���"(3�@�E���'@�
�#T<�@�ԏҭ�@������@�v���Q�@�O7-�F�@�,����M@��8K�@��q�@��_�;�k@��>��	6@�ɓ��)�        ?����Ԗ�?��*1�?�z� �(@@O���@%�࿜`@"J3�.��@+m�����@3@���'@9��P9�i@@�k��j�@Dڐ���@I���J{@N���U4�@RC��B@Ub���� @X�g�܊�@\o�����@`/�Qm�@bK�����@d�ϒ�R@f�� �O@i{o
벢@l+���c@o!xTV"@q ���Y�@r����_@t<�L6�@u����� @w���l@y��~W3�@{���i7�@}�rf�@�kC|eD@� ߬0�@�OX�,�@���1�7,@��C���@�"�?��~@���&��@��t�-@�e}�6-G@���2�=@�{��@@��ʓ@�a��UG@�<���7�@�~�?ԯ@�]����@��f Y@��+~X�F@��y���`@���1�2�@��v*�j&@���7D%@���_��@�;oRt�x@�dE�j}@��FYN�$@�Ε���@�->L�@��\���@�V�[�z�@��Cd.        ?��;HV��?㗛&*�r@4�"1I�@J�a��@#��?�F.@.�O�F@6]C���@>Vuy��@C�f�~	@H���I�@NGΕ��@R5Q0w2�@U�1P�A>@Y?���i�@]E���~@`�%��6�@cC�!(9�@e蹌ݸ@h���S�@k�P법/@o#|�#�@qPAc��@s(�_�B@u�]�@w'��`�@yP,�u�R@{��rn��@}�|7�
�@�=̀@��u"�a@��M�߼�@�l�!=�@��v��I@��D��ӕ@�YsuAd^@�-(&t�@����s�@�"�TC�V@��u�%��@��Ɛ&@��T���@�2���H(@��I>�s-@��F�I�@�T�<U�H@���ha"b@�pa����@��^�vq@����|�g@�X�цڋ@�N�3L)@�P��٪@�]+d�AS@�vuq�n@��7�4V@���x,J+@�}�}$@�[��XP�@����V}@� Qa�@���W,@��i��@�ZW,?G        @C�K�`Q@}��n��y@�w5L�[N@���+y�@��s��v�@Ȗ/N3�@����� @�d#���@��E�y�@�3��h@蠜&� �@��Z��@�|E<��h@�]��W�@�q�I��!@������1@�8�)�tA �wt׸A�M����A�Dsp"AL~�M�A	�ƒ�k�A(K��WA�ul�K�A�N�Ź�A-u�V�A�ɿ@��A,�@;�A���JAZ����\A��+A�c�x��At��>&A?$�B8=A ����KA!{c��#[A"r "�sA#n�x���A$p�g�wA%x��{�kA&�DR`уA'��,�mKA(����0A)�v�A��A*�]���A,$�D��A-X@̓a�A.���E��A/Ԃ7q[�A0�۲kR�A17.��A1�1B�l�A2���!L�A3F<l��bA3�Tf�lA4�;��,A5w==��A69��Ħ%A7 Vno,�A7ʵ��8�A8���4�!A9j�fH�A:>�)��        ?�^����?��D\��?����M?�uT�[�@�t�C��@��@�<G@��B@!����@'�����N@.S��m@2��;�`@7=�f2��@;�x�r��@@}F�\@C8��+g�@F%U��*@ICh��ޔ@L�Bz�@P
C�wߋ@Q�iK�@S՚nt�6@U���AE@X4�F@Z?���@\�-�R��@_���@`�e��n@bA�ʆ�@c���)��@d�1d̨]@fv�g�@h^�+�_@i���0�'@k[����@mY��K@n� F���@pk� '�@qg@>8kz@rk�K��@sy�!܃@t�{*�|@u��@��@v�é|h@x���1�@yQ��%V@z��ҍ �@{��e1@}J��¼p@~� ߭�@��`	j�@��W�^�K@�����@�Yy\��@�%���8@���)
��@��9߉��@��bf�T�@��'�L�@�h�6>N@�P��,��@�=�V.�@�/�:���@�&}��        ?m�(���?��(��?Ѽ����{?�ڡ-!e�?����a@y���=G@P{ך#�@I�}�d@+62@#��O��g@)4� �@/���@2�����K@6���@;�'F�@?��5
�@By�|;R/@EI0��BQ@HTϖp�@K��:��@Ov��@Qi��"%4@Sd�p�8�@U~�jHΜ@W������@Z�*�@\��n;�@_,�����@`�:�ܕ^@bl���l@c�PT��(@e�l��@gE[�(4�@iY܊{@j񹽹�@l����Y@o.(O�@p��y�4@qţD�=q@r��8�tO@tHP}?��@u��n_��@w�BO�@x���(<@z*����@{�f���@}�hq��B@w�?�=3@��m��7@����p�Z@���b=�!@��1�-�@�%b�'� @�c�{fGs@��<�r`�@���ڦ�@�u��:a�@���(/H@�y�^IU�@�:��@�_�[K@�>7"a@�&5��_�        ?[��.��N?��0*���?�o����?�\A�l� ?�C]��D?�i=�X?�i�)�]�?��z%���?���R�@I��>�@9EFA�@�^(�@���մ@MJ�01�@`��G �@��v؁@!{���"[@$E�}Fw@'W��4��@*�Ģ�a@.d�,��@13���L�@3a���@5��2���@8F!J&,@;y�{ZE@=��H��@@�+�Ct@B8{9~��@D~j���@E��:d*@G�H�Ձ@J+���@Lp�
M>@N���@P�	��Œ@R4�b=�@S��Ո�@UBE�+��@V��Ԩ�V@X���;M/@Z���&�@\{���E�@^�H�H��@`X� �@@azΫ��@b��(���@c�P��@e61u�N@f��i�me@g���@iw��mٔ@k����@l��5�@nF��*	@pBXt8�@p���Z�@q�Z"�VZ@r�@6��b@s��O�P~@tߔ�@u�Ƈ��9@wҾ�	        ?�3�@I�@9�ƅ@�@\�j�ڶ@r���@���8y�@���@5�@�*g�م,@��iͦy@��N�z��@�B�0�f�@�Q��i�@��e�F�@��χ�ʵ@��}c��@�
L��|�@�V%;n�i@ĿLAsg@�E ���_@����H@̤$	F��@�|支�@�8��<t?@��ɇ�z@�W�����@���N,@״F5�y@�{���B�@�T��_�8@�@�h=�@�?����@�7�@��Ӭ*@���8:�@��g �@�7�~��C@�wI�/4@��^�T�@�rI�`@�|�큥�@�쫅�E�@�iH' JH@�����t�@�D�lc.�@�x_�4>@��ǅ�!�@�͖-X.J@��LU��@���Y�c@����}@���R1\$@��a��|@��>�M'�@��{��J@���@ʹ@������@���0�@���H�@�6�Y�XA 4a&X>jA ����L7Ap�?���A��y�A�P�u��        ?deZ�?�V\�Fc�?������?�O� &@?ྠ��4�?��3�?��|��?�;��.�@X�+Q�@���`�m@r�16�@쒾�LE@��'��@���M�@=2�ɸj@"�T�w@$�����3@'S��/Lp@*?���?@-XK5��@0O��K�@2%���4@3�Z��@5ɳ�PU@7�t6�@�@9���C�@<����@>oaW��@@lゎ�]@A���xi@C }�*@�@D_b,Yu@E��1���@GI�\�@H֛ɍ&�@Jt�B��K@L%,����@M�1�)@O��'!�a@P��3W^P@Q�r��;@R�/|�0P@S�OĹCW@U����@VE���,�@W~.�z
F@X¥Щ�@Z$'L��@[o�a�5@\ز���@^M㳩�@_�I|�@`�Y���)@az��S�G@bMLG�@c%B��A@d���%J@d�~g���@eͅ���@f���s�@g���z\@h�w"� @i�8�&�        ?]I߲ؙ?�n{䨏?���i�s�?�,�T7$?�|�>�?�f�Q8�M?��$G�"?�!)e��@Z�,(A�@Vh���@;qug@U�2aJ�@m�A,@S8����@*Y @!�z���	@$�A Ĭ@'� �G,T@+�Usd��@/pp7�x�@1����@482R�V@6��︡e@9��0J��@<�1Zv�@?�����@A�'�uC"@C�� �#@E�L�%W@G�ZK+�@J(�G.��@L�/���@Oc�I�$8@Q$��@R���y��@TV	Y��6@V�d�@W���r$�@Y�*9M�@\	�W`.@^AZJ�@`L��ֳ@a�Er&7l@bҍ����@d.���p@e�84��@g ���3@h�(�mXo@jD��橠@k��$ԑ@m��E2��@o�@?��@p��Зf@q�m�k�L@r��{wd@s�L��S�@t�񞧦s@v�Ձ��@wKVP�٤@x�U#��@y���K�@{uu��@|{ʽʹ�        ?:�'N��k?ri>;��?�n��C�?�y
k�A�?���R���?��>R?�$P��]?�����?�D�C���?�#�/A}�?�:N�aд?�[��6�?�f�כ��?�Z�7��B@�t�9U@�NL�צ@k_�¨@h�D�mo@}��@�;��1@���5p�@Z����4@"#�����@$��Cg5@'ߎ���@+,���@.�̙r��@1Y�G{Y�@3zFu�@5�g��@8A�R���@:�hL�`@=���J�@@i]S�X�@B	�y��@C�)�HV@E��m��N@G�[��:,@I�2���@K�1���@No�X��@P9��j/?@Q|6@LM�@RΧ+]�-@T1>"��`@U�t?=��@W(�^q�4@X��;ߊ�@Zg1�cS0@\"4�w�A@]�O�c �@_����@`�s�$g(@a���I\@b�@_DBs@d��-Y
@e0�g{1@f]"o $@g�M����@h�b)�Ց@jb oU@kqZ3�oA@l�`� Pt        ?�ix}��@j��A�d@:,��7�@Ph���\<@_y�%�G@i�n�#�?@sn�m��@zw_vp@�{HZ���@�KQe��l@�������@��t�xH�@�g��@���F�:@������@��c�s�@�'�g�@�iH&P�@��SJ�!^@���\�@�@�h��Tk@�`�T�\�@�@=J�Z@����[�@���@9 �@�h6Ľ@�H��T>@�=��:0@�H$��V @�g���0�@�N$zO�@�sh@�!�@£��
�q@��'��v�@�(�y��@�~��F��@��X�@m@�U���@��ΓwC�@�hB��'�@�	�žt@ϼi|n$@���^]@Ѫ�7�e@ҝ����@ӚS��3G@ԟ�o翔@խ���)@��
��@���J=�@���K�@�>�!��*@�x)��v�@ܹ|ޣ��@����ѡ@�S�Xƶ@�Uw$��@����@��!a�@�nD��}@�(��!@��T-X@䥁˞v�        ?{��k �?���;��6?Ѷ1���?��i8�j?��{�9��@O�k��P@	��/fr@��w�1@ �(���@ ���c3@#\����@'�ڙ��@,T��@0���ɑ@3y����b@6pav��@9�zBS�z@=}[��@@P��u@B=!���@DG����&@FpB;��1@H�����g@K�
��|@M���V�@P'`���@Q�ո�4@S�N��+@T���Of@V'�Ç��@W�ͫV�@Y��Nl�@[gކ�vj@]N����@_I�<H@`���NA�@a����w~@bٴ�z�I@d "\��@e18`;�@fla�A��@g�:�L�@i����@j]h��m�@k���֟g@m2� �!�@n�>��`@pJj@p�^��@q�%��!I@r�Hh�1@s_%y�B@t>��k�H@u#���� @v��ߨ@@v��#�S@w�n�Ec@x�2)��@y�;1�@z�H��EJ@|�ނV�@}$�~W�@~@����q        ?L]���6D?��o��F?��uo��?�R����?�O�����?��Qb�n?�D?���?�ZZ5zC?�@�aB��@��x�k@��$;
@���Z�@W���!]@nn��@��L�S@#8D{�\@'0�g�@+���u@�@0c���h�@3<,Vz@6e߂�)�@9��0ȷ @=������@@�SR;Q@CA�c��@E�c���@Hi���D@KK�!'Xi@Nc�mM;@P�)����@R�tc�Ӊ@T��8�w@V��%/j@X�Cܲ�6@Z��G�c@]W�#U}�@_���̉@aL���@b���@d=S'%~@e��4�d@g�=)ʜ@iE˯MՖ@k�+-�@m��Y��@o#��L�@p�SL&��@q����@r߆o؇@thn7�(@uS�rJ<@v�1���@w�̥���@yd}'@z�w媑�@|_t\� X@}�ĥ�@�=˾�@�����ގ@���E��F@�r��d�R@�f
�%�@�b���3�        ?i$s�	�?��p��c�?�_�!O�?����?�-R�%:?�J����?�z���\?�"ZMs@<|�&��@�)*a�@n֤\ :@�=���Q@!�/�2�@")�O�Y@�����@!��bv�k@$^
�i/f@'Q(�2|�@*�6�^E~@.,�<�[�@1�\`fv@3C�����@5�V��@8Pu��n�@;3���9@>W8Iz�&@@�ʁ�,�@B�����@D����n�@F�k �g@I%���@K����b�@NA&~�O�@P�?��a8@RD�ݭ�@S�r�y@U\��a1@W,:���@Y>����@[P��K@]B2���z@_��8Ʊ�@`����@b2 Cʲ@c���f�@d��B�l@f[��u�Q@g�H��5�@i���?&@k8��+>@m ��J�@n�,T�mg@pqb�*��@q{��_5:@r���{@s�2 ��[@t���H;�@v'ݱ�ԇ@wt�h�B@x��%P|@z7���@{���
��@}0n�q�A        ?�P���P�@*�焺@I��%��@`*B��D@o北o @y���w@�^K)�@��ҳ|"�@��_��F�@����;<�@����B�@�e�4@�U,Iǰ@����(�@���)�@��\S���@�����@�b��6@����k�@�z�G�m&@�B��N6@�4�^�@�'���,@��ݘisa@Ćt�/+@�X����4@�BѶ���@�E�[��@�a�`��Y@Ηrh�(@�sb@�tl@Ѩi:��@��	�
��@�9�,�5�@Ֆ��Ƹ�@� 	�@�{Ef�+�@�R�ۧ�@ۗ'�	2@�9��@�N@��ʳ��@�Sv�G�b@�8��Yz)@�$�6+L@��Qը>@����G�@�"h�O�@�9U�Rm@�"hne,@�5�i�s)@�O�qR�@�p���@�!7�jx@��<����@�����@�6�g2�J@�<}��j4@��0�1�@�h�]Ba@�5+j'��@��|jCH@�\�Uo}@�Mɛ��        ?_����K?�|)UA�O?����?҅��Bf�?��FF��?�Lz���?��n�@!O`���@'�$�u@$oފ?@�匳�@�ӧ�X@��G��q@!%���@$#�7$�;@'yjdb�@+��*/@.��x-��@1���c@3ϖ�,��@6.<�d՜@8�x� ��@;V(ON�-@>V�2��@@� w��W@B��ε@C�m����@EV�_��@G708c@H�{��)@J��>5@Lͪw�]-@N���@P��a�4@Q��0E�@Rȣ��j�@S��m��@U<)�G�@V�[�~ @W�tL���@Y?�.�3�@Z����L:@\'��7�9@]��h���@_A���@`p����@aF�h���@b#/UK�\@c�E�S@c��@h|�@d�H�r@e�s�٤�@f���Bd@gſ�.�@h�N�KQ;@i��(M�.@j�*S�7@k��5T��@mJ�pZ�@n H)i�)@oA�αv@p4lP���@p��6
0        ?>��/�.?�Vh)�o?�hLg* ?�ˌ��� ?˾��C
?�9�ir+?��L��R*?멂40p?�'���Â?����,��@ �4
��@?>~m@
B�)�Tr@%ZP(�@�-���@�>�/�@)��j@ �}�
�n@#h���@&�9�f@*��l��@.���<V@1&��ʝ�@37?.@6��vZ@8���\o@;�YL��@?���
@AR�x\�@C96���.@ED\3���@Guh
���@IͿ�[M�@LN߈t��@N�f㠰@P�����@Rk�#���@T��"�h@U�4�y�@W���.@S@Yq�z�!@[u�3��@]�C�?d�@_ӬH�2@acNd�	@bT*�MQ�@c���Һf@d�)�[t�@fjn�.4c@g��}?�@iy�:���@k$ݠ�A@l�$����@n����P@p@�@q;�7�@rB�O��@sU˝%��@tu{R�\�@u�'�r�i@v�:��F#@x$��O;@yz(�UC�        ??1�|�`9?t�kI7?��1���.?��j�[�U?�ݯ�(��?���voQ�?��==��?�:8���?�($��?�u�S%�?��b�H�?�	���@�?�������@G�����@"
;/�@
��W�Yk@��}��=@��ӻ`@����g�@\\4*�u@S��~��@ �#�R6�@#H��M@%�;�O�L@(����X@,�N���@/�tC�@1���Jo_@3�]?��@6lU �@8�����@;B�]��@>/#��A@@�&]���@BdF�O�8@D?\��@F?h��@Hg��}�c@J�S��:@M6�l��@O��X-]�@Q^%�q�1@R����@T��*@V;�����@X�8N�@Y�,�U�@\)�y@^-T��9@`8��v�@ahA]��l@b�_���@c�΄F� @eS嘤@�@f��k�W@h@�,��{@i��a�
�@kp�9A�]@m#� ��@n����#@p_�ws|-@qT�(��S@rS�p���        ?�*}U&�@���#k@4�X��ܸ@Kү�/?�@[⧸:��@g�����?@r�����@y�m��1�@�0_��w@�MX����@� ^wi�@�S�,d8@���%5�@���Ɍi�@�^I���@@��A8�@��x����@�m�_u	@�ef{Ws�@���S܇C@�姜�@��G�"�@��ˀ���@��$�l�q@��A�&�@��9i��B@��WC'�@�-�*<@�I�3��@��H�n4@���1ka@�0��;�V@řGU:@�ּ��@ȗ���sx@�.h_���@��G�+@͋�Lpx�@�S'��^@Е�U���@щޤf�0@҆��'@ӌz��4@ԛ���@ղ�^�h@����d@���$��@�/Ƌ��@�jd��@ۭc���@���<	��@�Ke}#h@ߥP���@��	*��@�6��v=T@���3o�5@��`�p@�ex��P�@�&g����@���Ymz@�����@�~�����@�N����