CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110923        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?���)�R??�^�O��'?��\��{�@�U���@72����@�ߊ���@"��3|�^@)��'�`�@0��Iz��@5BxY�b@:Jw~~�@?�y��Z�@B��T�J@F- 1�r@I���F1�@M^W�*�a@P��`�f@R�-ϙ-@T�fnP�:@W7���ϧ@Y��y�@\,OEXAF@^Ӂ�H)�@`˰
��@b;��@c�D�ث�@e?��+�@fԎ���@hvO���i@j%��c�@k�h02[�@m��m��@o�$V�\�@p�P�0�@q��R_�@r�vj|�n@s�AG���@t�Sg$@u�ա��F@v��P>��@x��`�@y@�Yp@zmMJ׹@{�b�s�@|�X���@~eb$�@a!��z�@�W�"�@� Z�/�@��r��<8@�[+��!@�o8{�&@��.�Qw@�vf����@�/Zړ�@��K���@�� �R;@�h7�9x�@�*�YMrO@��$�@���Pk��@����@�N9�!        ?Y�i�dJ�?��>{ە?��s}�&?ͥ�e���?ߔ8Up?�ĸ�;p�?�$U$}@�pf��a@�J��٨@wú7��@$�W{K<�@.`u�?y@5�c�H�=@>��(�@Dz�Z��3@KH��G�@Q��|_�F@V��K=�@]�ؐD@b-�ڵ�@fq�`��@keЊ�-�@p��.\<�@s�q|��@w|^�� @{�?�R9@�~8K� @��jaJ�@����ġ�@��p�[O@��g"��p@�����(�@�Ϫ��@���m��@�>4��1�@���z@�R�Q��@�RI�
s@����D:&@���� r@���x�5�@���-�V�@�o��\�@�iu8�b@�~Z5��@��^a[ @��Cvc�Z@�4f�\�T@�ycg�H@��yދ\@�2��@F@���7�<�@�.7QαF@����d�@�p
5�g@�,�{�A@���Kl��@�p�� @�l�eM@�r`����@Ãl� ��@ğj��H�@�Ɲ�)�        ?������?��q���*?ԧ�ƕ�<?���d(T?�*|c�e�@�Au�@Ń;�@�W:��@ �Ϻ���@(a)I�vV@1Pj=i��@8"hhXy�@@�AV�U=@F;w�@Mm��@S+�9�͈@X�W�<�@_ ����@cj�s��@g熰M%@@m�bE#@@qy�;̒<@t�x\�@x�$y7m@|���Ʋ�@��UK��@���;_n@��6�@����l�@��s���@�4����3@�gǀ��{@�R���7@�\O�;��@��>���@��g&���@�2{��X6@��=���X@�����@�l
�.@����[G@����0!@���dt�V@�`�]�$Y@�"(P-@��z
��K@���{��@��ץ�@���� 1�@�X���@�4�����@�c��a�^@��6��@��d���@�>o%�MZ@���{,�@���@��$���@�&��@��o��@��:�Z��@����3@��tR=        @G�:�_�@x�B��@���7@��z���@���)�F$@��O0��@Ž�n�c�@�4��?H�@�ӡ/�q�@׆����@ܰ�[��@�'�\2T@�-�J���@�j��y�y@��I�*
�@�=+���@�+��9D@�/���܃@�J�n".L@�}�&�@�����[@�$��c�?@��kD�rA ���ŘA���a��A<����A��7� A�au�A���g,sA	VC:�A
��sAHl�&��A���A�]����A��Nf�A��$.F6A�F^v~#Av���F�Aln���Af&P��Ad��E�Ah�jc$Ao�m�%�A|;n��A�HBXA��|N{A���_�A�[�֖tA�w�EA �,.~�A �p�4A!G��6�=A!���A"�Y;|�A#&�7/�A#�lϪ��A$t�:�S�A% �/�A%�fI��A&���}<A'3����5A'�\(�_�A(���(��        ?f�)�۝d?�0V7��D?��#��?�sL��́?�Q����?���,��=?�Zr�Ug?�[G;�?��sj�@�a
ױ@	:�A��@���@رh"'�@��i�t<@�fC���@M �q|@!���@$�e[v@'�cz�t@+ � |�@.�o�bS�@1` B�-"@3�]:A�@5ь��p@8Hu�ƺ@:�Ղ߳;@=�>�K7�@@W�D��@A��>
@C�L#�@EM�ß*@G!�i{��@I�mO�@K�/�i@M$�/]@OR�f��@P�8�@9�@Q�4M�9@S6~L@T~[U��1@U��<�'@W4���+�@X�����@Zƿ�YF@[��a�[@]AJ��@^�2���@`M����@a/y7�	@b�|�m�@c	���x@d�;S;�@e��qA@f ��6�@g'k�&�@h:{8k�@i^=>q�@j��ר$�@k�?��d�@m���=@nP"ق�n@o�����@p�l$��        ?F��\��1?��R���?�"��!��?��Ή+�?��� �N?맍f��?��6J�C@���d@�k	8@����.?@b�ɴQ�@#���ayE@+����W@2���@8����&@@R�q��@E\5F��@J�	�-|@P�*/	+*@T~柆�@X�j�2�@]�)U�?@a�����@d��D�@hrBQ�j�@lP��f�@pGԗ�f�@r�����@@u#��22�@w�w�;x�@z�{<@~�j�@���1�Hw@������@��L�,�Y@���XU@���U@��!;\��@�.��)@�y�C��@��ޜ�y@���R)@�%&:�@�����@���'=�y@��`�"\@���筶)@��mɶ9h@���-��@��()�`@��t�j��@�4J����@���`�[@��(R�O@�j-!�@��9�(Z@��*;]@�2Z>_�@��>�0�'@�]!��cW@�L�p�@�F$t+{K@�I*�~�        ?[Q�ٝ��?�z�2 u>?���4���?Ʉ�E?�^?�^�t�4?�.�KXm?��,R�@�!��%@��3	@z�ܩ�)@ &����@'_�GJ1_@0�ǒ/e@7x�b�ؕ@@2�H�>�@F_s��@Mv
4n�M@Sr���@YT����@`FHۑh@d���6�@i�N��]@o�[:�@s����:�@w������@|`�Z9o@�ݟ��dJ@��Y�g@�H_��<6@����6@�FO}2@���C葝@��Y�m�e@�O-3l��@�[�ֻ�h@����^Y@���`��@��D^�̶@��e��B@�᠚�@�FR���9@���u�i#@��x*T@��C6.�@�D��^@��i�[�@����O�x@�p��Bɽ@�[�� �n@�`IRo��@�#�@����q��@����@�?[��@Æ/@�Ps@�۲!��@�@=%��@Ǵ,�:΢@�7��U�@�˾��/@�p-�V?@�%��H!�@��r
�S
        @/!\1�0@;�Wg��7@\nRՎ'�@r#>�,:�@���=�G�@��n��"o@�=!�'��@�*|�?0�@��HY��@��U�ݜS@�̓��a+@��V��@�����@����8%E@����l/v@��k&�@��SaT:D@ˇ�%��@ϭK�ǳ�@�%[׎q@Ա8�@�{���7@ڄ����@����ݟ@�O�zR@�5���@�$,�o_@椊9�T@��Ç9u@�3$V��@��_���@���y|F@�j��dx@�ʌ}�g@�6�O��@@��l~��@�48��@��6�R!@�byp���@�$R��/@��f���l@��y7�r1A ��{�BA���>%�A�R�6��A�;���5A��W/��A�ݹ�@6A�F�[��A�@W�݊A�3�uA
#�.�GaA\���RGA�Z=�D�A�=�*AHU܉x{AVǮ��AV?��A��>˦A���`�TA]^�Q��A.G[}Abֿ�	        ?����?�Q�G��?�7-뙮�?�;��9�?���z-� @��A�q6@�-�"@���뛺@���G�_@ MP�0�M@$1,��Jc@(����@-BG���{@17����@4�V0-@7
}�H7�@:Ezwq�@=�z��GX@@��S9WU@B�����@D�`O�!@F��6�`�@I;a�+�@Kr�|ϵx@M�X��I�@PE�k��@Q�m��'@S���Ó@T���抐@Vۋy�D@W��M'@YPr�K-@[u����@\����ع@^�Ũ��@`=�eΜj@a5�u��@b41v�@c:l�I��@dHj��@e^(Tv�r@f{զ0�@g��� �@h�Ԑ�@j�Raۣ@kF ���,@l�\����@m��:��?@o:�^@@pOS3�g@q$�J��@q���P��@r�*�T@sF� #�@t{ �!�@t�{PL�@u��o>��@v��	��@wb��0Z@xA�V+��@y%�M��@z�*D8@z�/��V        ?S*��8s?�P<::�T?�x,��<i?Ȧ�p?ڙx��?��*�?��<&)+�@ V�.�u@��97�@�t���V@܎֌Me@#D@��,@*��W�@24W�n@8I%U���@@��R�@D�?]�V�@J�uյ�@P�T��T@U8�Oԏ@ZLTQ)�@`#�p�@c�(��M@g�U�M�G@lR����@p��p�@@s֘����@w=�M���@{��<@N���A@�I9�Te@��H�K�@�t��ē�@�����Ӹ@���H��@��l���@��B�"V�@��贷H@�@a�"̙@���wC@�]F�2�G@�/��F�@�� U��@���u>d @�f<��zZ@�4;�9@����uB@�#�|�@�G�r�@���:�@�t�}4^+@��~��@��s���@�i[�@���l�%�@�b�A��E@���!1@��c�H(�@�e@�{o@�8-�"/@��/<x�@�5��a�@�o��5        ?F%L�zW�?s@Ҥ!mo?����I?��j�L�?�4	��?�aWئ��?�Á�"�?�S���#?�=�I�9@	��%&�@"��s~@m��p@!(ֈ�A�@(ˉ-p�@1th�04@8 ٨%�R@@(�,�@EX�Fos�@K�8L�@Q���lD@VT���=@[Ƃζ��@a�X�R{@d���4�.@h����@m�Q�Ż�@q�<,�@t��� 	�@wѩ�v��@{vi��@s�-P�A@��4:�*N@�AfJ��@�̒W�(G@���ⲕ�@�v�BG�[@���GT��@�u,5|D@�8��P��@�a�o�.@�rN��@�!<1{GH@�O��D�@��z�T�
@�����mc@�?��G5�@��Bb݈q@���:S�@�[�Sb#@��:���@�eR)���@�ŃzE{@���A��@�pOá��@�A:�~]@����)�N@��8�=�@���t�.2@��:d��@��]]]�@��2��@���	&�@�.�4�B        @&�t=�Ax@T���c(�@p�\t�^@���a�(�@���u
�@���U���@��,�0�@��.�O�@���jxՙ@���N�]@�9ɚ(�@��~�+@�]�COST@��>�E�J@���;�L@���z!�@�F-ĥb@Ԫ�)��@�5&[}@@����޼@��ԝb�@�ļd��@�y�ȷ��@�&��C�:@��#�2(�@�ě��|@趋;Up@��O���@����Oj@�`�NR@�-UԻ@��Q���@�-��Al@�{��B[@��і�܈@�<Ѻ`�@@��Ǖ�3@�1��R�@�����m@�][� �i@�H�N�\A `��w�AE\�ELA1�geA%Ү��OA"JP�AA')r��A4�CmAJ�o���Ai�W��A	��n�E�A
��^��A���=y�AA_�e�RA�����A���ZA�(
�AW��[A��r��A��n�LWA���Ho�AZ�p�YA'�Y<�        ?gK��0��?�
��?q?����}?������?�@չ?����wY?��U�޸|?�J��(12@�|C��h@	;Te\A@�B�<t�@sf=�?@z{v��r@���#��@ g�iQ��@#����X@%�[¬�@)���@,h��Wr,@0 
#�2e@1�a��@3��~O�@6.�$�@8�g���@;
rĊ)@=��~�@@G]v���@A�/�e�@Cc��5@E��T?@F��#vH�@HĂ�:5Y@J�C�w@L�p��z@Ox�sH^@P�w�pZn@Q��r܆@S(�#�@Tx�#�'@U���s@WCW�BO@X��ѐ>@ZED�ìQ@[�E��9[@]��ð��@_9f{�C@`��뺊@an;�i��@be�4"ek@cg���$�@dt��A�#@e���T1@f�L��7�@g�J8Ǝs@i �JI]@jk�8�8@k��%"=@m)�](��@n��-�=�@p0pW�V@p�󢰆�@q�o���@r����3        ?L�b�	l?� ~���?�byba��?�\��+e?�\?DN�p?�K�0 �?�XT��?�t�猾�@���3[@@�՟6@� RUk�@,�����@$ܨ�@,i�4�A�@3�� �@9$�ʤ4\@@WM��d@D�H�H��@Jlݯ/��@Pw�YCv@TD�����@X�#�v.~@]�j�C\@a�K"r<@d��%��@h����3@l���?b�@p�R0(F@s
n��,�@u���Dn@x�}kΚ6@|�ڷH@��8i@j@���$�r+@���+��M@�?��J@�m}�a6@�܇eTv@�æ"��@�Z���@����?@���Ҥq@�T�υ�@�.�=;U�@�#��!�l@�2ָ�q!@�]Y�@�����@�%���@�AA�J)!@���O�m�@��w9�5@�W!+|�@��4�oݍ@�\�P�,@���_�U2@���t6}@�^��JP@�1�z��@���qߓ@��M�,N@���e���@� ���        ?A�P��RS?w>>-(��?��Ag��?��mA�(?�C@qx?�l����+?�!�1�|,?�=�9��?��xS�l@�i�a@?~�)@T��6��@%�qVz@/�SI�h2@6�V� @?cRgQn@EM��Ǫ�@L`z�$�@R����@W���u�?@^m���Z@cH���@g��|�Ҟ@l�,?*��@q�5�;zp@u%]��5@y3"�_�?@}�	*�Y�@�y�_�_$@�\=�oY6@��J�.�@�aV4~k@�i�� �@����mw�@��8�|@�~��|@�:-�
@�-iڬ��@�Y��+�@�`�(9��@�3�s�o�@�&/��@�9��8@�o�>|K�@�ȷ~�XX@�F{훦&@�t����@��3�0�!@�Ss�A��@��Q��P\@��]�	@�= �[@�J^m�@���8�l@���(@��}"�@��Hv"�@�:=5�a{@�i!~
�@Ĥ�A�|1@��	!��@�Bt#;�e@ȥ� �L        @ o��s@9*7Z1*@Z�*$t'@q4���x	@�핾�F@�O#�;�@�SZɱ;@��0t&U@�����M@��y�:m@���$�r@���R'�x@�mo��p@������@�#�/��Q@£�)�@�V�4�@�@(ڬ��@�e���/@����C�4@�:���)@�5��p@�Y��^{@ש^�\��@�'��-�@�ס�߄�@߹�I�@�gn�v@���oq@���9�@�?%V��@蔎��_@�+����@��:ڋYR@�	�Y��P@�����@��V +�@�6����@���Є@����O�@@�`-�ЂI@����w�@�iM�O@�s$��@���'���@�_��т�A �h���A|����Aos�\Ajau���Am���·Ay���A��/uA�����A�a�j�sA
�_��AA~�lkA���!p�A١&��A6�jkN?AO�:��A
�+jA˔;���        ?�����+�?�Dy�,X?��ۇJ�?���p�@�����@uX>a!"@Ͼl��@*y��@$b�ː��@)�r���@/�q�a�@3<�iU@6�F�@:���@>�S;3Y@A�2&� @D�fޢ�@F�H��ܠ@I3��H�@L �fK�@N�N5�q@QQ��9�@R���˜=@T�I��w@Vdu���x@X`ʠ��'@Zxs]o@\�`���4@^�W�8�@`����'c@a�c�5S�@c@���2@d�����#@f���O@gv���?@h�'>���@j�|���:@l�)�@m�i���'@oq �$O@p���U�@q{����@rf���o�@sXM����@tQ'��Kq@uQy����@vY���*@wi��]�@x��G��@y�����@z� �Wu@{��V	n�@}:�Ӷ�@~�Gk �@�X^0�@��V�>�@�Er�� �@�����@��5d��@�w�!4�@�=&��=@��[��q@���Y�m        ?r���?����%?�F�3<l?���#?�G�)԰#@��T^\@�t��m1@,���H�@"�.��@)�����@1N��}��@7)k�Whs@>����!@D�(5�@J���[�@P�v��G]@U7 i2�Y@Z�a��@`��ڼ\�@dsy:,�q@h�s��yr@n.�o���@r���v@u��0{��@yd ��k�@}�g��\�@�R���/@�q�p%�@�O����@�lY�-�@��E�Ƃ@�15J}@�M6�g�@��^E�@�\���׉@�9���`�@�T�*&��@�����j@����<
�@�����@��6�tm@���b�@�^��	�*@��ZqW@�[ˡ,�u@����@�f��e��@������@���)���@��no�-@��b�l�0@��yҥ��@��J<a�@��&�,��@���9P�@�9�4��@ĖvN�@�e��@ǂ1��@��g7Q,@ʵ�h��@�j:��l�@�2Z���k        ?�lu��?Л&�t�?�E��W@��R���@���f�J@��2��@!�V��@'��v���@.�V���@3|�_#@8)�C�T@=Ue����@A�SVâl@EA-u�y�@I]+arB@N!w�<��@Q�>�hh@U����@X�KD�|@\ܫ�U�-@`�K{Q��@c��u(k@f��"UD@j	ɔă@m�9�վ@qnZ��@sr��ɿ@v3(�@x�Z
広@|f�֙@i��B�@�����@��	eu�@����8��@��Q���@�W��o�@��])m/@�����׹@�H-'tt�@�����5�@�k�%�n@�]7��@����.��@��j�@����ٞv@����?�@��?�I0`@��@��I�@�
YC��G@�/���D�@�_B�c@��N����@��G@�(_i�g@��g�[@���@�O4�Z�@����Rš@�L��DA@�n��@؎@�=Ӗ��@��"�d@��mJ$��        @A�2�B(@s����Sp@���@����&�`@�D�boDH@��Ul��@�![��^@��P�p@ӆ�C�@؅���5@�eG�e@��-�Ȓ@�-J���@�!UM�8@�8���[C@��,�@�
��Ե�@�'���Y@@�^�Q/F@��Gn6'>@�s�&��@��f�>�9A *�Z�V�A����Aŵ�;hA�G��A#��.�A����SA	�w��AL�O�W*A&ʔ�l�A4ܗ�DA���|�A�d��A�ܐl�A�Xay��A��Gɯ�A�΋�QA�J+��AV+7V�A��}�ˊA�
�z�ZA/�zϪ�A�Jh��A𙤸GWA /�#D�[A �¡��A!��M�f�A"u�qDTA#B6���A$)fa�A$����rA%�\B�A&�)�#�A'���4�A(����_�A)�P���XA*�۶ow�A+�n^�(.A,���$Y�A-�Ǡ<�A.ãD��}A/�~�Ƿ�        ?�0�#W(?�h��Ӕ?�J����?�d�S��@ᶕ\�@[��Wz@N���+�@�˭")@$`�o,��@*��<w�@0=_�pD@3��߮s�@7��koQ�@<a�s �@@��Y�ϊ@CsV��`@F~��'v�@I�܊�@M|�_d4�@P���:K�@R����Щ@U<]��@W�M��@Z}$���@]l|�.2�@`J<��)�@a����	@c�P�:��@e�;*�;@g����@j
!r�N@le�v��@n�n��_@p��)@r1}o��@s�Z[9ĉ@uF�s@�@v�/�Ճ�@x��^V�S@z��٪�S@|�Oͭ�@~��_�0�@�u�:��6@��4ɸPg@��V�'�@�sצo�@�t��m�@����F�@�Q<����@���/B�@�p)t�tr@��}@���@�C@�Rb��V<@�C)'/��@�=��BaZ@�A���@�OhN��@�f�`x��@��u���@��r��6@�䚯E�=@� �Ǯt�        ?�����\?��Nr�^?���-"�@���&>@�f�vu�@#+�����@.`4@@6���=�@?���-lI@E�hzt��@M=ڐ���@S�F)P@Xm!�A�@^��^ܲ*@c���|@gK��
d@l%85�mo@p�c
2	�@s��%K�@wbI{��@{>�}��@�� ��@�s��0�@����z��@����oSp@���Y�-@��L��@��\�.>@���@:�@���o@�Tr�}�0@�ֆ��"@�����@�r&�S��@�HÊ�bm@����R�@����TD�@��qЇ��@�����`@�����/@�5ՠ�P@����r;�@�#�\��j@��U<|F@����ty�@���ӯ�u@�*��B~~@�咷�:J@���[м�@����-�@����y@�o
��@�����D�@���N�@�4�H�@�g�-5ҷ@��u)���@�PewGH�@���L�@ˇd/���@�Aa��_�@�Nz��Z@�zL�Ɓ        ?DL+��"�?�m��5�f?����7]�?��M���?��v&p?�E��hfA?��}ho3-@¦m��@��
�8�@-����@$����@.��'�:�@5ƚp*��@=�}I�r�@D(:wg1@J��h��=@Q)ld@U�8{~��@[� �$��@a�7��Y@e�A�Q@i�lA�,U@n�&-�k@r���S/[@v��8�@z���њ@~��U�D@���&%�@��<ì@����@������#@���L�A�@�
5�`�@�w���
@� ;�c�i@����l@�.D��P@�L�y �J@�%4_��@@�"�xt4�@�FmJ�)�@��QJ�2�@��:a@��`c��^@�<0�@��@���G�w@�T-Xu�N@�.BO�@��
j�U@��@�2�@��`n�@��"�@�FԶK@��9�&��@�'����@Æ����@��lƘ"@ƃ=�F�@�":���@��G���"@˦M��H@͍4���>@ύ���-#        @07!��n�@i����y@����`��@����)�S@�+���:@��X�2~}@T� W@�����1@�6{'���@��_`�@ە���@�ٯQ�@%@�>|�@��*���&@�\&��@�R\�Bf@��LZ��1@�~�Y��@�k�#��A@����/��@�����y�AQ����AE��A[ �7�A���[*�A	���Azn��EA)U���A�X2�VA�_�#%�A wC��$A�*`s �A�����A�^�]��A��BS(A�tJ��A���T�rA!-�J�eA"q�#7IA#���A�A%1-y��A&��;C��A(> �oP�A)��M5YA+���w��A-i��A/N(_�V3A0�����}A1����@.A2��gԆ�A3�|�|�A5��Θ�A6M�[�^4A7��f�]SA8�J)�A:Ml"X��A;�V�B^:A=:�L�A>��P
��A@/&��S�AA:�rAAۣ�;AB��ʎ��        ?���.���?� Y;��?�-���b@z-c�	�@��t�z@�~�@�@$M�.�y@+� V��u@2)cP��@6�~u
'@<SY*��@A�,7?@DDw2��.@G�!
��@K`H��Il@OO���@Q�lt�*�@S���4�@VWCv!.�@X���>��@[~�~]@^T��G�@`����@bT�j۠D@d�W�4@e��n@h��Ī�@j+G�i�@ls���@n�U���@p���T�$@r
U�Ly�@srK����@t��%wY@vv$#��@x��%@y���o�@{y����@}D��)W�@��/@��O�r@�}�{�f@�~�5ˤW@�� �Su@���)nZ%@���ɨ��@��R��@��ɐ�G@�5��(m@�v=����@����?<@�ɂv��@�n���9�@�Ӫw�S�@��ؠ�X�@�\��+��@��TL@�−:�@��/���@�}����@�Rk/���@�-Ac��@�����O        ?�PW_��?�䏕�'?@Ʉ9ܕ�@*_: Z@*�}���@7nY�gm�@B�E�1�V@KQ��L_>@S�?v@Y�!��@`��iE@e��hH�t@k[�Mm=�@p�"[�b@t�t�E�@y#�9{�@~����@�����w@������@��݀�@�@�i"�` @�^��k^=@���;k*%@�g�#-�z@�Om��cD@��@�I�@����VL5@�hF��iS@�}IP-��@���ElL�@�5�~$֍@�ާS# �@���W��@�k
pg�@��D<S�@���_t�q@��g��� @���R�'@���e@��|K��h@�O�?�@;@�)E�}Bj@��so�@ġ. �j@ƛ�*R�@��@55o�@��y���@͑��W-�@� �J�@яk�^M@�;귲@Դ��Z��@�j�*��@�6���@@�klZȁ@�xh��@��:��@��(���@�/�)G�@�M����@�r�u42�@��1��@�ђ�M�z        ?�#EKf�}?�&�~��q?�ʓ>��@9����@
�2~�@Y#_�?O@'�ώ�$@1"s���:@80�d �~@@ր�i�@G2%��@O�P�҉@UOR�OF�@\XG��Oy@b��29��@h�a�]�@n�3�N��@s-�T@w��C�@|�?_��@�p�"��b@���X�:@�vMʰ�@��W�*@�x�m61J@���tWs�@�n��ʜ�@�-��-P�@�1�_N�@�1����@���28�@�r֚nS@�Aa�^��@�&�oE�u@�"���w@�6m@�$�@�bb��z	@��eu
�@��<���@��n�"-@�ia��@�g��v�@��`Cq�@�OYN�}@��=D�h@��u�Ik@�=�6��c@�,�3�@���ߓ��@�����g@�wPH:G@�2���@�d� �d�@ŨA~�@����>@�i��<�]@��^~��4@ˁ����@�0�K�b�@���s�G@�n�����@�n��� @�~Z�;�        @R��W
�@�8>��I@��h9@�q��I�@�&�x�d�@�6ws�$@�z��:b�@�	�.��@�i��_z�@�򺡖�E@�4�v6/@�����@�.E8摏A X�N_A�P�w�A���AW+A��� )A��ia�_AS`�dU�A����4�Ax?sfKA�)K�($A��\�9xA�5n�A��bA0�i|�A �/���A"n_E�!A#�Mm�kA%��^A';Q���mA(�}4��A*�^��A,�����A.�R� A0W���A1dc�+�YA2x�"qP�A3����mA4���lYBA5�wH�-�A7�hW�^A8=���;;A9t`�~�fA:��'�GA;�z:r�A=3��|�A>|GZ[�DA?��º��A@��s�o�AA7/j��cAA�u<� AB�B"?��ACC]gsAC�R����AD� ��YAEdId���AFO����AF�6%��VAG�"�j�}AHb@����AI)���d�AI��u�l�        ?u{Ĕk�?��,7ɓ?��EF��?�Gȱ�e�?��]8�K*?����U�@K���@� �J�@Hj�B~@�EV,@ϔ3O�@E�L�L}@"/�L{�@%�3I3�e@)\y�H@-�8���@1QFB��@3���([�@6M(�i��@9F��*4t@<��	*�@?����e@A��MΈ @C�.GL@Fx�D@HMJR��@J��*֣@MKȻ�@P r����@Qm�>M'@R���j�@T�34>^�@V%�c�@W�U��St@Y��V�M�@[��f�@]ky�@_g)�4�	@`�]o���@a��hMA@b�31M��@c�?G�U@@ec�fu�@fLv���E@g��(�,@h�a��@j� ��B@kzo]#x�@l�n�Ã@ndp+1w�@o��.�&@pţx��>@q���S�h@rz�Z@sc����@tVx3v�(@uT��w�@v\����<@wpx ���@x��R�,@y�,%���@z�t<�@|5��԰	        ?:d/W]�?v8��ws?�S<p��~?�Ïa�}?�b34�t?ׁ|�g�I?橊r���?�}�]��@����<g@ߗ+��@���m�^@!p��@)�bp��1@2�,ն!@:d�Nw��@B2�M���@H�3�K�6@PG��5@U1��7�t@[&��)�@a"���'�@eVn��­@j=Z��o�@o��Q���@s/�@v�:$�k�@z�c'�O}@�����H@�Q��t�@����Ő@�)��p-5@�z����/@��@��@�u��>@�����ލ@����a��@�k�h7@��oz�.0@�9���U@���\|�@�|����~@�
�ՄH-@���۔@�d���@�1��Z�@�>�J0@�+��WT@���h�@�!��MX+@�@��U�@�k����@��d���m@��`�c��@�4��j$@��v'�x@��Ƨ��@�k૚!X@��b(K��@�y]��U@��˼��@�\���,2@�5��
�@��Dn��        ?W��y�Ƕ?��]�C1?�m5�x?�f#7�?�r�I"�c?�Џ�{�z?�?����L?�TX��@	�v���@�U� 
R@ ���[d@)O����@2�S"Z�F@;����@B�t@@I�2�%_@QX�� ��@Vć5��m@]Z�SL&�@b�^��	M@gI��B �@l���_@q�wh�!�@u$'��@y@ 9���@}�E?/��@���Si�@�j���{�@�������@�V��d@�����@���Lį�@�˼|�Z@�;7�|�@��(�y@�����^@���l�[@���h�T@��k|W@�f���@�pn�]�F@�N��(@���g���@���HT�@�fVRi;�@������@�Q�` S@��-,�U@�2B��r@����V&@�X"�@�)�NU@�é���@����S3@�uv��@���~��5@����,d@���9�x�@���E��w@���]|�R@�%C���@�A�b	�@�v�����        @$��7�i�@]|ec��@zџgV��@�b��!n@���䍙@��=�C��@��3���@��3p���@��� ���@���x� �@�f��-A@�8\9�d�@�if&?w�@�s���@҅�n��@�C����}@�;0��@�l�I��@��%E�e�@�>�K�	:@�.x���@�;�d�@�f3#0�@��Ze�@��ay�)@�?Կ�@�B��n&@�Ke��b@�z�!��@�/'j�@���DBX@�O:]�@����i@�����@�@���$�r@���>��AUVv��A)N��A?�Gw��Am��B�+A���洀A��erA:4�£A	����{A!���A{�
��HA �	�IA����0A�7D��A��	]�zA{���'�Ar���9=At�D��A���A��T��A���"�A�P ���A-��F�Au��- YAʇ�J9A+���ZkA��4=h�A ��M?�        ?������!?�k2|�?�ݾIA�@Eɿ���@eR7�y;@]�}̗@�j�ѝ�@%1�/;R@+\p�`c>@1(���w�@5�g�,I@9^�w8�K@>'xJ��@A�����@D����@G�8��3�@K18ʿ@N��7�@Qq��FW�@S�]S�6�@U�ޕ���@XH��0@Z��^$�@]�\P){�@`:���p@a� 큲�@cW�~�
@e�2��@f�U䒆-@h�P5�Jn@j�����@l����@n�?1�y�@p^2���@qy�4T�@r�_	��@s�e���@u α�Fc@v>����@w�ya^�@xҴV��Z@z)@6!d@{�5��@|��e:?@~_�7���@����@����v�@�s<�f��@�=�r��V@��ô%@���]0�:@���l��@���T��@�{1��#@�c�-p�@�QbL���@�DrR��@�<�!%�@�:�p��@�=��v#�@�E�z�:@�S Ђ<@�e�FͥU        ?~�[˹?�I�˝��?�?���>?�^o�Z&?�?�e�KC@�ȡ�ђ@n>��,�@٬�@ �C5%@&��A��8@-��q��@3�˺@8k���-@?Nh�g@C��If3@H�(�*'@O	��5��@SW�	��@W��-g�W@]����53@b{��z@fAw�6@j��5�@p @g�F@s'X]|�@v�0@z�
�Y!@�ҥ�"@�t@����@�r�;�@��lĢ�@���"��|@�Y$��@��",�T�@�-?=8@�����@��ܹ)0J@�RJ��'@��ٹ�[@���X@�
M��C@�[r���@��	9Q#@���y�c@�^�^w:@�8����@��Jr��m@�����\r@�}�@��H@�{j��� @��	h���@�ו�8:@�8$���@���O��@�1Б��4@ØZdO�@�
�6�@Ɵd�y�@�@�"\	@����f<@��4N��@͢ױF�F@ϙR���        ?l��E*v�?�4_�Z?�q��-�?�=���KH?���۪�?�<�;�u3?��fu���@ ����m@bUs'E@�ט;I@�6���q@ �v���@&�(��>�@//��XY@4�&ޒ�@;П}�D�@B/�y�ͯ@Gv�N$@M�<��\@R�Ȍ�}�@WU	�6-�@\�K� �	@aq�i�@e�sP�?@i{��RO@m��d�Y[@q~�;W�@tm��S{�@w��*hh@{U�^͔@W/��u�@�ߤ�^�q@�I8�Ў�@��޽��R@��'��N@�����Z@��'}L@��x�?�!@�څq���@��2w��@�&���I�@��N�^�@�/�81H@����M@�H��*ͼ@�ʺ�L@�b͚@��6n�Z@��܋�#�@��iVA�@��m/;/@���4�_(@��q�P@�$B��@�S�t��@���o�@��@'�@�J��9rg@��b��@�@�(�1@����tg�@�z�B��,@�2�w���        @G3�cl:@w�lr�'�@�	Ѝ�g@��eʎ��@��G��T�@�S�ѷ@�#I%��@̻ϰ]-�@Ҹf�_��@ע�AW@�#0��J@�
K�@�f�˕@�Ĉ�u�@���j6@�AK�\�@�+j <�$@��[���e@�����z�@��&���@�<f���AkV�{��AX�@Ah��?�A���r�A	�ɔz��Ay�r��fA(�qA����A��x�C�A&̈�_!A���t�A�a>��A��J��IA��R`�A��(�bxA ��G�A!A���3�A"��i���A#�D�C�A%6����A&�0D�A(,.\�A)�J��1A+e�u�1�A-=x��3A.�B�+�A0aT6,ieA1X�W�;LA2YN���A3cq���A4w��:A5��{FA6�K A7���$�A9"���)A:d�e�8�A;�-��5A=�mFC#A>b�b�m�A?���J�A@�w�AAY��0�        ?qc�6HO�?�k�ɡ�S?�i� 2?ٸxR~K�?�sg�V�?�i�2���?��	?�	|@�����@	�>��d&@x�B���@m���@�C�_PH@��bE#@!h�~ޝ@$;���@'E\7U@*�T&G�#@.��Z2@0�jW��@2�}w���@4�i�J�r@7?z�T_(@9��:��@<-�;ӝH@>�2�EP�@@��3Y@B^�^@C��S�$@E� ��O*@Gm���$@IMIh[E�@KE�5�8�@MX	E��@O�O8�D@P��Rޯ@@Rry�mn@SW����@T�mU��@V	��T�@WwU셚@X���@Z�/��@\3�2][�@]�iÈh2@_�/%Ώ�@`�n��O/@a�u���@b�����@c���z�@e:0���@f2���@gj�����@h�a1��@j.F���@kc�� ��@l��ӏ@nNq�Fj�@o�m��<@p��b�@q����6@rg"s��@sH�5F%@t0��eH        ?atpڀ��?�j�ۯLR?�r�c�th?���(5�?���(��?��q�:|�@`u~�;@� �vя@����@##�6�M@+�|+�&@3�x+l�@;�p���!@C\���@Jr� ���@Qʶ���@W�)����@^Ӌ�u��@c� <El�@iJ[)Gd.@o��+V7@s�7�g@xKƂ�x�@}��ʾq�@��*)��m@�N��@�A�;�@��x��6F@�VĜ^Sk@�\���Q@�+uBh@���J��@�8���@�/��@�K|��@��dx��@�,����1@��3��h@���P��y@�ojhAap@��p�5@�����&z@����U|@����N@�����/�@��}G���@���`R��@�'�[0�e@�`0���@¦k��s~@��ljm>@�\gC<�@�̗@lfr@�K9P8�@�،�5n�@�t�K���@� O`�@��I��m@�S
r|9@�@��E�@�6Bo�D�@�4u���G@�;Q���        ?aV�m5:?����6&�?��P�N'&?�N����?��&{?�3��?�(8=�|@ :�)8�@	�eQF;@��<���@�Co}'@&5U�
�1@0$��'�@6�}!�7@?����!G@E��I'@M+�蕬@S*Y�+@X�=�p@_��
�U�@cɽ���M@h�>bkm@nr�/5@r.U\8Ɍ@u���^�@y߯�ꜞ@~q�fJ�J@��Se��O@��4�1@���g]-�@��J���m@�����^�@�DO$�'�@�^WI@����zW@� we^�R@����@�6?���@��Be�@�~��8�@�\�~��@���0��@�Y�Ӽ�Y@��` \@��
>rQ@��@-p�@��F6�bL@��;�_I@��Uʝм@����D�@�m^�|�@�B�=�,@�pI�9�@���_+{@��#�-��@�.��tUS@��C�qAn@��(@�ݼ@�B�/2@��; O@��)�@��/ʩ[@����>.�        @�� �>@I&� kq@i�I�O��@�mu�D�@�׌��@�J�,/n�@��Ra��@�=_+t/@�����@���@��;ㆹ�@�d&���@��ɸ"d�@�p�Q�H�@�im6�k�@�W����@ңoe�p@�^l� p@׸�`_@@ڃ�����@�|柌�<@�R2��y@���T��E@��楈�@�9�0@疌�4@@騬`�/@��[5�V�@� B�P�@�Ct����@�e�S�@��O-���@�6���1_@��\e�k@�)�+S}@���/��	@�c��JG�@�����@��:M̬@��?�K].A �5��qA��G��Ao\V�'A)&�ۤAWL~t�A�(U�A��0�A	/3n{�A
�	a,�A��0��A�3�m�AV5�FAV��d�RA-[��_A����A�,��mA᯶nPA�C�GuA�\���A���(�IA��PҤ�A�FA-F����        ?r���R)?�?��0�>?�W
��)?܉��KW?�]c�ƾr?�&�D�Mn?���\q�@V����@/��m}@܀h�6@ �js'�@�ru��X@ ���[K@"���Ӆ@%�{H�@)T;�n�@-j`��@0���Y��@2�X�@5/3?V6@7���#�@:j���@=o�*Q�@@ZJOR��@Bs 
T�@D����w@F?��P@H8x�q�@J�1�$@M�ǌ��@O���U�?@Q>x���@R�~��%@TQ&��?~@U��=�l@W����W8@Y�GĞ� @[�E#
��@]���/�D@_�<�q�@aO,޿�@b=/w#E@c}uqZ�@d�DV��@f)��m�P@g��1�zc@iǢ�@j��30|`@l3r��4i@m�cL.8@o�tQ5�@p�E�s�@q��8xE@r�ZQ�W�@s�P@t��
YBB@u�#��M@v�k���.@w���|_N@x�u����@y�=�ļ�@{�|���@|=?&���        ?7�P)��?rm�O ۰?��l���:?���I�w?�A��9�?�]��]6?���9�?�`x����?��"{ɗ@�*~/7@�֝+Wj@ߨ'�@%K
��p@.pA<��@5(��A@<��g��@C,G�q�@H�o['l@O��M޽@T ��ToJ@X߃�;�9@^����إ@b���j:@fS��GR�@j���	�@oxp�(��@rv�v��B@u�����w@x�}�;:c@|��o�'@�g��sg�@��=Q��@�+�Zݦ�@��b(��@���_��@��:R�@��F�f�@��y�4,@��{i��8@��ܩ��D@�" �"l@����g�@�D*�ߪ@��b���@�y��Մ@��
n��@�R�_f�.@�Z��@��{{���@���0d�P@�8ݚ�@�DGW�&a@�����X�@� ;cd1p@�E�n	=�@��1���n@������(@�s
Q_#B@���z�l�@���{� @�4��/\@��{ԛ��@��7!{�        ?v������?��#�u9?϶�H�??�+Y��/?��魒@ �q]p�@
J`�Y�@)MN��@���Cr@"��Ķ@)M�J��@0ڐ�Ae@6#����@<��4�,=@Bb<�p�@GFZ��+{@M%W��3@R����@V+i{��@Z�w��8�@`A��G�@cr�����@g�l��@k9�=f@o�#1ׇ@r��r��@u|���@x�p�Yq@@|V��ʷS@�(��Mro@�Y(|mu@���S�`c@�`��<9�@�>fy�4@�\�u�@�_��]�,@�4�� ��@�/��6@�Q�N�hL@���.�b3@�~�s��@��wG[�@�E�m���@�ǲ��V�@�c؀k@��U<O@��-�7y�@��׌��@���"�x�@����G�@�V#��?@��0Зq@�&K�7�@�}򏨻l@�縟���@�d.��n�@���@�@��h�O�@@�OD�_v@����V@���aYK@�z�'��I@���i�VJ        @U
�J��@Qٰ��1@pv�I�S�@���[ʊz@��:�?��@��o�N�@������s@�[�e3�@�����@�d��5�*@�e盰�@��?( y@�� ��@�?���@Ё~�J'@�
��2@���O��(@��Gj�@@�o��l�R@���f�@�	g�D�@�/�I�@��G�7@��v�3@�
%&�@�#��@�ѦE���@�tþ��*@�2��|u@�k���@�?�#��@�KM��x@�P2E9��@��t�ק�A �E�S�AֈP,�A1xUCc�A���iN\A��$�A�#@�r~A	O(RՉA�G�}A��p��A�P�7��AM6��.AO`<i�A[�LSeAr���k#A���_A�'��b:A��bQ��A;a"�uIA�Y�WA�-�$AD��}l�A�]|�A*y�{��A V�O�"A!
%�}�A!��'��A"�<���A#� ���A$m����        ?g#�AL�?�o�(�?��M|��?�=�	��W?��1),@?�;�kOn�?���ħ>?��ey�w@ M7k�v@�Hi�@	����@�bv��1@�4�ӛ@h��r�@3�D��@[��n�6@!t~+��@#��>S��@&�#�?�U@)�����!@,Ȃgá�@0Y��R4@1��n��@3�9�;��@6'`� +�@8y(w+W@:�Կ��@=� E�\�@@=@D��@A�#��@Cf!O��@E$�C��8@GW��I@H�/��v�@K�e�A�@MT���w@O����C�@Q&�y@k@Rd�l�@S�<�4��@U0�4��@V��Zq@XA�>'n�@Y�;��@[��}�[V@]^�
��y@_6���j@`�����@a���;&@b��,�r@c����(Z@d���U*/@e�ëb�@g�&Ȇ$@hH��U�@i���rO@j�U����@l#5N��@m~��.n@n��W�J@p'jD��(@p�T�;��@q���`r        ?;'���7�?}���B�?�f7�h�L?�r��?�T(º�u?��I2w?���_q�?�@ko@���@#d]�J@Bks��@"�k�(��@+����� @3���R@;��A�@B:Q�iZ�@H���
O@N��F�)@S�q)��@Xu�Y�rs@^
���j�@b6TGN��@e�TaI��@i欎��e@nuA�.T�@q�cV;[@t�j���t@w��$M@{"�Y=sR@~끹#	�@����S�D@�ЎA��@�N+/�@���U��@��Z��@�2�7��@�W��t�)@�:��Ik@�Dj;ud�@�v��D�4@�Ӛ�!2@�]��&d@�'9̪@�������@����9�@�4e���5@���^}�`@����/2@�ӄ'u@��L�?�C@�(B4�v@�A0�(�@�~�y$_@�͏傿�@�-�m&��@��0.�Z�@�$�	E.�@����/�@�g�{�@�&M|�l@���n�4'@�����U@���d��        ?[�0wd�?��2`��?�����<�?�E�w���?ՠ����?�̯�\�?��^?#û?��.0��@l�j�]@�{ͷ~�@�J��k@#Ư��NT@,�����@4���~@;��w��@B�����@Hx�=�M�@O�$ӭ"�@T���B@Y60@��@^�"�8@b�\>ȁ@f�sf1�@j��H-K@o��HI�F@ro�eM3Q@uY9�%<�@x��Ξ�@|��#j@�ud���@�:��2@�A!�mV�@��Q�6@�Q:[\3J@�&H 4]@�1���Զ@�;&m�D�@���y��>@��.o��=@���QE��@���Q"�d@�3W�!�@��3R�n@�
V.���@�\EH��@���j@�3ʗ��4@���aV�@�S�E�k�@� W�Ӥ@���o ]�@���63C@�~*�x@�>P��V�@�H[���/@�]W%��>@�}P:x��@��B�>@���@��K9�@�i�BJӸ@��[Z�P@�0[G��        @�3E�}@=x�����@\|�*ib@qY&���@���k2�@�R�A�@�#��g��@��Ix�@����郟@��z��$@��nN��m@����("@���4~@���?ux�@��=<L��@�k�ۺޏ@�U��H@����F�@�nQ�r+@�/���M@���@@�5��-~�@Փ\o�(�@�"��ئ�@��L J�^@��26��@���s�I@�Ak��bH@�wU�I@�o�"�@�/��GC�@�rϻ� �@�޷����@�uٜ(i@��>�@�~�#�@�'� i�@���9���@���.�,D@�m���@�aV�|�Z@�p	aT�@��)��A �@��A!�:�Aa����jA������A��N�{A{�U�OA�	��1�A
�V��^�A�E�3A��@�A�]7MA���z�A����tA� �I�A|�I��/A~��P�A����j�A�r����A��
��A�= Jz�        ?�t�VBx ?�ǣ�Co ?�g
�O?﮹�?��;��@�7K>�|@��ğW�@b�'�!@ d�^��@$��.�)n@)n�v'�@.�O�*��@2j¤���@5���Q�@9)��2�@<�L�S4@@}m�y�@B��w�
�@D��	�@GdZ���@I�����@L���IK�@O�"q@QO�@ⴆ@R��!��@T�Q�E3�@Vc�a۱�@XI6�Wc�@ZM�zHy�@\se|�@^�үe�Q@`�R�1�=@a��@c/��Nn�@d���2@fr[��@g����$@i3#��.@j����A�@l�]M48�@nbw��8�@p9�|�@q��#�@r���+3@s��wx@t,LY�
@uE�:�˽@viA���R@w�l�7,�@x�F{�zi@z����l@{W���Q@|���z�{@~��UIG@mc��P�@�n>���@�*^���o@�����]@��r�_K�@�zsͻ�@�I�!�j@�4��	�@��дR%        ?y��۞ְ?��Ѝ��G?׮wW�F?�n��`�?���:�[�@�W����@B����^@ �DEw@(Cq��@1!���G@7�4�\�@@#��@E�Ã� �@L�j���@R�_��1%@W���%�@^10b�@b܈u#��@gF�wfW@le=*F3�@q"M,!T@tx��tW@x<fU�@|q�x���@���� ]@� �W�L�@���v&@���Py@�D$��@��X�ę@�ŀ���@�Ē���@���x��@�G�<V!@�yӭ�� @��z?zj@��D��[�@�(����{@��R�{j@�����@����=�@�ch�H��@�%��_!�@��+MRF(@��0q!t�@���`U� @��H��m@����tv�@�֒�{�@��͖-@�Z$���@�����M�@��w��@��?�CI�@�.oXjZ@��	pjt�@�a+��@��7\@@��I]�+@�活`��@��T��/�@��CD�\@��	U�#        ?n깩��?�Xo��_�?�7�H���?��YN��?<yS ?�l�Y:�M@�ۉ9�@�jW�~@�C�P�@!�n�j{�@)O�@1���y��@9�� l@A?w����@G@�H@N�Y��
@T3n��@Y��
�dU@`0�?@c�S���@hQB��P@mT!���@q}?���@t�����@x+���p�@|;.�@�.V�?��@���,�@���h/@����4@��F��L@�:��e��@��.܅�@���-��n@�����@�����s@�D���+�@�� L��@�Q���m�@���z�B@��Y�B�@����"=@�*��"FU@�� �jjJ@�����BK@���0i@���)��<@�����*�@�o��2�@��_ot@���+Z�<@�
63/ @�Y�����@����u@�%�Q72{@��/��@�1U�'�A@�л��sL@������@�##�d@��d;1-@���`N�@���a��        @*��]�@a�S�	�V@�ɡN��@��/�c$�@�ʠ��p@��\��@�
�z.@�T�f9�!@��)��@�1��[��@������@���T�@�Q�*�3u@�%��f@��'W>@�����Z@���򪙥@��j���@�[�y�]�@����Ø�@���aTv@��C��<@�؇ l�@�a����|@�ɠ���@�Ti$[3A �ߺ�?A��:N�AoY���A~^+�A��}�OA~̱��'A
_]���rAYJ���Am$w�AM�lI�Ar��܋�A� ���A�8�IA4
j�uA��L6�A�*"��As؊��cA���35A���A3��(\TA��E˲A �|��gA!�8����A"��EB�ZA#���oA�A$���l�0A%���i�A&���̊A'��[xIA(�S'w·A*!�N8�GA+T��K&A,�ю��A-��Ӭ<A/#C�[rA0<��LD�A0�ht*N        ?�#89Cő?�tj��u�?���a�=W?���@�?���n�@g����@��B���@/�����@��6*��@$	�3Fc%@(�_;ӎC@-�IG���@1�N�*3�@4�����v@7��t�|@;v��@?+��C@A���(k�@C���g�|@E�v�EW@H"����@J�θ+F�@M�ԋ%�@O��	M�@Q@\��@R�l�SBL@T7Ⱥ��@U�)�� �@Ww1��@Y3n쇢�@[X��k@\�Ox��S@^ߡR���@`vM�l��@a�Mm�XZ@b��j��@c��c�5@d�hi��@f;4'P�@g���
�@hߋw�@K@jF��� �@k���8@m@Z��W�@n���\@p;�}�!j@qU�-@q��Z+@r�&<�h@s�����@t�tN��@u�ny��@v�R�i@xL=� �@y9n8�[�@zi���r�@{�ҥ5��@|��0�:@~<���|�@��Ns�@����O@�<���:�@�������        ?:e�?tn����?��K¼"?�e�ّi?�'�K��?�wG��?�9G/į@���BI)@����@8���j�@'�.��"�@1�[ЩbS@:CV����@By����Q@I*R߾�Q@P����?@U�┘X�@[[��Y~@aܐt�[@d�W��@iV�\^5�@nT��.��@q��a�@u��r�(@x�h�,o@|R��2:@�<��mQS@��"��2@����,R@�����̓@�s1�K�@���U�k@�b6��!@�c��q@����&b@������@���9Ɂ@�4��d�@����^|�@����_֩@��h��H@�!��t@����;�@��<"��@��UI鹍@�I����d@�ޥ�@��p��*@�����@���#ߡ�@����B�@� �HDo@�$pB�T@�S�4$k�@����f��@��#�.A@�2�J�ߓ@��DE"�@����@���6y��@�<I���@���n�'+@������        ?|`�
�9?������U?�&͂&%�?�G�Z��?�s�+߱�@�h��@4qlPE@R*h7@�qe0ё@%���m@/0$p�y@5П��|�@>E�$h�@D�5�>г@L$o+�?@Rҥ^�1�@X�oϬax@`-튶�V@d˩�?�@jc%�M�@p�7���@tz��kV@y	�?b@~bMԏ@�8�E�@���$@�@�x`�4K�@���R�|�@�3�Y4��@�­��K�@�����^@��P��=)@���̨#�@��Ÿ��@��˦#y>@���KGb�@��l��z@�h�x��@�A{p��@���H>FI@�	~�E��@��E�%J�@��l�@�|� Of�@��|�,�B@�e�t��}@��M�L�d@��=�r+@�.�1�@��;�T�@��I�!�@�@e-��@�4+��@�0ƻ�@�6��@�^@�E�_C%@�^����@Ɓ�3��V@Ǯ���@�沀�S@�)m�{�@�wO/�P@�Ф��        @,�T��s�@c��c�@�"q����@��>�2R�@��/�T%@�s��5{�@�B�(G�@������@��p�q˟@��b}�M�@�yL`|�@��7��@�$d��K@���]'4�@ܡW(�B@�b����@� #�UI@�����]+@�gi;w@�峱�@��^�U5z@�PR��@�^�/5/�@��^��Aa@��s^�	�@�lj6�^@�E�'�@�5$z��@�:�a��@�W�ܻs�A E�I�Ak�YO�A��ƌt�A�"t�l�A'h��r�A���XA�g3A	Z���-A
�0��'Aq�M���A�1��aA�����A�|��sA��%��4A���T�]A���g:A�G����A��a��A��?�B\A-�>���Aj`��oA�m9��A�
��Aj&��EA�S�jA )n`�A 퉈[jnA!��>4AA"�	L9�A#d�w���A$E�!���A%.����A&� �ĭ        ?��{}�6@��6�-@��{2��@'t{��+Z@3VJ�c�i@<ƲEo^�@D�x�@J��>H@P�<���@U*�P*@Y����`@^�[���@a�l؁@d�ָ�0Y@g��D�>@kI<%>@n�^���@qd��w@r�5W��@t��q�@@v��K\�@yl����@{D���N@}�I�8��@�/e?X�@�-�B��U@�o�(�]@��޻n�v@��Se@�oT[y!@��-t�}4@�E?�(!@��f��Z@�:M3�@�������@�I�"�@�m`��@�8��l��@�����@��J[�W5@��X��t�@��l)�@�W���@@�1��碗@��P�#@��Wm�F@�͟�嗜@���ث�@��	�	�7@���U�@�k!�RQ@�Y��}6%@�K3�@�@-�Ϭ^@�]_u�@���-��@��諍�@���d�~@� �i�,@���`��3@�.���b�@����%v�@�E5�}        ?�N�u��C@��_���@"`,���@3���"�@@X�I)@I#����@Q��b���@X�Ib�@`�24�@d�ǟK�@i�jp@p��I�@s�F3O��@w��YX%@|��Ps7@���qt@�E=�ă�@��U���M@�*�I��|@�z�Y��@�1`S���@�?���P@����:�@�{�BBߨ@�ڶEf/�@�.KЦ@���l@�~��v=�@�{_���@���+���@�����@������@��0���@��jkI1@�̀�C�L@��%�N8�@��Hg��@�]O$��@��f�d~@����0	@�$�/t@�O�$1I@�{ü/��@ƧB��@��o� d�@���� ��@��o��@�B��$�5@�cc}�m"@̀�rpwy@Κ���O@ϰ�ň@�a���@��;i��@�n�%�"5@��U0�h}@�v��n�@��b�1�@�|(���@�����u�@Ԅ>d�(@�
�91�@Ք:D9�        ?|41��n�?��u��?ҥX>٧5?������?���F��@�@�.�@GKN�kW@�^s�Z@#���,fO@+�"f�""@3M��Qj�@::\NaGu@A�~N��r@GI�����@Ny%'@S���8�+@Y,�
>I�@_��ͪk�@c�ե|p�@h}�L:�@m���=Z@r�"q�@u����q@y�v�k�)@~ٲC��@��?L��@�B���}@�F�_�<�@�����@�,q<%��@�
�mr�@�&�C���@�m�93G@��Tj�a�@�{*=�<@�D2��i~@���$8e@��f���@�V��k X@���9��@���fmq�@��uI�"�@�ފ8���@��t���@�0�c5��@�����@��N,�<@�29ϴ,�@�.�@���I�0h@�@E�
`�@���a&@�7�(��i@��/���@�f�I?�G@��!�h@�gS,�Y�@�LW�_�@�7��x	$@�+bH)�@�%L�=>�@�&�ܑ��@�.�λ        @�$�.��.@����GM@��˳��L@�����]�@﷝�+�@�¥����A ����A��h���A	0���Aa�a�A`�sOA���	AN���q<A �a��DA#[�O�m6A%�+�m�A(���V>rA+x{x(�cA.r���RA0��-�{�A2g�i�xA4'yV!SA5���mA7���oA9��U��A;�0d���A=�sЧ�A?��wh��A@����"AB�❸�AC/��AD_Bm{~/AE����D�AFؙ�7iAH �4P�AIp���AJ�<�� �AL$�o��xAM��/~#(AN�����AP1���L\AP�D��AQ��}���ARm�b�AS1j���AS���.�#AT�ZT�*vAU�#�0I�AVbZ/���AW7.֨OAX�s֞AX왿AYͭ�-�OAZ�]O�A[���A\���DU0A]���<��A^}S6��A_|�8�ڷA`@�S�R�A`�6@�D�AaN�R� Aa�|�0a        ?���}?ą�] ?�B�?�^��nE%@�����@-6{��@9�iŌC@�K�(@$S����7@)�$�gI�@0��]}@3�G��v�@7^@l�@;|�$>@?�z�^�;@BY��e��@D�X���@G��kɾT@J���8p�@M�r��@Pn���wt@R(��#(�@S�F
GS@U��@E@W�г��@Z�-1�@\V
c9@^�[E� @`��9�p�@a��+�	~@c;7Y��~@d�D�e&�@f ��NF@g���@iL�{�@k.��G�@l�=��N�@n�Qne�A@pM�Ч>�@qQ�^�]@r_Ԋ�\�@sxXF��.@t�z`;�@u�KV�@v�&%��@x@r����@y��'Ж�@z�&��@|A}R��@}����Z@ �7i�	@�PL���@�����
@���h���@������y@��t���T@�^5HY�c@�<�x��@�z}���@�bx��@�����@��W�(�0@���/�        ?�8n?͉B*Z��?�.y�5�@���"m�@J�q�@ �'�#��@(���O�@1j
.R}@7Pt�3��@>\�Y��2@CiT�$�@H����@N�{��7.@SO�U@W���n�@](A���d@a��W�V�@e��
�@j��7�@p���0@sA����@w����@{Y�-�@�(˷Gɜ@������@�/�j-]�@��eɳ,�@�Ή@~��@�$�'��b@��<֐�@�]fZ�k�@�`�+v��@���IQ�@�$P�I�@��^_��@�<�@?J,@����_��@�
i�;�@����2}@����/eQ@��efm�@���,��@�O���n@�6�h�P�@�>1���@�g�X�]�@����Ù@�%	Zm@��͋�@�=%6�7@ð�+-m�@�9#lt�@��`��5I@Ȍܸ�@�W����@�;1s�@�6�J"�*@�%hd�@�<^��@�_��@ӏ���@��ڇ�@�v��A�        ?���Z�P?�:���+@�xk%A@���`<z@!@�g��\@*{��@2��I4�\@9~*9依@Au3��@F��l��@Mp}�6]@S�hB�@X���%V�@_�-V'|�@dr
�T@ig���F�@oϜK,�@s��1�G"@x<9]���@}{��vʦ@�ÿF�>@�7��&y@�!��{@��52�X@�:u��SA@����O��@� �K�!/@�Y�����@���s�(@�;���@�7?�4�x@��3�rc8@�.�0�C@��6h�
8@��ӞF�2@������z@�VhKJ$@�1q�GE�@�,�-8g�@�J'?I	�@��W�<u�@��Ձˌ�@�y ?|R�@�$���v@e)K�@�&Wm�@Ŝ�bؠ@�J�Yh�@��^�_@��dz?y@��G�F1�@��[gA��@Џ�D7�@Ѳ�A@��7QQ�@� #j�޹@�l���@�Ǫ���;@�1���dg@٫�F��@�5�7E\@��ʭޗ�@�z�gl�e        @P���@y)^���:@��5���@����&V�@��
�+	@�?3e���@�3�eȽ�@�J�h{��@֮Y�c�@��:����@��E��@���U��@饓>8��@�(;�؆�@�~U���@�6���R@�(^�|@�B^if��@��Y;x��A ��g��A���^"Aɴ�1cA�'fjWA	�`ՓA8���9�A{/�AG���A��=�Af�2�A:�QRx�A(��_XA1�VQ]AU�T�]�A��
�� A w�����A!���UֵA"�G�ɳA$Q����A%��v诈A'*���A(�sn�A*<�F,A+�+k�?�A-�����A/Lf'WbA0�݆]A1}��	�!A2u1�FMA3t�7��wA4|�K�tA5�,i �A6�h���mA7��X�
A8�b����A:����A;Vy���A<����A=�>)�'A?)DenG�A@>�y~�A@�ò��AA��tABOm���y        ?��J�c�?�O<'�.�?��L%X�	?�/��&��?��Cm��@�΋(�	@��wq�@�)6(@�0\@:@#s�K�T�@'�s'�^�@,��tH �@1ݠ�@3�>Cv@7�
A�]@:vCeD��@>�O��T@@�P:̀�@C �
~I�@E+*Ct@Gt�D�@I�1�SH�@Ld�]�@O
��c@P�y�D�C@RX���wF@S�nr��@Uh�p'
�@W%�ՌC@X�#�@Zr7>�@\>�?Q��@^����@`� �\�@a *�5.1@b!����@c�V���@d&f&AD�@eB޼t�e@fghK�/@g�/8N��@h�eW�M@j@
�3@kM���'�@l����[�@m�2�>.@oZU7�3@pc�R�@q�.�j�@q� ý[@r���;]�@st��S�@tG�z��@u �n��@v )���@v�(�F@w��NB@x���M�@y�'YR�|@z�!3hf4@{�<�hc@|��89�@~ �����        ?@2P�D3p?| M��.}?�W�Q�?��/� ?�'��V��?�bP�	�y?�oaɁ�A?��4�U�@Sc%�p�@�Y�4�@"Li��uG@+��5�O�@4�-�%�_@=ZߵE$^@DMt�XF�@K_@^@�@R �$�I@WR�%pC�@]��L_@b�H��@f݆'�\@k�O2CM@p��$�H�@t߇\yR@w�s	p\@{�(W%�@�/}=]U�@���ޕ��@�|��o"@���w/9�@��eJ^2Z@�x��l��@����)��@��Krɻw@�,��C�@���شs�@�2�����@�bp��@��ͻp��@�(�t��U@��x���@����Z�L@��@�B�@��;n܇�@�"P�-�@������@�����@��n`�mC@�S4˘�k@��N?lhQ@�x�ˀ�V@�/1��xL@�����?@���!<��@������@���f�e@�'W��M@�U��Ex@Ô"�(,X@���C @�B����1@ǳ�&�V�@�6t8T�u        ?x}x*KP?�|��?%?�_���?�N%�C�?��Yц(?�Df+�o�@]k8���@�v� G@b���@"6Y�д @+T1Sh��@3�l�HV3@;�:!n.H@B���~@I<xwA�`@Pq�rdv�@U����w@Zs�
��@`e��}�p@dCv��@hK�ַu@m;i���@qMI8��7@tf5�K�[@w�.
F��@{�Y&�V�@�H�K�@�}G��e�@�*mɊ_&@�2W17M@�X��]J@����t��@�[,��@�n%�" @���dr�:@�0�%�@��z���%@�X|��>@���YM@������@�Hr=7@���A��)@��� ��@��1���@���K��@���'sT�@�Z�̃�@���'@��I�Ϭ@�>��7��@���@�
�b.h@��+�/�o@���E@������@�f��S*�@�-�TY�@�y�Hbd@��Y�D��@��ܯ��l@�S���b@�%��WK@�IZ��        @.))��ߌ@b/�K�K�@}�h��-H@��S�@���D�R�@��rt���@��jk��@��ET���@���W�5@��;�pF@�e�H
{;@ȆC�ZfN@�
	lү�@��%X.�@Ӡ'���@�zx��@و�#��@��k���7@�!6� k�@�����_�@��bX�>@��5.:�~@������@�PWy�n@�k�{p@��g��@������.@�<�Z'u@�{��=�@����u�@�Z5-�9�@�ۜ�-�@�i2�9<�@���w@��9����@�[����MA �v5A �&��ưA�7�0��A�2��M$A�U�Ԇ�A��A�L�A�4j6m>A�.<eCA
G�d�A	-��T�;A
Z6j'o�A�%k)�A��⬑A�EA��AnbRj/�Af�kx6OAj`��,A��T(64A�1�i�A`���A//N�@%A;���A�^&�lgA��v.�A�<I�k2A���ܝ�A���w��        ?~�`����?�;�!j�+?�9RThy?�����?�%�?����oE@�c��|@ϰ g�i@�.�ϰ�@{0'җ�@v%�
%@ so���f@#f���!@&�إ�ik@)��D6��@-�#42@0��7fǇ@2ǚ�NL@4���\��@7,�M�i�@9��f#H@;�G�q� @>�(�5S@@�t��@A���~�K@Ch)X��(@D��[2g@Fp"�f�@H
v��q!@I�Wv�oF@Kn-�)��@M8="�-�@O�Di��@P~��xx�@Q|�%��@R���
c@S�G��E�@T�EQk��@UǼ�+!@V���@X SR���@YY��0��@Z��K��@[�I[v�@];�W���@^��.
�@` �}�<v@`��1�I@avN7M�7@b8=�@b���[$7@c�?�Q�@d�RE'{t@eo%gA@fH��e�@g'f�u�@h!�	N�@h�/�L�w@i���9�j@j��x@k���D�@l��� �@m����        ?�
�ݲ�?��<O���?�@,~	 �?��-�<?�o_��@�A�L@ك�Ŭ�@i"��Y@!��F+�@'��Q�x@/��%@5�'��@;�]�c�@Bv��d�@Gi"ˌ�@M�|�:@R��ҏ#�@W�`{\o@]j�Rt��@a��8�c@e�,���x@j
=)�Iv@n��2�@r�����@t������@x+ٟ�@{�´��@Yb9M(%@���~^e�@�њ�y�s@����h�@���hk@�$��(��@��d�@�j8��D�@�����@��٘��@�] =�@�7<�+@�-�uL�Z@�A����@�u���@��~��$g@� ���W@�n�ޘ�@��>0�@�CR7np�@�˜��Ϋ@�h�[#��@��a�K�@��co�v@����c@��1���@�����@���rb�@��&�_@�E��8�@���M�i@��r�-�@���5@�~6��jK@���@�mT�L        ?E9��z	�?tϳ2[��?�`c�ʔ�?��M?R.?�cb���?�X��i�?�WO-�?啻*$sD?�5����@ k ��@
�y|�1�@EW�jD@ .ml�U@'�A�j�@0��]��7@7�����^@?��0��|@D���@KwK�@Q%�3��@UY�'�@Z'�Xop�@_��L��@b�}0�y@f.	���e@i�jh5W�@m�Hx��o@q!K�y@s~����@vָ�@x�����@{�gjC�@~��|E@�#v�<�@��I��@�ݷ�)"�@��~��-@�iR| �@�g6Bݪ�@�ڷ��W@�9��3�6@��Vp�@����Ge@���-ۊ@�2�N[@�廳�7f@��p��ھ@���_{�@��{�)W�@��� t a@���6��@��&fŨ@�D�pL�@��o�i�@��+Z���@�@~��j@��(b��@�=�h�@�طi�!q@��W@�(@�J��]�@�����ȉ@���]�P        @*�ʞ�ۈ@`�h�aq@}�K8D��@��se�6�@���=L�@���U�Q@�],	�@��2�\t@��mQz@�b��@��b?�@�UB�@�C�N��_@�䪑/��@�Ji*V)(@��Ƙ6m(@�}�!���@�J���@�;	"���@�7S��@�B�9ݚ@���#I �@��Q9&�@��P�U@�i�_?f�@�c����@�rF�+D�@�ǞH@��4ߏ=�@����@�A��_�Z@�ϊ��E@�ɭ��EJ@�*�dQ�@��N]��@���W@�e�/��\@���m�@�y�G��A 
x�tgA �	2�$A��)�A�����A|aYg��Ag�}��AY��AQ��N&7AP4��H�AU�/�NA	`�q�LA
r{�`�A���SA�;(�8A� ���LA�k�&��A��o�A��+x�AUa�k��A��{��&A���f�XAM:��QCA���Ȋ�A�2x��        ?��>��?۳�+�G?��4(7i�@y_q�q@v�.�Q(@ �X�@(&��w@0g�>��@5p�S1�v@;"oA5��@@�T��L�@D3���N�@G���N[�@LΥKq�@P.�����@R}ܤq�@T�J�@W�ُw�|@Z@r��1�@]5��@`{0�@a��E��@cB���\�@d��}�#@f���Į^@h�;�Q@jy�����@lq�n�|(@nz��2p@pI���k�@q^=��/g@rz�C��@s����7@t���K�@u����@w6��rʛ@xw�.!@y�xn)��@{a�>-�@|d\Bn�A@}���F�@%2a@�H�:�@����.�@��6��w�@���%��d@�G�@��@�[����@��c���5@���݉�@��MR,N@�Y��A[�@�4�Y�dT@��lfu	@���n��@��L�kY@��e���@��^z���@��/�j�@���q|�@�xd���@�6�����@������        ?d����s?�?���?��&����?�Cc7�{m?ݯ�=���?��]���?�i݅,"I@}�=�&@-Y&^�@U��w�@!\7Xc��@*d���=@3�����@<ohr�s@D)����@K���j~@S���@Yq�|�6@`�U�JQ�@e�a\h@k��4��@qU|���z@u����M�@z{jYK�=@�����'@�h�nɲ�@�/w��@�xUT�@�'8��Ki@��i�&�@��W�y]�@�H0�`@��%3�@��X�T��@��=i��@�^�}��[@��0� @��>{H@�e Cã@����٦?@��\�;yb@� 쇳3�@�C���@���f�@�M�R	G@�[����@�
�u���@¡S8�"�@�Q�6�B@�B͛��@��H�@��3=��@��I&�W@�?����@�D�Y�{@�v���{@ҵe��o2@� �,��@�Y"���w@־�C�@�/�xz��@٭rDe@�7��M        ?or����t?�W6�e�@?���N��?ͽIr�c�?ڔ�c�?�I;���y?��0���?����O�@Uc��O@��e���@���;@��Uc�@!�4�_�@(mܰt�%@0����1�@6��{+��@>�%�r�@C�m���U@Ih0� �z@P1��*X@Tb���3�@Y[�7�މ@_2o038�@b�7�*C�@f�P�X@k`�<��@p9,���@s��[D@vE��>%�@y�~x=�@}��5�,@�	�]h�@�f��rG�@�����<@�ķs�l@���Fm��@�~�aL$@�A���@��o�Z�@�|c��@�1���@�k��'9�@�ź�N�@�@��l�r@�nd�Z/�@��R��{�@�=b�/�@��۟�s�@�R��k�@��1���v@���&3�
@�x���@�U�K_p�@�F����@��ȼ�	@��6�)}�@�ǥ9*]?@�裩�V?@�r�C�1@�KU����@�������@��a!�o�@�5�_        @B��\LN@vsj6�@������[@�*�5W��@��6���@�0����@�h2M@2@�1�\�}3@����ě@�>�^hqs@��q����@�R=b@�EA}��E@�1��@�Mx��,@�C�=��@�ݵ�.]@�Z�@K�@�D���r�@�F�̎�b@�`}�C9@��!�9\@��X�$��@�<����qA Z���D�A�+���gA�v����AW�w(A�kubO�A:�D�n5A���{��A
L;��YoA��Ri�A�����A;X����A{��Ϯ�A_שAHw=&�A7�G,lA,�)�e�A't�c�FA(4���(A.�踽A;���HANS/�B�Ag64�reA�E�j�A����.�A�ݲ��AC�Y#�A ��ր�A �Y�7��A!_���l�A"����hA"����z�A#Ts�oa�A$ �I���A$�b�R(�A%`�92A&Zkx?A&ʃ3�{A'��ضrA(=���         ?����	�?�d�3.�?�9Xn���?�Ώ��n�@p�-)�@��탞@W�l.S?@eV��@ �;e�'�@%)aBj�@)��>�wj@/�#˧O@2Z����O@5l\��`@8�M�Cҹ@<au+{}@@'][�@BF�ĄV@D����k�@GϦB]@I�[=�"@L��eD�&@O�-��,@Q��!fA�@S\p�Ǿ�@UE��ӽO@WNϪ��@Yu���@[�'�Ջ@^ oYg�@`R��T�;@a��.R;�@c��$Y�@dxw��@@e����@g�?��@i(�uo@jՂ,�:@l���>�@nY�ŹO@p�y8�>@q�H�͡@q����*)@r�98�K�@s�J�Uq�@u��lg�@v��� @w%@��z�@x=A䁺j@yZ�'�+@z~~*Q�%@{�,���g@|�G��o@~5-��@L݂��@�H�BY@��6�c�@���;FA�@�F�����@��od���@��Q� |�@�hw��!x@�'_%�G        ?p�A�?��{�P$?ͫ�R�@�?�X�Ys{c?�s����P@ �D�A�@
�j��g@(�0��@<��@$��4�y@,�k}��@3�ϕ7v�@::�_d�@AX	�R[Z@F�" ,@M	��b��@Rf!tQR@WZ�F9:@\s-N	,@ac���F@e
���}�@i;f\��@nT���(@q�o5:l@t����@x/A�1�@|���%j@�%����@��Ҥ�E�@�'�/fe�@�/�Sc@�G�O`@��z�Ђ.@�XWDKT@�x�u��h@�ˎbZN�@�T�݁� @�>�(�2@�����@��!Y�ڙ@�m��%@�S/ � n@�_�;��@��3���@��ס
�p@��@��g@�!2y��@���K��~@�,�%���@��_�Msb@��f�v.@���/�-c@��~�e@��,OKAi@�3R"�K@�����lM@����[�@�lFdf@��9	� h@�_n��Q*@���10L@ɟ(�Dը@�[�m�.�        ?x�����?�9i�3�B?��r�"Y�?�u5�`xn?�({dS�i@�V�8cD@�~X@�7+`�@"�)ǣ@*���h��@35c�k$@;6���@B��h2@IݐӾ͆@QZ�\	�(@V�6���7@]����Q@b�[�&T@g舒<+�@m�ٺ�z�@rA�g�g@v-C�z�@z�7J\Q@�{w�@����3*�@��קM@��W��h�@�~p�$@�@��?�ԓ�@�S����e@���%"�@��'	�@��f,?��@�=r΃N[@�k��+nY@�Y�Aa$@�jv<�)@�����@�����9@�pMbg�@�hvq3U@������#@�`Ҍ�c�@����(�w@����u��@�7L�h�h@���R[[@�ԟ�/@���h��@��&7K�@�l�hx��@�����@¡��=�@�ˣb.-@� /hݐ'@�??k�F�@ǈ���y�@��,fŵD@�<0����@˦�k��@���'X@Κ����@��`�*�        @=�Ĉ��4@p�^�y#@�� �/�@�-6Z�+@��n	�ݸ@����A��@��&H*�Z@���qy@���$X9�@�/�1F�@�Ռ���j@�ܵ/��@�K���@��1��a�@�>����@�)!�a��@�X�1��@���o��@�O�d�u@�b�v'�@��0��C@��h5�@��.���>@��y��m@���6��A�-��q;A[$RY�AGN ��CAT����A	����'A��!9}AKyBwh�Ar�-��Aѭ�֏AC{��sA���}A\��JA��B�eA�����A��dME�Afv���AR�D	[�A �X!��A!��T���A"�Sث�9A#��-6cA$�x(�"�A&΍�A'F݄�lEA(|�U�A)��TIq1A*��M^A,K�0ĲA-�L�@v�A.��5>�0A00	~�$&A0��5ƬA1���4��A2a�"�!8A3&�T$AA3��=��A4�M����A5�x���        ?9��L?�٧��o�?Ӝde)�6?�+ߪ�R�?�l���<@%��>>O@	
;�ksg@.1j��4@�c�E�@��A��@!�#NQ��@%�:�ʥ@)�kǲ�`@.Q'&\��@1��i��2@4i�$�O:@7byo�[@:��Y^(�@>
�?�W@@޺7�z�@B؇���@D���|@G1;J���@I��j��a@L�ζ��@N�Lu��k@PǠ� e�@RB1o�� @S�=%�@Ur�{OW@W'��`a@X��n��@Z�,����@\��if��@^�'��{`@`sX��0W@a�{�Vœ@b�����O@c�O��l@emzH�U@fdF} Dr@g�h=�9D@i萪̧@j��^ƻ�@k����n�@m�j���@o���7�@pY�Fͮ:@q.�w��{@r	,"VtC@r��n@s�d�@t�K�p�@u�1��۟@v��h��@w��W�`�@x�׹�@y�&T��@z�ke�-@{ɐ��F@|ߏ��-�@}�nB�.@B���c        ?t����?�M�ͷ��?��d�O��?�٣U�1t?��7u[
@��B@�@J=�VXO@�q#�W�@"8nns��@)c1�/�@1f��@7��ڿ@?����-�@D۴)��n@KLBH��N@Q�&�ѹ@V��i��@\��G�S@a�0�۪?@e�alP@j֖�< �@p6zd}@sd��ó�@v��(ey@z��ʈ:�@qW���@�,��	�w@����@����2�@���I9o�@�g�ph��@��"g��@���{l@�(e}�J@�mN�ox6@��˟��@�lJ��U�@�)@�=~@���B�j@���3X�@�3�x��@���A�@�����B�@��a��f4@��ֽHIS@���!�X�@� �8Kۢ@�+�V��!@�en[��@��I;���@�ҞX��@�o�-��G@�� ���@�t
S�u@����Z�@��gJ���@��Wn�@�,�U5�@�!�G�!�@�!b����@�+wm�@�@R�LIO@�`0v%��        ?h�{lkE�?��@]0�p?���j�?�������?�%���?��
�Ö?��_q�@/u�/��@)�V�t�@�f!�wM@&��@1:��1�@9]��u3@BCLF�s@I�93���@Q�$N�ԟ@W���r@_�y(���@d���0��@jq<��@p��C��@t��gB@yqrsT�@~�]L��@���a;B�@��7����@�ۋ��s�@�*�4{@�t���¹@��K"�@�� (P0�@���Rkk�@�Gl9ed@�k�2"P`@�T����@�^$���@��_l��@���sa�@�D�i�]!@��9��X3@�E23ǽ @����Z/3@�-޿4H@���~�F�@�]CN�@�j Y��@�ӧ^5�@������(@����D��@������6@���f��@�ކ�=�@��䃕4�@�8WCT|@�K�ƽ��@Ƅ��}ڍ@���#[@�Wt��@�o��d�@��_*�@�D���u@@���`�PK@�$��y        @!$'	O�w@Y��9��@y�����N@�P����G@�y�V��@��ħ���@�i�!���@����; �@�f��(D:@��]�3�@Ⱦ�d�=�@�q>�� @�3`�� @�T���ף@���ݏ�@�����<@ਸ਼
��J@��u�I5@��4�2�@�h?��nR@�m��m�@���y@�[�M!�@��r��U�@��%���@�-t�jJ@�}���	@��vg���@��A��A ����(,A"1����A�k�Un3AJd[��A�����A���i��A
�n�7A��ᖍ�A��,5�kAQ肷��Ai�ݨA��(.��A��^�A�OOA4�1�v�A�@@D��A�l���A9֫_.hA�F�Q�A�M���A�r �A (z�_A ��!K�(A!�p�A"a�f
�A#2W���A$3K %qA$�&�%�HA%�
�6 A&��Q�y�A'~�AA(f���A�A)S�TZ�bA*Ed!�װ        ?c9ׅvw?�'��=��?�2*��?вy�}"?���mv?�u���j�?��kR��?� �ҡ@���@�u@��

�@��
�@3HS�.@\P(�@ =N��Z@ �b$�b�@#g'���@&�t��BU@)�8�!�"@-���&�R@0��V@2�4ZU@5(ȗ�9�@7�:�hR0@:>N����@=�Z��@@��@A�i�F@CR��@E 1�GK@Go$���@IO��@K,�x`F�@Mj<a�&�@O�C@��g@Q �,`��@RoO�"�@S�큊z @U>g�v�@V��%�@XS�)�@Y�ܣ��@[�?�� �@]v7R8g�@_P$�1�}@`�v���@a���㡐@b�;��!@c�Ϋ�@d�b�k��@fҗ��9@gSA�2� @h�~�[@i�EӔ	@kj,1r �@l�0�N�@nu��@p
f�.�@p�z�]@q���ff�@r�6�y�}@s�-+"�@t���:�@u��M���        ?J��ː+?��f�S�?���R�W!?�����?Ж2��-?߱�@��?�D[o/�?�"!�S �@�����1@�����@�`{��@"ת�l�@+�)���+@3�UX)��@;�R�y�I@C���y@I��CE�k@P�`AC�@U��T�@[xtt��.@a$h^N�@e��p��@i�l��3@n�"T���@rKЬ^M'@u��ӣ�@y ~�X@}R$E.@��=��@��SЙ@���V��@�h!ᴋ�@�g��aO@����&��@��2Y4�@��	�'h�@��w��VD@�=�5@g@�J�(��s@����wY�@�@��<+1@�z��Cvd@������@�m��@�� ֺB@��Q�- @��^9�k@�`�*��@�Zj���@�n/ڪ�Q@�N��ϭ�@�s�yr@�@�����y�@��l�@�=�睜�@����\�@�[tZ�E@����u|�@�0����@�گ�3@�����@�4�v��h@�'��ʎ        ?=ӿ(%?vM���?��r����?�`��M'?Ġ���]�?�.�_�VB?�9�xL�?�D��Ç?��ꤣ3@�De�� @��L��@2}m�I@!Ȇx�>+@)}���i�@1��-3x~@8p}���@@eܽ(O@E�1F�Q�@K�g�@Q��:�<O@VKV�x�d@[�	�U' @`�/r��1@d\��d�b@hZ
 �v@l���T@p��|�'@s�N�Ʀ\@v�w ��e@zG�O�[r@~��w(@��8���@�M�۔�Y@�������@�\�c�@�3��q�W@�D:�k�@�ȁ`V�@��m _Z@�uf��]�@�~�T|y@��ѽB(�@� �y|��@�{�텀�@�|��9@�x�����@���:��@�����L@�>��Ƶ@���'��@���@���@��q�L�@��G�z@�&qy�,@�U��q�w@��Xl[�S@��a��.]@�IBDH�~@���~�@�F����@���y@���兢@�W�e��        ?���5.@7��A.b�@X���%�@o�V-n�@~�Q��]@��Yː��@��.TY"	@��mS�@��a��_@�P^�� @���.��@���u~@�`�߻�@���}T@�UaZ�u�@���_i�@�*Q���@Ɂr�˾�@�%���m@ЍtJ�|@ұO���@���v�@@׀wX�>�@�/Ǘn��@����)#@�J�U�@��>��@�}F(�!@�\+8�U1@�X��c�@�q���,�@�A3��S@� 	��,@�;rc��@�~hc&�@��ǱY>@�S���9 @��S�@@�iY��e+@����I�@���Ўf9@��V��	@�p��k��A /�cS,A0�e�TA; �M	FAO��$��Ao��d/rA�8dwA�.��.A��t�A	lK)Y�A
����%A@���'�A�,B�AS�����Az�y�AS��ǪoA4�v��ZAxiFoAI�ׯ�A���m�A}�HU        ?b;����3?�<� �?���B��?��c%�?�n+�gA,?��Z�8E?�J*P�?�J�Ź�#?�Ѷ�CO�@_�]�H@3��$f�@	�}"~y�@�*=�U@���f}�@ڀ����@�� 3��@Gsu�6�@ܯ��T�@!\R�ޟ@#o���l?@%�Xr=L/@({���Y@*��2��-@-Y��D�@0)�.�v@1��X"	�@3@Ml��/@4�;�gM|@6�ޠ�>�@8����@:�����@<��񑖜@>��eM5@@u���IX@A�:5-J�@BҗO���@D�[p@E_��q�h@F��K��@H&_���@I�|{�~�@K�C�i@L�:)Z`@NAu�iH�@O�$���7@P�F� 9�@Q�D��0@R��յ[�@S���d@T������@U������@V���b@W�5d-�@X��ֽ��@Z��c��@[Rӝ^@\�� �@]�eV.�@_W�V�@`8i�{
@`����(@a����lz@bP�_0�G        ?&f�d?bA��s?�.6#��?���=��?����D�:?ɜLy�?��t,��?�}s`�,?�٘`���@����AD@����@�k8�i@$��|�@.UY�&4@5����t@>H�� �@D�h���@K���Σ@R�C���@W[��	@]���HU�@b���,�@g��@lK��}@q'�;�"�@t�pz�@x�8,�bN@|�z_�o�@����E�@��]Q�D�@��<;@�Uy�>�@�'	��$@�.�$;�M@�{L-�w@�	�gS�@�Ѥ0 ��@�ڟ4}>@�(��@@�`�����@�S��P@�oۚA~L@�����T@�-dS�@��O!��@���|�tL@�]!�}@� ����@����e@���ߒ�h@��G���@���
 �@�g���P@�j�g4R@����^@�U�
	;@��p���/@�D.Z�l6@����%mF@ȇ!��e*@�IsBD�@�"j���@���U�        ?8+�'��?o����I?��2u�?�%���6?� �<u�?�P'>��?�
s*I!?�.",�?��+��=�@ {��W`9@
a�ի�@P� �f@2х��@%�~ ��(@.f�Y�2�@4��v�V@;�H;:e@B J���@G�է�@M���Ɏ@R�ŽZM@V ���@Z�*���j@`2'!u@b���a��@fI�"Z��@i��-�.�@nu�Z�@q7/��]�@s�,O]-@v<����g@y�3
z@|?s0�B@QVT|��@�b�n��@�9-�A��@�+�{�E@�;<����@�g�Vln[@��&p(� @�9��,�@�N��{E@��1ۆ�@� ̦'K@�q v8�@��䍸5i@����O�@� �Lɣ�@��zJ�^�@��1՚@�e����@�%I��W@� ��4y�@�%i��D@�3��;_@�K��@�@�n4�M�*@����M�V@�҂��O�@�'�rhJ@�cA+^@��,���@�#J�T�u        ?��U_���@3�����@R���%�@f�?���@u{��ή@�^�_��@���"�H}@��~��xC@�
���@�5��D@�] kJ�@����5@��Y!�@)@�[)�%�X@��n�W�@�5[g4@���@�`��+@�\Ƨj�R@�u�av�@�`�%7�@�q`���f@Ƨ���@��.��5@ˁl���@�%16lr�@�v�^R�)@��aXR@�t�N~)@��+��x@ּ�~n��@�}y�Y�@�Q�'F@�9��f�@�6M���@�$���f@�7֐�
	@�V��[�@�}ʦ�@�F�-O2@����L�w@�H٠��F@� �f�L@��0C@��h��K@�{��5@�	)m2@�$&���@����;��@��>!�@��?���O@��\�0@�����[@��N��0@�ͥ��@���,2�@���q@�+t"�?�@�]Gd��@���ikG�@����@�-����A Cʯ�g�        ?��/l5?��2���?�[&
B�@
�W8$�@�eC&@!���&t@(�`�ϧ@0�d(|3�@5=n3��U@:K�s�|�@?��у�M@B�QC��?@E�2��i�@I'~$H�0@L��C�@P!@�ly@R�A�*�@T1N�@�@V*�/��@X_uI�7k@Z� �j+@]J}�[S@_�`o�@a6��Cy@bw��@u�@c�����@e_�y1̙@f�/�<�@h�n� �@j4���@k�.��@m�;���D@o�x�{~�@p�ۀ���@q�Y��Q@r�~����@s����T#@ufn	Q�@v3X]t{o@w^�����@x���Y~E@yʣ߫w�@{�@��@|S�|N|�@}�Ԫ_��@~����A@�+5�M? @��p���,@��^l���@�M$\'Sl@�
�SW��@��)P
@���k�ް@�XB��@�"���Q�@�������@��ԕ9@���@��V@�^�u*_@�0��q�@���"��@�ڜ}_�@��:�w8        ?��]����?�eQ$���?�yQ�_s�@N����@#SI�)@!� �MH@(��f�1|@0P���+�@4���=��@:vdR�8�@@���^2@D~x�bl�@IW�L�w@OH��~�>@SI:+R�@W�G\�0@]2��#�
@a�y�|�
@e��3�M@j�h��@p�=��@s[�=�u@w$#h�Y'@{{� Qp@�5�q(i�@����@����_�@��S�5�U@�j���+@��v�ڠ@��p�@����0 �@�V8![�u@�B�"`t�@�e׻ŗ@��)b�$-@��g�j�J@����#��@��E^t�@���Յ�@���1�T�@�I��/�@��?�@Q�@�/7�z��@��Bކ��@��]ę�N@�v��@�֮W�v@��9�Zk@�N>N�8�@�?5���@���k�@���~&1�@�И���P@�ά0��3@�ԍ�WD@��-�y��@���-��p@���_P@�9#�Y�@�e\%�@ə%���}@��wB�         ?���nX��?�@���K@I#���@!��`R�X@.�d�=�@7���\�O@@T��|5�@Ec4�+�f@J�%o�y�@P�s�jy@S��b���@W��#��@\L����@`�zN`,@c�65
o@gZ._v#@k�y8'^@o���u)8@rv����@u��w�Q@x�:���@|����#@���9�'�@�6���@���/<�@��%h���@��M��@��Ạ�@�˖�c0�@��AmL�@�(�B�l@��tO�	@�-���@��!n��C@�q)(
4@� d��N@��*^��@�e��#ś@�<�p��@�,��p*O@�5��v@�X�8R�@��B8��R@��f��3@�1�І8@�zIځW�@���C�F�@�97��h�@���M�s�@�9tz�2(@�ӱba��@��Q��@�>w��"�@��,p^@��X\xm@��@Q��@��j� ��@��n.@�~���@�<P	~P�@�e9�l@ȗ(ژ�@��߽��        @jʪ�i��@��G���@��5����@��,�@�y��+�@����+@�<�=���@�Y�MU@�%6��2@�u��B@�,?l
@�fN�~�e@������@�%�F��A �V�ej~A�eg�A�6DD��Ao�N�f�Ap�k]6�A
����A�H�`�A�+V�^A�� AS`A�H,��
AI�2��A��I���A0W;DZnA�Jn��Ao-LH�A2ŉпA٪i]�AB	���A �ٺm�rA!��N^A"�މ�h�A#���e-�A%=Q�)ԼA&��&���A'�tu�~pA)V$�J`�A*�����.A,W~�A-�=B��A/��oe��A0�_�\m�A1z<�RmqA2\�,k�A3Es>��A43�E(�UA5(%�:��A6"s���1A7"k�z'A8'~��SA90�[�DA:>?�GA;N�����A<a�����A=w	���A>�� �A?����+A@`21��A@���T��AA{���W*        ?\e�KY?�v����?�{��e�6?��� �I�?ۧc��!?�o~=��?���R�?���`3�@JO:
~@�hj̸@�Jѽ\�@�`����@k��C)�@�Wy�@)��e�@!�_���@$H�p�n@'69��I�@*\ך�3#@-�L�D٬@0�1i��@2�si��f@4���;��@6ٱ�mϳ@9)���@;��י�@>/nh&q@@r���{{@A��%y}@C\{��e@D�SN�	@F��8߽w@H?��)��@J��&X@K���-�@M�'�9�I@O���Qx.@P� �P`6@Q�F�'ڷ@S��@T41V;!�@Uao��S@V��#�@W���+K@Y(R
D��@Z�U���@[���*@]Y�d�Џ@^�]j�]!@`4�@�-@a���> @a��q��@b��ɵ:�@c�v��'�@d����U�@e�S��l�@f�t�[@g�߱L�@h�mJ<�`@iĂ�;�@j��ݴ�@l�gRf<@mLGŘ�        ?=�Y}���?|8��rj?���ګ�?��M2���?�ԛB�Z�?ړfA��?�c�j5W?�� <��@���gCs@�A,W�@;�b=@"��\��@+�'�6��@3§T��@;�?�T��@B����!@@H����@P9.��@Tv��d8k@Y��)E�W@_i��/�|@c @���@f�R/e@j��\��)@o�;��)g@rF�F?1�@u���&b@w�GV�E�@{1
$q@~��Ā��@�&*p/Ed@���o��@�-�+�G�@�`,�w��@��~~�m@�%M�܈@��\!�4�@���:�ڈ@�$ra���@��G�(F@�4��x@���ba�@��ut�d`@�a�9��@�E���@�@��;R@�)``|�/@�>��Q��@�`2:`�@���4< @���a��!@��8f@�md��~@�ԓ�E
X@�K"5��@��9R�D�@�g�7���@��cр�@�c���Z@�H~��5�@�6��I(@�.zL}�@�/=�n�]        ?M�՛��?���VR?�}�	�<?�o��?�*�lQS�?���N��?�^ۘ&?�P���>�@iVҷ@v�>#9�@�E0��Z@ ,Ć]�@'s�!�,@0�D�v�@6���I��@?�R�C@D�1E�|@J�n�]a�@Q.%��{b@U�6��C1@Z�#��b@`��CQ�R@d�4�J@h��C9@l�km�M@p��5�@s��"��@v�T�;��@z,�7��@}��)9@����rf@�7o��@��n���[@�6��I+�@�X|@��E�4@����譂@�Y�:Mq@�2�eŨv@�+0]ލ�@�Dύ�D�@���o�)�@���Y'@�fxL���@�	��|�@�tN0 �@��c���@���w@��@�8^�o�@��:��@��U��Q@�֨.��i@��*0�lh@��媝$@���k���@������@�/ñ���@����GO�@��C%	D@�`r�2$�@����R�@���e%@�,�����        @ ���5�@8Dϖ�@Y�R0�[@p��m��T@�Xph�Q�@�pg��P@���
_�?@�C��׷@�����S @�f����w@��%��<@��/Ch�@��Ò0��@�F�Wn�@��J��@�X1?A�l@�M f�@ɀ�-K�n@��P$k~�@�T���p2@�Q� �!F@�p��N
�@ֳ��3@��8-�j@۩�]~�@�^@�2A@���،]@� �R���@㸧����@�fM_:�@�)�[�u@����@��갟�@�����	j@�-@���@����E�@�Չ� �]@���{@�Q4t�B@����x�@���"�@�vM̳��@�������@��;��@�(�N��@��M0�clA Q}H���A>誽��A6�)�AzA9�ݡ�AHg��L�Ab�hf��A�v�Vt�A�d�=O>A�^���A
Blؙ\�A��O�vA��3� �Ai9^A�$�zmA�6�A~�o��XAO���        ?�+�<4`C?�2]��5�?�_ͱ�?�H��aO�?��,��3@���@�*����@,�p\�@�	O*nZ@#�SҠY#@(s���6q@-��Y �@1��y@5���_�@8�HI�eN@<Im�'.�@@��zx@B:(K<��@Dr�R��@F�6:1��@I?���5F@Kґ��d[@N���}��@P���@�@RZs�;�@S�b"�i�@U*9��[�@VĦ� �@Xk�g��@Z���@[�ح��@]�=$��@_�"_HN�@`��ܖ�k@a�����@b���7��@c�����@d��:D��@e���#7R@f�?JF@h�n�[@i.adr�@jZ����@k��y��@l�[�7��@nB0#��@oPd��| @pO����@p��uؒO@q��8��K@r_ƺ!�@s��=נ@sֽMc��@t��I؏@ub[���@v/��eQ�@wو'��@w۷�4��@x���@y��F|:�@z�3��#3@{}9��*@|u���pi        ?P��H�?|��ѩ$H?��+óB�?�;�F��?�ѧ!?й���Z?߰�MMU�?��1ބ?�D�W�rd@;��7��@$�saZ�@�I��<@$�F���@-7��a�E@4��B�~@<�*_���@CK�	�`@I��M��@P�\!?�'@U$I!G9@Z�6wh�)@`k�7�Z@d��@hFl���@m	��O�@q2��. @t2���2!@w�X�4Rj@{8KK�@Fn�I�@���1e��@�HIr��N@���B�@���r��@��jwݝ@��i��@���z=�@���1�}@���S�T@��ҕ�/�@�?�� ��@��'���@�B��D@��0&�@�m�@Ѝ@��%j�)@����P`�@�4�R~�@����J�@�̂��q@��=��-@��}@��@�kb���@��O�R!�@��T|�@���$���@����9@�dg��@�����@�#3C/Q�@���BX4@�
B�I�@��2K��        ?�m
����?͆��\�?�]��$@���(:�@��v[�@%�ǎ@%��l@-�׌��@4#yS�2,@:��e/@A!����@E�}o�L@Kv��N��@Qo�&�V@U+�� ��@Y�l#`%q@_�7{.�@c�@j�4@f�1jL@kNBa7�@p']�h�@r�����@v-
$�-@y�Z�#�O@}�Eh_b@�zmm@�w�[��@��;��@��� �@�@��$ˉ�@��o�t#@���_��@����Y@�ѱ�� �@�,��\�@��Nk7u�@�N`L`Y@�.�<*�@���j���@���9@���"��Q@�Yr"�O@�:5��(@���Xg�T@��ʑ��'@��2��@��͟є�@��-+/k�@��?H_]�@��T��^�@�*�䵞�@�s��|lP@���Ƒ�@�-T�̭�@���E�'+@��M�@��\�lg�@�I�P�_`@�{�(�p@�Z��,@�B��'@�2}Iy�&        @1E�J�us@b��X�c5@�V	tAAO@��$��6�@�����\@��/�}��@�q�p�g'@�S��U@�!�����@��D,�=5@Њ M{	�@����޲�@ױW�ؙ@ۭ�:$�@��5�J{}@�3�:��@�����@�
�ϗ@�E�2�@�X�ňym@�,��TU�@��(���@�F?MFm@�/��d[@��+�i�@��V�h5�@�O'�Q��@�!����@��3�&�@��8f��A x|\�vA~��d��A�d�֞ A����*A�twk�#A��H��AǑ��[AB�m���A	~�
�A
����JuAU���SAaHȶ�A��z�ABJ�YA�i���A�J�AC�ۤAl�EkzAІ@�A�s,B7AqL���AI)��F�A&}�S�A(��A�]喢�A�©�T�A�\E�S�A�.�OA�8���A�y1���A��n���A�l'�NA q�\��        ?��&�JS�?Ϫ�r??�(�?�l��W��@\$�{�@|���l�@�G*�@$��(�,@+#�e�@1�9<T�@4��O��N@8�p��@=E���!q@@�RN�@C|��ii@F$���c�@H���㙴@K��b�@OIn���@Q*���@R���W@T��".6@V�_9���@X{z�~@Z~'��T
@\�0�M��@^�y�Խ=@`x!vpkC@a�]՜,�@b�
�7��@c��O)4@e0\��'@fo�DҤP@g�)T�ï@i<�J^s@jS���`@k���T�W@m�zc�@nq���#9@o�aP���@p��|3��@qc7=؉�@r!���\@r��UͺQ@s��6�@tn|�@u8�4]@v,O̕�@vՆut�>@w�=М�@x�p�X�+@y[5ұ�.@z9���?.@{�׻~�@|�$( @|����t@}�:�2��@~�����@��h4��@�WMք @���g�p@�R4�Z��@��<"nh�        ?\b���;?�G�?��?��M���r?� |��:?ӯ ����?�?��1�?���.?����O��@�����@W�ԟu@y�
�@�@���,	@%r��7*@.��NR�@4�-�UM@;���U�2@B� ��@Gg}KG�@M��T��1@R�y��@W�>�D@\0�e)�K@a	�E��@db��!�i@h,"�ڤ�@lm}�:15@p�-\yv@s;S̽�l@v'B'�@y_���@|�-�h'@�a���@�|�*9_I@���>]f)@�B��a�@��*�QK,@��k��&�@����&�8@��yf@�z@����Qv4@�x$��@����ռ3@����1=�@�>C�
�v@��H�9=e@��p"���@�Bi�Z�@��m�'߄@�{Zʓ`�@�>�#	�@�of-@�m�u�3@�*
��@�]TUX5�@�״�6T[@��|�]@�ZgM��K@��\��v@�"US��n@��j[4�@�5P�6�k@���H���@����(��        ?�R��J?�ߣ�?�C³fZ�?�s 7�^@
�+�o@�n��\�@j���@#�5z���@)��V@0&�����@4!C�ș@8��n'2@><��h|�@B[�..�@F,��2I�@J�lrIM�@O���9�@R��v@VViE	@Z9jھ��@^�`�k�G@a�l��s{@dz%�Ye5@g~�t:�@j��b�p@nsg���@q6�p��@s^�)l|@u���?��@x<|M�ľ@z��r��A@}ݧ��y�@�}K>Lٚ@�%�F�e�@��&L��>@��{�d@��]5�G�@��B��:@�	��TO�@�Yqi�@�cqԮ?@��ɪ�%�@��	ɞ%@�cES�6@����Pi�@�_�^8J�@��u�8@��|�[	@�_��<�@�0ie���@�
���@�^���G@��@�@�!�@��N@�?�M�|@�iS�ju!@��/���8@��oeU�@�0c^�l�@��[�g+@����y�@�l�g��@��xߠ.�        @L�ah@},�{J��@�^�B���@���ҹ.�@�����@�A�2��@��;��/|@�^M�5�@�ߞF���@��� 	�@�&����@�@MxzX@��|���@���E���@���E%@�@��f��@���l�?@��E�]��@�h�ٔ`]@����j��@��B"�eA5̊^hA�-�dT=A����A����:EA-˄�B�A���4TA
lJƳ�tA4���A�q����A��Z��A��$�vVA��l��A���fAv����5Ak��*�Ab�����A]BF�`A[&��)XA\6(?��A`�9�Ah"b&t�AsIM�)EA�.�u$=A��ε�A�y��#AȬt���A uc���A!�\�tA!�c�ƖMA"9g����A"���_A#x&xz��A$(�M˧A$��j	�A%r�-#�}A&#��ç�A&ؔ�u�)A'��q�IA(N�@ ��A)�g�A)Ռ4z�A*�D�p�w        ?�@m��s?ĝ*�|��?��9��}?����K �@)��7aj@�g�U�@��U��@��p�-�@$��;���@*�����@0���YB"@4�0De�V@8�)[�T@=�Wn� �@AOo�ɼ@D|9��@G� <p�@JZ$= @M�{H�S�@P��`Β@R�hO���@TӉ��~q@W��h�@YZ�� @[�@�@^_*'`r[@`��U �@a��Ha�X@ck�Y˽@d���K��@f�n��@hA�mDh�@j�ĩ�@k֨��"~@m�}f�ߥ@o�����@p�ő@q�s��}�@s�Ah��@t7թ]�1@uj�ʍ�)@v�3�B�@w���@yN����/@z��{�i�@|$���@}��C�8�@,W�SY�@�a��@�2 ���@�	��x@���;:{c@���x�j@����:�@��U5@�����9@�����@����E�@��y1��@��n��M�@���OO�l@��}Z\P�@������^        ?��?�C�b?�x����?ٻ�����?�R���?��G�׮|@
�qP7"�@P�+��@�:�~@#�� �>�@)������@0�i8J6�@5-ߔV�@:��S�=e@@q�`$�q@D10�U�@H�]�qY@M�It��@Q��c@U��Z@X��AP~�@].�]�1z@`�w�G�@c��X/�B@f�Z�3۪@i���/�@mk�Q�@p��.7�@@r�"���@u����|@w�Ij�@z>�%F�X@}!�sw�@�a����@��,!�y�@��L����@�p�1Ù"@�t�+Һ!@����x$@��S���@�JL�@�l��C@�����d@�3sKR-t@��1m��@�K�>��@��E&�@���2���@���_��@��3c���@���b�@��~���@����N@�#|�c��@�\��:C@���X.@�����>@�^�0ІH@�ғ����@�Vb�eF�@��zr���@��\�
s@�"ǘ�C�@���rF|        ?�w�!W�R?��=�}��@�RP:@@"�Xף&�@2#>��/@=�����I@E�y�$N�@N�x��ʐ@T:.���@Y�|��@`"����@c���,@g����	@l�#��@pmnH���@sD)���@u��J\G@y%����@|�f��%�@�-�p�@�6�8 �s@�i�B���@��e��[@�Z��0s�@�����@��i��@�"P)�Y�@�ױt?ħ@��#�3�@��Q'@���8lx@���CAe$@�V�m�%l@��rX�!�@�I�Y�(�@��Y8s
3@�?kdH[@��]�[@��#�d@�b�z��@�Lp��@�Q}�'�@�r���L@��{����@����@�D)�j�@��x��u�@��'� ]�@�]���M�@�ݑ�F-�@�o�D*��@�9��/8@��v�12/@�����)@��{�D��@����I��@��7>��@�����5@��y틔@�#�Y�}@�^s���@ȨN��@� R�q�        @J�����@�k8��@���|�8�@��$1��@���%�@�n��p��@�P<E(��@ަ 2y��@�3�w�.@�d�bF@�>G�K�1@��\�qP�@�>?̄|o@��0�\�@��dA��Ab3�x�A7E�B�A���gA�g���rA
¡��A#���W�A��E��iA^�4��A�/+�4�A_ׁ���A�.�K��A�J�`�^AI6�?E�A��|`AԱLBBBA�x4�A LD�?]A!HwS��A"KZ���A#V?)ra.A$h�'�ەA%��<t��A&����6A'���� MA)�d�*�A*E��5)A+��&�A,ݥ�[ҤA.7��W_�A/��&u)A0�Ėa��A1>�ՉC�A1�?�"l8A2�c�cD|A3��^?�A4X[nG�
A5* ��A6 `��E�A6�O���A7�'W���A8�����|A9�UŹQ�A:qVDL�A;a����A<U򝒷CA=N|���wA>K&�� A?K�C�%�        ?��(I�?ı�L<�?���n=Q?���%F@�
Ւ��@n%�+R@g����@!����T�@'z��@.(e��@2�lLgG�@6��:�/�@;t<��"@@6��	��@B�e���{@E���P�@H�[���@LM�q���@O��Ez]@Q�n5��@S����mC@U���t�X@X9eF��@Z�)��g@]@˜�@_��ۻs@a1�ΖSR@b�R0�T�@d��&!$@e�@��(�@gF��%Թ@h��
��@j�ӥ*@l�}6��@nu+%p��@p81��T@q?��[4@rQ�|Щ�@sn���@t��*��i@u���n @w	P����@xT�<"�@y���Wi5@{��p=@|�2;�K�@}�ç��@���Ł@��/�,@�_ֶ�(@�6h4��
@�8�^.�@��}R?3@��0��.�@��G";
@�˭xAɭ@��L��ha@��+@�����c9@��z�Ѿ�@����S�@�0O��{@�8�w]�        ?�������?�`x�C�?�q(���?��^��x�@L� ��3@L]b�"@e�
P?�@ ��rMz@&�k�⇘@.|�3���@4!��8wh@:P�v3Id@A�Y�@E�r�i@LT?�@Q�����@Vmj��CY@\��ڲ�@a_�b/�@e`�8��@j4?��@o�����^@se�8�~@v��G��@{RƱ9@�>�.��@�����@�ͺo�I@�J�@n��@�/��ޡ�@��#���h@�'�A�]�@�̨_O�@���6&
 @���_�@�^0�v�@��4$�i@��kT	kC@����nj@�I)|��@��*|�H�@��65��Z@�Z��7@��
11��@���~��@��	�'�@����2��@������@��"���@�(�Dţ�@�R�x�B�@���/�	�@��Ｚr@�{s,+�a@�����@Ǣ%�'y@�T�	^@�4ph@����,��@����e@�zwTi� @ыr洃@ҧ̍�*        ?���?�Ŝ��nP?��,��@�\�(�@�=l�@'�ܞW@1�H�t%�@8��)s@@H���"�@D����h@JDdʸ@P	���Pj@Sm�օE>@WG��8�@[������@`OZOg�i@c ��S�@fO�$��@i��D��@m�H��m�@q:PZ�-@s�I�(%^@v�c����@y�����@|ݞQ�`w@�<Ĥ#@�.m�H��@�F��E�-@�����@��G:@�|�kt��@�8��#@��0����@��Sd�@���L�!@��'�k�@�[�!�z:@�UCƆ�B@�o���n@��k�^�u@�v��@�K//��5@��Vx-��@�n����@���q�Y@�C��vR@��O(O@�ަT�q@��!�m�/@��7Mk�@���?�@���pb�U@�\!�}�@�\��<-@���3$�@�AG�4X@��*�o�@�z�U��F@�9��G�V@�yN���@�����+|@��Ď@�r	+��        @I^���%�@y�΀���@�ZJ�@�1�B9��@� 2��@Ƭr���@��4���@�)���@ނ��᜘@�e5c��L@��6�E�@�
L�@�C�)�$@�:�/�"@�g�ڔn�@�˛닲/@�f!E���Azה��A���` A=�D�ȜAw$+�AA	ˣ��8A;_��A�g�M�CA�Fw�
ABҦ��A����A��+\��A�.�cA��h�A����AsNN�&iA4����A[`'��A p��ܵA!f�%֗KA"d�D)WA#i��ZTA$v��(�A%�!Ѭ�A&�/K���A'�3�IgA(����1A*)�>�;�A+d�۷ƹA,�f"�
�A-�@~:�A/Bv�d�A0M�ur�CA0�~l}��A1�-�3@�A2h����IA3#�B�A3�zxY��A4���7A5j�V<�QA64!I�CPA7 ��|�A7�iY�mA8�Ȼ�QA9x�m�ZA:P��1WA;+�`        ?v)o�$�?���P?���3Z�?߶I8�?�4S�Iȁ?��}v�E�@q�e��@	����r@)WJ��@�Q=I�S@~��FA@ �p�z�H@$8z<y�@'�Cv��A@, Z�Vk@01k���@2��(9��@5�o��@7��p`@:�0g7b�@=��`���@@d;T�!@BC��t@C�X��.@E�	X�ء@G�a+׻@I�F����@KğQX�#@N t�S@P+)� �`@Qd74Ed@R��%q@Tp�&�V@Uf=q;b@V�~C� �@X[�v��@Y�A�i@[�WҦӹ@]:�هj@^�ax���@`bzh�@aPf2��@bF��o�@cC�,��@dH�Ϊ$�@eV��;h#@flfC��@g��?@h��jw��@i�T��Q�@k��dU�@lZ�a��@m����C@n� ��"@p'/t)J@p�p7��@q���Y7@rC=[Ř@r��#���@s�`�/��@t���@uEgJ���@vu).�n        ?m�߷��?���U(�?���&na?��?��8?�Ԭ����@�DW�@Ū_s�@�/8f�@�nf��@%+/5G�!@-P�Ɋ�@3����� @:ݳ��6�@Aʌjta�@G9M�T�W@M�x�$��@R�66э@W���"O�@]Y4|~A@a��bk�^@e��m��R@iٴ��&@n��X�@q�J�*�2@t�X�K��@xO2��@{�vI���@J��=@�����5@��t�� @�G��ߚ�@��}f�v@��<�@�r�ڃ^�@�ċ����@�hV֨">@�%���L@���&ꬎ@��&b(c@���ޣ�@�14���@���u��&@�y)����@���]v��@�!���gE@���#T@�� p@��[����@�jE���@�6�#f�@�h���E@��8�
!@����#@����Aj@��rm��@�!~כ6@�l�hW�{@��vaF��@�7Hᤅ�@����(�@�Hm����@��'{�@����O��        ?�����4?�q�C��?ݷ7?�\s?�()굏S@S��l�@���#�@_�.s��@C�@�@$�_�h�@+��@22��"��@7����hy@>�B3��@C��֪-@H�C��@Om6�L�c@S� �i��@XS_%���@]��qx�@b.s�MV@e�b^!�@jH��f@o:�@ �@rk˽��(@u�F���@y 6�[X@}�/��@���"�@�$�bK}@�͒�!�@��9^-1�@��@QAD@�[;�	@���$�g@����f5P@��!�ca@�!;�TJ�@������@�]����%@�!1�`��@��ǝ�@�PaӢ��@�ڝ�H@��Jy(��@��o�K�@�����f	@���&@�i�j�;@��07�ܥ@�.ǞS��@���hw@��ؒ��E@�Z� �@�ޚ�*��@�r��N�!@�B���8@��?�E�@��ӕ힠@�4RⱯ@�'�w-P�@�#��J@�(/7�CW@�5[.f�        @ &RX�a@TjR�0 �@tCaU��@�7���*�@�3���Wz@��_$�w�@�k�	�s�@�]��$R�@����[�S@�S>4@�1V,˦�@ɰ�>J�@Ζ5NPE�@��:��w�@����Yyp@�ԃ��4a@��E���@�}�+@���	�(@���\w�1@���`&�@�
��y@�8�tC�h@�~�h�*@�ܰ���@�)1���,@�pE�yV�@���i^�@�$_�Q*�@���ʹ�@�cy���@�����=@�.v7�<@���]@���>rU@�O��ܝxA �+	>�A�y��ωA~�S+UA�����JA��}�A����A�GkO\�A�=����A	"�0vA
Fڑ��A�\�!��A��A#X�0�dA�V�!As�4	�6A+�Ĥ_A�qu�XA�,��Ap%O���A:�,\�OA	���A۝X�.�A����A��y�Ai���AJi� A.]����        ?r�����?����5+|?��4$�?�vYlB�?��\c[\?�<*.bl@<�{�<J@��t�G@z�r@���4"�@ _.��@$-�@W��@(nj��@-$ֺ۷@1*_z���@4�ao-�@7�PXB@:�.�<g@>+��8u6@Al
@C8�,�N	@E�v� @H7mx3�@J���}@M}��BF�@P?��=f�@Q��$�W@S�62�Q�@UN'D��@W,��ە<@Y$<w�99@[4����s@]_l��wy@_�l7E�@a�5�@bD�;m&@c��5E�U@d�)&� �@fcwD�R@g��tu�G@ix7^ϡ@k��S��@l�6Dz��@n���ICR@p>q�܎�@q6�9MIC@r8�3[�@sD�c2@tY?��@�@ux����@v�6S��
@wћAM@y��P@zN�����@{�֝��S@|�3�JH@~G�`
@��S���@�����G�@�@)Sm�@��4{K�Y@�����2�@�{n���J        ?aV����?�,����g?�;�p�~?��كsK?���/�8?���Ffa�@�T@�j�@���_@�N� �&@�(��bV@&��C���@0T]K<d@6�^Í��@?���2�2@E�Hs�ځ@L�X}��z@S#��ōd@X�6�{�@`ծ=�R@doy�.<`@i�G~i�@o�6�RwE@s�o�AG[@w�4\0d�@|���T�@�0����@�b�Z��@��1�
@������@�Ix�i�@�̙�%�!@��V�s�@��aQ��@��}��b�@���5�eI@�����f@���y��@�N\�NN@���6l�@����b�@�z���R@���Ļ��@�$`8$�@�L��	s@�:�)�@�I�,���@�{�Ȓ��@�Ҡi��@�O�#${*@��;��@�af��+@�� }�Z@�q:{���@���n�d@�����[d@ʸ�G�.@̭��[@μt<�0�@�s6�m�P@і$4#l@������@�J�3�@�T9���        ?;����?r�U�Xz?�u��6��?�?�g�X?������?� ch�e?�<S�BԔ?���?��P����@=��y1�@�>�nb@���y@!hߴ���@(��e��@0��Ǜ��@6�1�#�-@>?U}��@Cl3�s�@H���I�@N�&��I@S���u@WE��,?�@\��C�@`���и9@c�����@g\Dd�J@k>�Ոx@o���Q�l@r*�s���@t�,���@w�N�N�@z��㚫h@~>��Q`)@��@p�,o@��F��@�* ��R@����O��@�QE��@��B����@��Er�F�@�T'�R�@����Gv@��K����@��H�s@��/�m�@��q��?�@��r�08A@�,P")q@�Үp���@� ���&@��Ԝ�8@���ɛ;�@�~B����@����N�@����g�@��^¬�@�{߮	��@�w�Y�{6@���[j�7@��vBY�u@�e���[@�< ���@��26�S        @S��R�@Oh�@p����@�j�����@���G3B@�VR���@�>Q� @�:�D��@�W�m�f@�Z6g�@â�� ��@��&=K@��:M@�)�uF�@�8��G@�J/1���@ھ�k�ϰ@�z�Ba<@�@��7@�k�"3�@�֚�p�@�>�HX�_@��@�:kc@��[��<�@�e�gA�@�S9�@��[��@��D��@�p���'&@�t�O��@���x�:�@��+�|��A ��c�1AQ�CS�A���}�MA��*���Ak���A�8f?FA�K��|A
)���R�A�}���A���IA����(A�mŸ�A֗GKUA�9ǁA3�e��A7.o�{�Ao5I��zA�_q�"A��Iu�A_���WA��<��RA;`�n~�A��X��A !�7��A �GѵA!��RH�A"�c��UA#hL�A$Fu!���A%)��	A&�Q���        ?hxa	6'?�]g�2?���Y���?�̵Z��0?��\$��?�+�j �?�Υ���?��C�Û�@
�Xb,@��S�@��VyG�@��~�]@v�e��@�M9��@!c{��3@#粕F/u@'t@*�O:*`0@.;wlE�@1"C�0�@3Ov��l�@5�G�p�@8+� �0@:ߌ�@=�aF��@@p�@�@BV��<�@C�5��@E�eG�@G�]���g@J�m(�@Ly3�W�@O�rD�@P�{	�@RMYS�@Sս`��@Uw\�D�m@W3���{@Y�a���@[�@�	�@]e�fI�@_[n�?�@`��e�*�@b#E�3��@c{<O �x@d��p@fd�q8z@g��Iq�^@i�3H��q@kL�;��%@m����@n�d��í@pi��t��@qgaA$�C@rm���j�@s|��s)@t���Xs3@u�x��z@v�Z��`@xoF]�!@yN�η��@z���&@{�C�)CJ        ?H�>�A\?Y*�����?�u��b�1?��hi��?����c?ɣ�I#�?ܴ��4+?�k����H?��zd��@����@���@ �@�C�@)�#NO�@3��/@;6?Sҝ@B���i@I���ݖ�@P�ڗ�s@U���T�@[���O $@aA-͖@e10X��@i��H^@n¼�n�@r;�^�v�@uk\���g@x���M �@|�����@����q�@��Ugt@����:4@�q���(�@��8l|��@��=�.��@�?��|��@�0�L�&@�F��8V@���@N@��b��d@�e<�E�@�E�k@����_@�r���AV@�8CP=@�����@�m�)��@�BD�	�@�-���?�@�00-��$@�J��AB�@���޽��@��A���@���wg@�Yv���C@��-ވ��@�1H�r	@�p�Kfb@���:��@�v���a.@�L�>@��Ǟ��|@�<�s�}@�#�g�z.        ?<,muХ�?q��<�f?�o�+[��?��B^�s?�EB_?����W?��QͲ�?�(���?�T�w��@�kwxޢ@1M��0@�xd��@&s��Kb|@0_Ƿ��@79�?�g�@@��u��@E�a�ݬ�@L�k�@R��@�@W�^'��6@]�Ҁ���@b��#�@f�k�gi�@k��a���@p���ѪP@s�lFv@w���:�@z��p@O���@��	�n�@����@��z(�Cb@�δ;㌎@�Ipי�@�	3&*�-@��"r�z@�N�S)�@���(;D�@�G{�Q_@��D��@� ����@��(Y�o�@�Fa��[�@�s���@��1-@v�@�[�@cG@�%��Π)@�h��<E@���:��@�&��0�S@�w�k��W@�ٸdf�@�L<b$@���/vV]@�d�v��@�ŕ,21@���u��D@������;@�oh���@���2���@���T&�x@��*w�@��� #Z]        @\�8�F@4Ybqge�@S�fr�-�@h�"fK�@w�To�@�� at@���R=@��6y���@��I_P1�@���Z�@� %���@�Ă楮@��|tf�@��.�D
�@��lG�|�@�f�D)@�4P!�`�@��9R�7@��̲�E@�+!aM�@ίoy�R�@�?/{}n@�Ny01x�@Ոd?��@��%�yM@ډXUe]@�X����!@�1�O�|)@�֚��@�ɾ���@���	b@��jM�o@����_@�2�)lX�@��C-�@��l��@�.%�R9@�-���@�`�I���@�"���.\@�L�{@���J��@�\p�*�@�X7y	z�A ٤Ɣ�\A��őAb�X.�A��j���A'Y�K+A�S�I\A	&\�kWJA
�Jܯ�;Aa/x��A��}�A��ۉ��A��!ۋA�(6�6A��ӵ�A�k
qe�A�l,Zi�A�I	�A�[ �AV"ʙ�