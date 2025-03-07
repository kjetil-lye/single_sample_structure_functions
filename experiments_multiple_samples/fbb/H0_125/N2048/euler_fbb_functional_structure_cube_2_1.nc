CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T101855        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�fx�[ �?Ք���f?�
"���?�	�f}�F@�����@��}һ�@�<��m@ 7Y��b@$������@*�Ƭ��@/�kz���@3@��S�@6���DVY@:�����y@>��Q�7@A���,��@C�i�ex@F�B@I'�.��@K� 2.�@N�/Z���@P���Xj�@R������@TE[���@V��@W�h�H�)@Y�k �Ղ@[���[@]��h�l@_�T����@`�Wτ#[@b;^�5}@c2C�ڈ�@d]a�Y�@e����	+@f˪Aɲ�@h�A�2@iY��E�j@j��9F�@lj�c�n@mi��֜-@n�i'`�@p"��t@p�b�rɄ@q���4�\@rca���w@s*�oZ@s�����@t��Q�@u��ޣ@vk^4[��@wD4�!�@x y� d@y (X3&�@y�9���@zɦ���@{�f����@|�r1��@}��g0�l@~�F�m@z�t�]@�:o�6!�@���æ`        ?��2a��D?�5�_��F?�Q$YkSA@t6ޑY@q�i@Ԡ�yh�@&���v�@/��KZM@5+)��@;d}�EYc@AA�i�@EEȖ��@I��^� @N����@R%��07@T�N��@X���i@[z�J�f�@_m����@as�o�^V@cy)�[i�@e��uٵ8@g�4�Hl4@j1��s@l�`tP�@o3�����@p�W5�@rP4�S��@s�ɭ��I@u:�x�D@v���r�@xU��o0�@y��V��@{����z@}Yp�ꡡ@K0��x@�u"�$oP@�a��D�n@�S`��Pc@�Jl���@�F��j@�G�r�D�@�N�q�@�Y8P ?�@�i%��7@�}�U^�?@��"?�T�@���H=�@�ׄ~�1@��n]ɸ@�)�ͭ,�@�,�)+�@�Ɗ�c@�b�"F�@� ydX(�@��nw�)�@�BT�I��@��#0�@��ϗ��6@�3P��<�@�ܜ��#�@���Si�@�4p��7�        ?�O9��n�?�v��+k?����@�a[��7@�8�}<@�����@'a��A@0M���Z@5�^�Ҍ@<8�B1�5@A��=�`E@E��2�@J�Ss�"@O�kN��@R�w�+ә@U�Es�c@X�Ϗ�m@\q�gT�@`��d�@b^:��@d7P���@fss�S	_@h͉�@kEO0��@@mځ/���@pFk�Q�@q� E2;B@s#��JN@@t��n�?�@v9��l�@w��K{@y�3*��@{@N_ۮ@}�c �@~ۙBU�@�^���@�T�CA�@�P�}�Y�@�S<8=�@�[J̢,�@�h��h\�@�| ���l@����Z�Y@��`8B(@��5o�c�@���Ч8@�)�]�s@�[��ۅ@���m[@�ˏ,��@��8~��@�&�->]@��sD���@�p#����@��i)�E@��n���s@�l����x@�Wv�A@�ɍ?��@�z��P�@�-I00�@�ử��@��ٸ"�k        ?��be�@��.xg<@#*F���@2�� S��@?��l6V�@H
�d9X@Q>tNx@W���.z@]�ip��@b����@gA0��R�@l��O0�@p�㔖�@s��L>S2@v��ƹ`�@z��Œ�@}�+�.�@���*T4�@��}:p�@������@����"�@�KQ=f@���1@�;A檰@�mq\��@��F�L�@�1� |l!@�����@�(^G�/�@���I���@�N�����@��󑂲�@��� f��@�`���y�@�)���@���n��@���9H�@��y	}�@���M��@�ۋM���@���ÐC�@��e`�g@��P�)�@�u�s��@�*���@�J"�&A�@�n����@���b�@��>b!�@��t��a@���K\��@�70�U��@���4i�@�{$���@� ��Qd�@��_މ��@�rgnu�U@��9���@��&�ˣ@�}�#�3@�0���P@��e%�@����q*        ?��c>�?�e*3Q��?�O`f�?��}#�@k�
a�@�
2	@�$��;�@9`��n@ �	�@%3���@)�M [��@/1%	i��@2q����<@5�4��{�@8�j�&��@<^ߩ�3�@@��},@B ���@D)y~��@F_�dP�@H�þ�'�@K?wiYk@M��=�E@P%��ĭ�@Q�n�`ѭ@R�;U�R^@TlD��	9@U�kS�@W��O���@Y(��dc@Z�a=�7@\�ڳ'̃@^W�;�y~@`�(�٤@a���{@a��zۢ�@b���SL@c��B�@e0�a�E@f+���@g#�8��@h=����+@i\�Xa��@j��"�}�@k����/@l���֤@n�@&FS@oNw['��@pG�@��'@p�a˱ @q�bzJ�@r9Ӷ�"@r�>��#@s�R���m@tD�l�@t�]}@u�K,0<@ve��΢@w �'Q;@wސ�m7T@x�����@ya�\˚p@z&јy�2        ?�}�����?��>1K�y?�dW"�e�@X�0@#�~��@�O�N1@!��G�9@(�1bm�h@0�d����@5i��Wy@;9�v:�@@�A8~^@D4/x��K@Ho6`��@L_3ͅ�@P�3>Zx@S�h�B@@U�7|�@�@X��t�@[����C�@^�n�Jd:@a�Tc�@b�eL��@d���d��@f��R�v@h��w��@jގ�{��@m�	 �@oV����@p��vu&@r|\��3@sNe1פ�@t���]W@u��o�"@wEA^�}�@x�]�"es@z
���@{�[H�J�@}�f��@~���V�Y@�Eo�K@��%q�� @����xu@�z}c�@�P�E�5s@�*����@�fd��g@��]��M@��%�@���뫓�@��5���@����2{@@��2��!�@�u�u��d@�mw\6L�@�h
���I@�e}�w��@�e¦T�@�4e��U�@��F?T@�;|��f�@����E�@�G�ƨ1o        ?��9`�4;?�%�m�?�������@�@C~t@?��uW�@�O�@"]7��7@)�KCѬ@11�>09�@6I*�Ni@<�%��@A\�(�&`@E�q�+@I��V�@M���]�@Q7�?�!H@Sעa�S�@V���@Y��6��b@\����z@`%��k�@a����5�@c֜3A��@e�WC��@g����P�@j64_#@lW�_�]@n���c@p�)7"�@q�Fr�*�@s%�0��@t��_4�@u侔�m�@wTb\6�@x�y5[/G@zRֹ�g}@{�LZ���@}y�.|�@×2�@�c��t2@�>/��H�@�@���@� ͆�6�@��i Ԕ@�����_�@��m�C~@���6�U�@����V^@��Q@�O@��[#��@��az2�@���L��@��.j�l1@����6.@��y;�@��ͷ|}[@��
���]@��mu�@��ߕ��]@�7},�@�Ɇ�`�(@�\�OS>�@��0RF        ?�E��Cn�@|V��x@���gS�@*J�n�@6�Er%@@�WzȄk@G͘[���@P	�����@T͗x��@Z1|M4H@`*�bh�@cj�A�+�@g	/gO@j�V^��(@o.b���*@qٷ(��A@tA�ddV?@v��e�\�@y��#8�i@|V�u��@P��4@@�76��=�@�טW��T@��o0ޞ@�L�!O��@� ߜ��@�(�Q�@��F;�@��O?�@�1}pB�@�!����@�=Tl�|@�a!<�9A@��8����@��@����@��#��2@�@�Β1Q@��)da�@��+pC��@�9�󏉜@���`_�@�Z՗�@�;A�ߡ@��%�1S@���~ŤH@�y��=4a@�@�f��@�
��S�"@���,">+@�����s:@�|�ǒi@�T8-�sX@�.�#�u�@��s�;@��H?�@�шE��p@�����a@���=��@��� L�@��1C�@�s-�$��@�4���vj@���Ʃv        ?�$tk�F�?��}�5�?�u�K�+p?��q&G�L@�}�H@$�5"P@8����@kaw���@"S� \4@&���/�%@,z�@0�y�tI�@3����@7?�S�k@:���g�@>��b�CU@AR�˴�@Cv,,a:�@E�F��@H7�C@J�6wL��@M'���4@O�����@QT�w@R���Tߦ@TL.�у�@U�,��@Ww��.J@Y A�Js!@Z�=�Y�@\�Z$t�@^cf��@`Q?�n@aI�Δ�@b0œ�@c�I�xN@d��td@e�ގ�j@f�xo@g37�K�@hL�20@ij1V��@j���@k�Bm@l�p��`�@n���T'@oMd����@pD���u�@p�fjJ��@q�N�;7�@r-��'�@r�9�<�@s~���S@t*�Q�@t�@�Υ$@u��_���@v<���w�@v�,y@w���k��@xa�ग़�@yg[stN@y����F�@z�����        ?��$�M�?�|5�r?�F�0N�@��f.�@eXXMz@�����@#K�+��@*��ӱ��@1�r��p@7���15@= E��]"@A��� �@E�y���(@I���v@NZf���@Q�zFp�@TO�s�@W+E��@Z8#?ɾ�@]u�'��@`q����@b@feOnB@d&���ِ@f#���@h7��xD@jb-�E3�@l���d��@n�̍jMy@p�$�H�v@q�_���;@s<�{��@t��]Kx�@u�$���@wX{��A�@x�e.��d@zE����@{�6��@}W��&�	@~�!R��@�F�b!%b@�S�c��@��8b��@��*o�vV@��'@@����ub@�y���I�@�d�౑�@�S�)��@�F����@�<��\{@�6f)ݏ�@�3t��s@�3�P�q}@�7��[�@�>_�[2@�H`��"@�*�q��$@��Ŏb�@�<Iϳ�@��?��d @�S���{@��dX
k�@�p�D�d        ?��׌��f?�S�EA��?���`M@|��n�w@%q�{¿@&3�Ә�@#�����T@+��yY�@2�Ŧq�@88��n@>Z�N��=@B�����@F���g@K�R�;\@O�Z6NG@R�:Ei�A@UX ����@X^k(��@[�O�j�@_s�P�@aX��z�(@cF��V�@eM�7Kc�@gn�ĉ�=@i�۾p,J@k�4ͳ��@nk�_Vd�@px���� @q�hS�@s#�8f@t�z��@u��Űl�@w}֕��@y]����@z�?��(�@|?S����@}�o�z�#@�i�7@��
ȓ�@��"��@��e���<@�s�@z��@�i
��wZ@�c;\�8�@�b3��b@�e���)Q@�n̇�@�z�y3R@��ߤ���@��?�d�@����O�-@��|?]�@��+�2i@��h���@���y�}5@�;CD���@�Ӿ>�f@�n
3�7@�
7'@���0��@�GxV���@�諜��@����i�        ?��� V�y@�*��yT@����΢@/*��4T�@:&�LV�b@C�}���\@Lh�Ώ@R�a8�@X�ĉ��@^��x?ɦ@c0�]@f�3'�Z@k7"���@o�q��@rm���P@ufv�MM@w��*Q_@z�4�X�@~%K�"v�@��P�@��Ģ:@�V�wd|{@�@���2c@�>�&A@�PټH�@�t�J�h@��<9z)@�{.<��@��f����@���;	@� ΦWt@�i���R@��S���~@�p��n�@�w��7g�@����3_@�U�+@��),>�@�T�3�:�@�o�ENC@�9�|lg�@�GDב@�؆����@��þ @���{G@�c�s9S@�C�:靊@�'��*��@��< 	M@���Q�9q@��X���@��y�.�@��]�K�@����U@�Ɛ<�#<@��t���@�����@�h:���@��DemD�@�s��i��@��Yf�:2@��\y�/�@��[H        ?�̂e�(�?�-P;}�1?�)��}?��'>,�@���?�@
��?{<�@��;kA@G�_Y�@ _�x��@$�*k�h�@)L���@.}Z�)�@2j��P�@5'M��@8v�Y3��@<���V7@?��jF,@A�{�@DوZ�@FBL�}ο@H�[�µc@K�LT@M��~���@P(/jw˭@Q��	P�o@R����@T~kA�+�@V-[�g�@W��v�]a@YK��� @Z����2@\��cY�@^�?��@`1�FC-�@a#���6m@b��럽@cU&)�z@d�V�32@e%�/��@f4,�а@gH49�W@haQ����@i�U$��@j����I�@k̸��4@l��W�E@n-�@oi@oeƝ�N-@pQL�t@p�j��B@q�N�[S@r:�A@��@r⹡N�@s�����@t9e�;.�@t�'VZ��@u�+���#@vLp��@f@w�L'��@w���0 �@xs̫{�R@y0!]��6@y�+g��        ?���� �r?�a�/�ow?�x	3@SWU�3@B- !9@�?�!,G@#2��:�h@*�ϩ��	@2�ۘS�@7�~�՝�@=�x#���@Bj�ݹk�@FcG1�+�@JʳI���@O�&�D�@Ru2���@UQ��@Xg~	��J@[��S*��@_<��0��@a~%K�^�@cz���@e�����@gŸt�gA@j ���@l��C�A@o�)�@pӍ�D�E@r1tu��9@s��s��\@uՐS�z@v�Hq@x+�w4�0@yʆW�A�@{ux�%��@},�����@~�0�a[@�_J@}P@�L{t\@�?P�>a@�7�p��>@�5r$��@�8�nF"�@�@�Σ�@�M��On@�`4��j@�w9���@����j�@��?���@�����@�&��-�@�.�I��@�0��d@���:ťK@�g�qJ@� ����@�����:2@�H�σ@���x�%	@���ՔF
@�:Op���@��y��-@��B����        ?�@*�~��?�%�$?��媇��@�o˻�@�2�1�@X��7 I@"��H��@*E�6}ʧ@1�P)��@6�F����@<�Ì��H@A�`�-p�@E���.�@I�s���@N|]� �@Q�m�UJ�@TtS�)�>@W\����@Zx-\9��@]ƝPK�@`�Ë�M@b}1X$@doG����@fy�8��3@h���-� @j�ր�L�@m&�~8�@o���{��@qG����@rPFڒ$�@s�R��W@ul����@vn/�'3@w�#�4�@y`j4�*@z��`���@|y���7@~�z�{8@��/zsM@��3#+^@���T(	q@�lc� @�O74^�@�6~�[@�!�����@��X�.�@��[Q�@��Qʽ}@��u��0@��sn#@��CA!�@��fl���@���x>�@�	�.��4@�&(c� @�٤�z�@���z�r�@�(�����@�����Gp@�B���<@�ш��v�@�a����@���R���        ?�mS��@��b'�J@��\
@(�>�@4�����0@?��"��@F�k�[0\@Ñ����@T�f@�`@YR���h@_;¸���@b�����d@fx,�n��@j]Y�~�@n���{֋@q��crb�@s�2��@�@v�d�3¤@y7�Θ�S@|���g�@t�(TF@�[$[�j@��YM�5@�t�H�R@�;�8y�^@�X��m�@���c'�@��5�@����J�X@�G��@�@���Wn@�;�ou��@�_x�z�@���E<�@��F��Ul@��!z�>�@�8#����@��1]��@��/��{4@�%�=�@����o�@����Yzd@�'G!]�f@��aq�p�@����b��@�Y�/W'@����,�@�����T@��f.,��@�p�U��P@�=�I�w@���@��=N�o@��7���@��lh���@�iN���@�F��m@�';Y:�@�	�S&�g@��y���X@�װ�~@��G�Z@�XU�G        ?�~L�.�?�a!ǭ�?�!�]Ț�?�h����@����@��j^.n@S�mj�@�(Ȼa�@#A���@(y��C�@-��S���@1�q��@4�K���@8t&�� �@<6/q|�@@L+�@B@f��o�@D��躨@F�E@Ik��x��@L8޻��@N����!@Pٍ$#�~@RYdş��@S�(�?�@U��XA@W1lt��0@X�g�v�e@Z�Im�9\@\��P'�@^kՒ]5}@`._��@a,�p)�g@b1�7M6@c=#݁��@dN��5�'@ef��;@f�՜�@g�QI��@h�E�Jm@j}�ݕ3@k9��~�o@lu���:@m�.iʹs@n�����{@p%���@p��bq�M@q{嗞�@r)�Fzh@r�d�V۳@s�����@tF˜A��@u ���l�@u� Y��@v|ON�s%@w>$���@x�'_�@xɄ���@y�/�ќ@z_&v��@{-��֟�@{���)XN@|�vy�`U        ?�!nb��Y?�W]A��?�)��S@�y�%�j@�����
@�:d}��@'^x=��@0�Rr�@5p��A@;�ó�w�@Ap��ɟ�@E}#�uML@Jj�St�@N��M>��@R:��嬮@U2�&�@Xg���{@[ى�}'@_��?�0 @a�=�`�r@c�{Xn�@e�s9�Zo@hK�w�_O@j������@m@>��Y/@o��H@qS��Z�@r�p&Ɔ�@t?��@u�u<��[@waAd�3l@yP!h�G@z�nQ��@|wi���4@~C��~@����Z@��Ƹ.�@������\@��:��f@�����@�����@��a��@�'s��|�@�Am��@�`�"�#�@��쮓�e@��5�m��@��_uً@�P u�@�F�w��@�A���Ze@���-,��@����ei�@�)H:jY�@��.�S@�y/�@��@�$B #]�@��[j,�@��q�g7�@�1z0eZ�@��j)�"�@��6�,��@�OԎ�1�        ?��`hQ�?ۜ��E�e?��g�g@�u*1E�@8:�d�@3(���@#�Z�2�u@+��R�7@2~@;f.@7�4Y�M4@>hX~0@By?d=#�@FT�[���@J�f���Y@O>\��ɯ@R&�!��u@T���'9@W��]u%�@Z�g �@^F��;|@`����@b���@d�� ��@fȑ!K�@h��@k.�	��@m�"�Mr+@o���@q=�v"�@r���}�5@s��ߔM�@uLm���y@v�K}9�@x9A}��s@y�*꽺@{Q�yF�@|�:%CM@~�_��~@�##���@� ��֤@��_澢�@�����P�@��R��r�@��{���@��U���@����9�|@���mT-@��O���@��1zw��@��enB@��ټ���@��}(₅@��?qG�U@�
t�L�@�r���@����ļ@�</���@��v�
�H@�j�}��@���#��@���S�H@�>k^��@���J�{�        ?�sV�h@l��_q@#�;��@2�ܛ��@?FFLIVy@G�8��I�@Pа���@V�h���@]q�Pˁ@b�[t0s9@fܤ
�@k�Ji@ph����@s<��^ӱ@vIGc��@y��C�\`@}����@�`ZE��@�V2�)�@�g0���.@����@��o(�=@�:�$n@���v��n@�$_2z*8@�{��V@���ޖ@�ML�Y��@�ȏ�8Z�@�O�m;@��i�>�-@���9��@�*,����@���T�i@���W�v-@����G�@��%���g@����� @��7�]��@�~���Oy@�}�liՅ@��`���@����m\�@����q!�@������@�ĶU�N@�����#@���X�@�'����e@�Q�mT@�@wD>�@�ً��&@�u2�^3@�io��@����J��@�U�=@��$	��:@��R�w��@�G�)�ր@���_��@���V|�3@�L���R@��7:��j        ?������?�WZ��a�?�Ǳ���?��F��@��ڔ�@2dIX}@;�bB:�@l�ǥ�i@"TҀ�˃@&� 5hZ�@,jX�@0�苸�<@3�3����@7R����@:��*@>���SQ$@Aj��o?<@C���Ǭ@E��!A�@HF|�+�@J̳�/��@Mq�
%,�@PP��@Q���i��@S	���;Z@T��"͌�@V2�@��@W�d6�ů@Y��'d@[YSr���@],!�VD:@_DoC}@`|���f@ay���&@b}|�fv@c�Y� 8@d�l�0�v@e���O�@f�ڠ��b@g�
m���@i(Z�@jA���@ku{A�[�@l��=�K@m�R=�AT@o1z�A�T@p=���a@p����m�@q�!�D@r;�6q�@r�J���:@s�DY�B�@tQϡi0�@u��׹�@u�{``@v~��o�
@w=]��9�@w��W��@x�;���:@y�i�`@zQ���@{8��@{�Զ#�        ?���֛Z?�����?�|�_�@�$��4�@�X�6C@�3
���@$�9�uNI@-#1B�G@3p��'$F@9�S�U�@?�|0�-�@Cw"�x@G��	9b@L��K�7@P~_5�6�@S,��`�@Vj�!@R@Y/�'.�@\����@`rFM��@a��	�.(@c�Hg��D@e���q��@h)���@jt����@l�[�˅�@oY�kEL�@p�Q=0��@rRra(��@s��%O�@u*��@v�I]�Փ@x2��Ϲ�@yȗu"�@{j[$}lP@}��<i�@~�?=F@�J<��@�1m��PU@�E�OW�@�zA /�@����@��q���@��egH@�fs=H�@�G��@�*����@�?��K{�@�Z�@7-@�y-��~t@���:>V@��"F�R�@����F�@��v�j�@�,%�5Hc@���C�@�g�<5@��S/|�@��u�:�o@�P<��T�@���}	�@���c ��@�I�TQ0�        ?�i�Rk�N?�}��c�)?�m%�A@�e�e��@n ��@�����U@$Vϕ��Z@,Y"0 p@2�䕑[@8�Σ~��@>����'a@C_�Z0t@G�RQ��@Kq����@P"�f�#O@R���з�@U��k���@X��k�:�@[��OCd@_L�騆�@ax����@cd�<���@ei�1�ՙ@g��9Y��@i�p�w�@l��$ �@nsz7z��@px��\�@qÛ�~%@s� =�@t{g[ԡ$@u�&�w�@w_�X��M@x��l@zp��ϫ@|5�r�z@}�ψ_ @W�.��@��yu��2@�hbJ`@�M�,�sN@�8/;�9@�'	c�6@�����@�P�
�@���*m�@�����@�<�=@�$�O��@�4=W螬@�G�ڮ�@�_�Ւ��@�{�i\�O@���9��I@�`��[a@��A��);@��^�/@�"p!�@��o���E@�XXp�I�@��%�IԒ@���]��@�7Z�)�        ?�	����@
j�7�e�@ �nP"&@0�N �)@;����h�@D��'�y@M�YIOP7@S��<D�@Y��;��@`Z�T��@d!���s�@hNݚ_��@l�̙T�a@p���?��@s�Vw(�@v{�=�.@@y��ay�@|ИEC�@�"%vM�@��X3!@�ݰ~j�$@�޿�?yn@����x��@�%�s$�@�j�UQƨ@�Ň8�-@�����I@�ݲ��c@�*�o�K�@���, @��v�'��@�N��k@�í�d�n@�BD�M��@��T=�9@�[�Al�@��O5��@�L�C���@�#@S=2@���d�7@���/͇�@��5�5�w@���ش�@��j����@��@¤bj@�w0���[@�o1��x/@�k=ͯ@�kK�j�@�oT��2@�wS�Il�@��@E�6�@���ā@����3L@�_0�g�@��� X�@�|��'�p@�&���D@���#�7@�7y��@��g�wϝ@�g�d�\@��B��#        ?����q-}?�Fࠫ��?��fj�?�X�?DRM@����@��*�@�e�@�@�����@"���@&�sSf@+���J�@0��&�r@3���ˋ�@6���A�T@:�S�K�r@>D#R�r@A ���(@C=n�|�R@EwV��{J@G�Tz;U@JB/G�@L� �E-@O~#�Z&�@Q"ڋ�^@R�@`�O@T2t�@U�X����@W8�_d͹@X�bcA��@Z��w�@\S<\b�z@^ +1��@_����@�@`� �@a�f��^@b� �?��@c롼@@d��ɧt�@fi�Gk@gl񔛺@h4��~�(@iT�o��@jxrLU�@k��&
�@l���غ$@n~㹬�@o9ϖ@p:�0#�@p��s!��@q}N��d�@r!�,*M�@rȀ}))q@sqL�˔@t/���@t�$���z@ux%��,c@v)/ysS�@v�=̋�@w�JS���@xHQ���{@yK��i�@y�1&ܯZ@zx����D        ?���+!�?�^����K?�(ټ��p@��C�*@i��0�@-���@%yE�D@-����@4���E@9渙�&�@@Rv�A.�@D �}H @H^в�4>@M���@Qz��@S�jH��@V�X��0@Z��(o�@]���"�9@`��:^i@b����@d�;�b�@f����ګ@h�X'�9r@k@�@m�̭�@p�x��@ql���@r�EPi��@t0.�m�@u��d�%G@w"k��mh@x�Q�'��@zAR�p@{��m�r2@}�����@>�g�D�@�~q4L�@�btb�h�@�KE�i�@�8�בu@�*��f�@�!��4'�@��Ѡ��@���r�@�^|�3@�&���U@�2��wVu@�B6�v��@�U��J@�l��0!�@����9��@��H0
@�d
���@������@��]c�@�!�HH�@����XH@�Q���X�@��fI�E@��}M�zi@�&����@����~        ?��)is�?�6Z�Td9?�F�@�@ߍ���:@��	��@�)b 	e@$��#t@@,�hҶS�@3H���@8�L'�AF@?}����@CkeR���@G�%�%�]@L	*��3@P}>ৌu@S+�+�@Vo� ��@Y*j��K�@\y}��e�@_�5�m@aچ�]@c�8O��@e�`Z�o{@h���e@jH�b�A@l��n<@o8n4>�@p��~@r0n2@sx��Ph�@t��ٶ��@vO�y�f�@w�� Q�U@yPL�M@z߱�b)Y@|x���Jf@~R����@�;a@���6?@����>.@����a�@�f�Ӳ@�Q�C��@�@���N@�3��%�@�*7T�@�$[*9�$@�!�ǵ�@�#
�"@�'cu�@�@�.�R���@�9���zE@�GMEOI�@�W�q�<@�5���@���Hx6a@�M,=kqR@������_@�i���ڹ@���ǍR@��CM�_�@��$���@��<�[        ?��cVZ@	F�#f��@ �(@0]�[ī�@;�i��B@D�����@M����&�@T�U�B@ZMQ.�g@`p�rlz@d8�� <@hb�U���@l��V{c�@p�6�q3@s�\z���@va*�[�7@y`����U@|�.����@�Yh���@���CwR�@��!J��4@�{���@�~�>�6@���-�ʇ@��Q&WR�@�c-:C�@�,�:kO�@�a�&y��@���\X@��f��{�@�<6��@��w�(��@��~�<�O@�nק��@��ܜ��c@�h��1�p@���Z�mE@���-�@��7��f�@�d����@�;g���@���@���O&Zo@��Y��g1@����:�w@����.��@��w\�j@���2�=@�{���F8@�s��,�Q@�o��u @�n�=�@�q5V�}�@�v��m�m@��P�"\@�F��-c@�ͷ!��@�V��}@�ẚ+ @�n
��@���؃��@��*��)@��놶        ?�@�(��?ػ*�k-�?���Gn�?���GZ@	�Ҩ�B�@f��)�t@8�ʗ��@",���@'buv$�`@-;��n�@1�y�?�i@5g
�H?{@9B\�Z"�@=k��dG�@@�+j6j@CR�Dޫ�@Eڋ�l�'@H��㸌�@KZq�t��@NQ��{��@P��I-W@RW�d�@T	Q_��r@U�g�#�@W�<�%4)@Y���%/@[����7@]��l@W�@_��\k�#@`�G?(m@b|�=��@c.߼�@d]QiD�E@e������@f��g>�;@h�� ��@ie�.bH�@j�G�~7k@l�F�!@m}s_"�@n���S@p/:I���@p�@pk�@q���6�@rt�wI@s>Z2���@t��k��@tܾҬ�X@u��� �@v������@wfl�0@xE�c���@y(���	
@z��Q/@z��sU��@{�X1_hH@|�8UK�@}�gs�@~�ޡ��@��#�s�@�^J�(�@���7!ZX@�a[�        ?�������?�LA`�W?��^T��y@S��J�@Z`�v֧@ ������@(��5S�@19���@6��D��@=��Hj5�@B�1��@F���"H�@KΨ��r�@P���a!@Sr���}@V�^�vD�@Y��;ٽz@]�׬��@`�O�nM�@bȩMX�C@d�!Dm��@g=V��(@i��:q��@l'J���@n���1@p�n��9-@r,���@s��Q>3�@u,	���@v��N���@x^?N��\@z	�KgB2@{� ��!@}���hp�@Q���	V@��,��X�@����C @�}t�>@�y<�A@�yke�|@�~a��dT@����+Z�@���3m�@��Zo�)@��5�ڤ,@���i�@��XeDP�@�T��� @�9��I�@�ap�Vu�@�F'^t@���S@�u����b@�`f��@���s�;P@�G����@���g�fC@���U��@�$8wW�@�şK�(@�h%Pa)�@����җ@��pO�        ?����K%?��
�Wq#?�T��y.X@&;|R_�@8w�?@ ƶE��@(�V>&�@1$�D�@6�	|�3@=�I!���@B�\�h6$@F�ϗZ�@K�)	K!@P�LX�Ԭ@Sdu�_��@V��bO�@Y��4�Ξ@]�[���m@`�7����@b��X@d��ʞ'~@g%2��Ӳ@i�[S�@l���c@n���WSV@p�ZĬ@r�}��@s�*�,�@u~���@v���2�@x;�U��@y�ԆA��@{���M@}]���s�@,$=��@��6N�ki@�v0,��B@�n����@�mt��e@�p�����@�y�&�*@��5��8�@���^ud@��#��x~@�щ��#�@��j�@��,T)m@�F#�Z<@�vK��>@��XR w�@�qf���@���U�@����`�@�Q�ת�@������~@����T@�C!t�*@��:8�"�@����)@�C'��ۊ@���\�&d@��y��2@�P�\��k        ?��ly�@����@%�A�6�X@5}���N@A�Eka��@K1�xM�@S7v�q�@Y�yY��@`�Y&p�@er
��|@i�i߼J�@o5U��f@r���Ց(@u��F�@y1��O@|��@&I@�L7���@�[���H�@����V@��8{']@�=�0�@��Bo�2@�f���h@��Z��j�@���w�m@�~>C���@���]y@������e@�F�U���@���yE�@���	n�@�����T
@�`�tH�@��\��7S@��~�ߞ*@���^y��@��Ӕ�@���  �@����1�u@����~:@�𺺿p�@�X@/ǽ@�;���}^@�i�|�n�@���X4�@���t@�%�K�.@�-]�uM@��c��i@�zZ���@�${o�0{@��z�P�I@��� �r@�30h.�|@���X���@���5��@�X����@���~�@����R�@���O<�@�V���r`@�gp��@��C�|�         ?�Pp���2?Մ�e��?���J��?��b ���@@�m�@���.p�@yb�.��@_�0�F�@$4{���@)I5Mr	@.� }p$@2�~�@1@5�5�B>@9�J�K(�@=�QA��@@�Z�� �@C\�~�@Eq=/�G�@G���@J����$�@MN0��a�@P�r��@Q�Z��;@S%o��:�@T��ۧK@Vq_�?Uz@X-��>�x@Y���E89@[����@]��k^0@@_�J����@`�cW�@a����w�@b�A0ތ@d)�0��@e#�q��@fF[�,E@golWV�@h����JH@i��}��@kg�h{�@lP�(��@m����@n��L;�@p��*�@pǶ��f�@qvr��o@r'ӫhe�@r�ʂQ�@s�J�s@tKI��.�@u�����@uĖ��WU@v��O:�'@wGT�P��@x[��x@x�V��@y�1X(�k@zgeU�s@{4�)��@|��6�@|�'m^ހ@}�]G        ?�sT:*��?��%�~�?�K.��T@������@Z�7'�@ ^$��@%Kd<#��@-����C@3ȁ(	S7@9�C�Y@@
vg23@C�m�f�@G�E�ǟ=@L�%O�o�@PΠ��<@S����@Vy��[z&@Y�[z�@\�Cj�4@`I�" �@b.0��-�@d-YE.�d@fF�`"�@hzk�1@j��1��@m-h��@o����}@q"*ؘͫ@rzΝV*@s�����I@uM��Z�@vǤ$�$	@xMYX�@y����@{yھ�@}�/3j\@~�e�{�y@�D
˚�@�%��� @�6y��V@��V�-��@��ש�
@��,���@�Ӯ	�@��pN��@��W1_�@��E�fq�@���G��@���f��@��Y�@��0��3@�'B{��t@�A�؃��@�/ݤ���@��T>B�~@�RG�/��@��oA�@�zm��@������@���.��N@�@oo9py@��)���@�u 2(9�        ?�7Ų��i?�Y�&�N?��T�� @���&@����@8��L@&=՘�S@/ &Qi�@4�1��.7@:�<�7��@@���;4@Dԅ��-@I8Ro��@NA�?�@Q�����@T�a�>t3@W���]@[�c�% @^����Oe@a0?���H@c2O����@ePы���@g������@i�"���]@lT^�|�Q@n��ډ@p�(�l��@r&��䴰@s�(��@u~!Jd*@v�f��@x,�H.J3@y���:7�@{yA	��@}0���Ϯ@~�!�od[@�aH�qH@�Nr��M@�@+�jT@�7�,��@�4Z�]��@�6/(ׄ3@�=�<I@�Hˎ:�@�Y\g�0�@�n�X0�@��}n{�@���S��@�ɝ<�&W@��׺Q@���4�@�%�����@��5��@�Z�!�V@���h�	@��Hy��@�84N�@���5�y9@��)��@�$�Ǘ�d@��ZS��@�uB��4�@���yN        ?��Z8n�@^�#��@"�C�?[@2q_I�@>Σ^��@GLr桎v@Pu\~�M�@V!7�Ȗ$@\�H;�CF@ba[���@f%s�m@j�PP��@o����q@r�J�Ju@uo*g�,�@x�3���@{���S@c�t�R@��k�,	�@��r�g�@����O�*@�����d�@���i7��@�T�0G�@��߀}��@��O���@�����U�@�Pt	�PZ@��djV�@�'^\��G@��7I��x@�)�)Z�@���8���@�V����@����$�_@���Hl]�@���'dm�@��X���@�yqŖW@�d:�TC@�S��9L�@�G���B�@�@#�D*C@�=
Sw�@�>P���@�C���_@�Mtñ;@�[+�]�@�l���@��s����@���i��@��;[.�@�l���gv@�� I��@��s�:�@�(��忾@��,+^�@�Y��`�@���U4@����1��@�-��u�@��ɀQ�P@�m��d        ?�������?��K�$6?�j,�?�L?�����@(1�[�@���@d-<p@Wji-\[@!�X=��@&#���|�@+�[|�#@0L�OI@3G��W@6��/�,@9�델K_@=��ćL8@@�Ǩ�0M@B�Wj�@EI���U@GYP?�
�@I��_J�@LH�[�|;@N��7c�@Pә}��U@R?��WÅ@S�iFl/h@U@mo/�@VԴx��@Xv$p/�@Z$�{ݎo@[��o@]�D�#F @_}A*)C1@`�s*);@a���� @b����Q�@c�~È{�@d�;�;;@e�x��P@f�"8� @g� ��@i3�{Q@j=<"��@kk$�u#@l���`�@m�@{)�@oKצ�@p-��@p��P�@qzĐw�{@r%2ˏ �@r�AEO@s��Qũ@t4^o�@t���xc@u��抰L@vY,�}Q@w�4#��@w� u�Er@x�PRj�@yU��v�}@z��uR�@z�i0��        ?����T�?�hNs�?�v$�h�-@&��9ij@Ae6@tX��@"�{��G�@*0:T��"@1�i�G@6�'^�Ƹ@<��=�֏@A���)<-@E[3j[�@ItPs�@M�,��@Qe���4@T*Ah�~@V�� ��@Yт��E�@\����dy@`.B�ݎ�@a���k��@cС!;��@e����J�@ǵ֣�<@i��7��@l"E%^g@nl��@pf[J�&@q�[���@r�n�g�@t2	@u��)FVf@v�����?@xU�x�J@y�{~�5@{Fq�׷z@|�V��L]@~[L�.t@�Q���@���	�@����@�uI���@�Q~	i,@�1��}�@���M*G@���*Qt@��F��@H@�ؗ�F�@�����@���y�j1@���f\:-@��댑�Z@��X'n�@����<@�Þ��Z@��RJF�g@�l�����@����7-!@�}���:6@���u�=@��z:��@�!Ǡ��        ?�(����?�̨��d?�ם��@���2,,@_�$K�@�v�
@#%Q1�c@*�!��6@1ޒ ��Q@7!��!�@='0�Sm@A�yOm#@E��_=�h@I�*M�]�@Nv� .2�@Q���z�@TZаd�g@W32aR[@Z;s#�)@]s��{D@`l��ҡ@b7:��@d%�-yF@f��U�6@hf�I��@j@�>�>@ly�2���@n�O��@p��A{�@q�o
��@st��@tg�N$�@u�{�͍@w%5��d�@x���r��@z	f�p5@{���oI�@}�pmV�@~�Pm�T�@� F�+��@��<�FA�@��s8ޢ@���)g*�@��J�=@�c�.0 �@�Jk��*@�4N~v��@�";��F@��Uq�@��;Hm@���T�x@�������@����/��@��v��
Q@�8���@��;�;@���N�@���hIy�@��%>$@���f@�3��Z�@��+߄^@�O�b,��        ?�5W42e@��L��G@�@�ߨ6@-&z1rm�@8�-�?��@B��A���@Jh����2@Q�^��M@Ws�;�I@]0H9�U@a�d��L@e�`��@i��h��V@m��
_�@qR:M��N@s��7��@v|p`��h@yNU�ksv@|H#�4K|@ii�r
@�X��\@�<��HO@�ڡr���@��ů���@��lի��@��`i��@��o��@��m�+�@���lm��@��:�)uI@�ߌʹy�@�t����@�S�#���@����@��Օh�@�A=��$@@��Ю�Z�@�zA!
�@�x%����@����h@�7�����@��&F���@��A�@���*��B@�\Pś� @�.�D��@�x7Z�D@����c+�@��]��@���l�5p@�}���S�@�d����t@�N�77g�@�;��m�0@�+��c@�����a@�Ҋ�pL@��D��@�����`@����=��@�x�>@��U��@�	}��,        ?�;��54?�yhT>V!?�Hc9�9?����<�@0�Vƥ@��2�'@Ycvf��@���k�w@#<��e��@(�wq�@-p�%�}�@1�����@4ߗ��h@8VO��@<;9@@l��5@B�Dfk.@D\B��r@F�J+7T@I3�����@K�,�v�@N��{��@P�t%�*@R)sl눽@S����@UJ)�{@V��d0@X�8F��@ZfO[��@\6,Es�@^�Qc�@_�Y[eg@`�!_���@a���)T@cm��l�@d�.͑~@e+
46�r@fF�g�@ghlˀ`�@h�;�EZ�@i���ټ@j�S�'�@l+*n�D�@mj[_��@n�.�4��@o��v@�@p��AI�E@qOq�\O@q����R5@r��މ�"@s_�i��j@t!u�qu@t�0U��@u��;݌�@vE ���@w�y�@w�[p_Z�@x�B��y@yS��P!@zr����@z餼��@{�/{�@|����        ?��Р)��?ٟ��\1Z?�xo縪�@����@�$o���@�m���@"N��H@)wgg�#�@0�k�7�
@5�(��P@;�f�o@A�!�8�@D�SI��S@H�7�@L��
=D�@P�z9u0@SJ�l��@V F���@X���~@[����H@_8���@aS�%�5�@c"�AHr@e�H��@g׭�2�@i���i@k9Ξ���@mvPㅺ�@o�7�
��@q����@rU��0@s�xϔ@t�v��@vMt�	ã@w�B8b1�@y$��@z�|�W`�@|#��B��@}�z���@H�ǰ�@�t��y��@�I��@��@�#66X#@�Q����@���ї @��U�@���T6?j@��d.���@����<@����@���1ٴ@�������@���J	/x@������@��)��J@��\*�@�ҁ�P�@�u�I�q�@�;&��@���F'�@�&�!�|�@���⇏-@�P�r�Z�        ?���J�,f?�$!��?�gy�YG"@�L���@��vz�@��5s�\@$f�W�)�@,X���@2�y-��@8au�@>���H�@B�,i�{�@F�`�)ȅ@K~ީ�V@Oϡ��e@Rv�1S�@U8f���@X,;�@[Q�%�A(@^�Sj�&�@a�L�4�@b�!���@d�뻈2f@f���Dw3@i��r�K@kH`=�b@m���Ң[@o�qQ_�d@q9*�E�n@r�#΄� @s�o?��@u,�����@v�)��M�@x3��<@yy��-
�@z�����`@|��xWO@~
�e%W@��S�C@��񷆧�@�����I@�a~"�CJ@�@�(�"@�$�ӄ��@�ڀ�@��t>t>3@���Zo@�٥���b@��OP6�=@�ʜO�@��~�z�O@���B�@���G��@�� m�\c@������@���#�8�@�� ��^@��<�F@����2��@�&��z�4@��)|�5�@�G�I!0@��f�u��        ?��ƹq@lǃ'�@!�Ӯ=vX@1U��k@<��ѡ0@E�w?���@N�ǫ3:@T��\�@Z��>@m@`��e�.@d����@i�a�@@m�,�	+@qV����@t>\��@v��6��@zƙ���@}G$0�@�\r�@�,!s{�@�7��~@�I�)QO@��J(є@�F�|�H@���l��@��)k�_g@��
��@�ؗ��M�@�C��@�ocZ���@��Q��+<@�,��^��@��e49@�7?=�@��B�N@��|�ϛ@���)A�@���1��@��Ex{b@��5�@@X@��I,�U@�{s��\�@�\�J$��@�A�}�?�@�+��47@����@�	X/�@��Ơp:�@��XF�#r@��;��@��>)C�@���"m�@���f�А@�	%��@�ص �@���M�(�@��g4c+@��q%t�^@�:���ȇ@�ʭ��>�@�\? |�@��h�j��@��$)��        ?�I�1��S?�o=;� ?뇮�H?��!���@:f��m�@�4Z��@r�b�q�@T��K��@$+�Ɛ�@)<I��ԣ@.�u����@2�����@5ݴ$FN�@9}ȭ!I�@=b( ��@@��T�-@B����O\@EQ^is�@G�2�.�@Ja�eV�@M8+�x�@O�L8p�@Qw}�]P@Sdj���@T��)��@VM0$zh@X�����@Y�]GXZ@[�-���@]����~@_�x
�s�@`Ƭ�ư�@aψ]㥳@b�. �0@c�|$R$@eSuOw@f5��_@g_:A�@h�"{V@i�D{��@k�P�V�@lC�(� b@m�tZP�+@n��>��@p�I�u
@pį wB�@qt��wmG@r'N����@r���7e	@s��U���@tO�*kO@u4xf��@u�7p<p@v���P@wT�0���@x;�ׅ@x�&_��z@y��$Iu
@z�G���@{Rt�L��@|& ���D@|��3��X@}��#        ?�R�Z�s?މ~�C�<?���P��O@D�=�-@�Ʃ��@Xr*��f@%��'' .@-߂�"�@3���|ν@9��.�g=@@(ҙ��@C������@H�X{�.@L��v(@P̝v�U�@S���S��@Vl3o�T@Y�9؊�@\���
@`4��'��@b�ZO@d
�L>l@f#m���@hD@d�+�@j�l^'�@l�.'^-�@oN`̨�@p�LnN�5@r8���@s��j���@t��'cK@vdj
���@w�E��B�@y`R���@z�k�^��@|�p�Ĉ@~%FQ��@��o�}�@���B�%G@��ц�X@��W�n�@�l�m�=@�YB�f�@�J�󐣃@�@I�h��@�:sHܴ�@�8��x@�;�H���@�B͞%�@�N����@�]W���@�p�����@��m� @��m��	@�aLy-�@���
%�n@��o�KO@�9y�!)@��"2���@�J��e�_@��*T@��?l;d@��N��        ?���q2n?�Z-ĚJ?�2`�96@�X���@W�Ǣ�@���8
�@%A��2��@-��m�?@3��#NM@9n�i�M�@?��t1�@C��'��@G�r�@
@LJ�~�I5@P������@SI'cQ�@V*�"��@YA
�˙�@\��(Ð{@`���9j@a�Z���@c��+��@e�@�)�>@h�cbP@jGGk��@l����@o����@p����3 @r �o�i;@s~��2��@t��`���@v^�J\7@w�����|@yn��~�@{*(��@|�#rق@~]|k-�@�����@��׊ �O@�؜$��@�ƾv0��@��'d7�~@����8�@��l�6�@�����C@����:�@�� �ɋn@��q�8@�������@�щLr@�&Z-؟w@�I2���F@�pE	�S@�M�E�Q�@��b���@���<�@����@��#�Y��@�W��5N�@���G�2�@����IJ@�@�>�"�@��r��w�        ?�&�lm�@�Ԥaq@#�Ȯ�~�@3H�^ʘ@@:5Շ�@HZ���@Q2t*C=9@Wt�#1@]�*�n��@b��� �@gd�.�@k�cH`9@p��q�@sU��y�@v[[�>��@y��Id�%@}
!$�.L@�YZyOҧ@�H�x0�@�Rʩ���@�w�R]�@���^��@���'@����(��@�
��$��@�^���٪@����@�-��?�[@��tAg�]@�-���� @��ޓ�<-@�^,����@�_E��@��N��@��L�>@��eHI��@���A얫@��Yu��@�{�b<<@�x����%@�{$��$�@��b���@��T��W�@����]@���^*>'@�״O��G@���Zg��@� �or޽@�M����@�~�4#�@�Zo�Q0@��nXl	F@��9�WH�@�9a�}J�@���G���@���ʿ�@�-�ﭘ$@���_���@��egn_�@�6�h�r@�����@����pbF@�Qf�:��        ?��Y��_?ӻ�G��K?�t]~�@�?��Z�Q�@���(!�@M���B@�w�g@�1���)@#�g�l@'��Q���@-\Y}9�7@1�����@4���@8j��ͳp@<3m�t�@@ 	�Ԅ@BH+��@D�� ��@F��<�q�@I�"�e�@L4 X� ;@N��j�ee@P��,��@Rz�c�@TJ�}��@U���]�@We}B�>;@Y&�:��p@Z���� @\�rg��@^�uF�K@`^��4@ac�0��@boY|��@c�UZ9@d��K�;@e��9�@f�H���@@h3�%%5@iEý!@j�� ��@k~�T@m
�ӭ�@nYl�=�@o�f����@p������@q5�p�y�@q�=ݠ�@r�����@sZ����@t�o�oy@t�
+��@u�:+�Md@va^�h@w*n�l~�@w�^G��@x�#��$|@y����@zk,,@{B���(@|�����@|����@}��E)        ?�U�e+�5?߬=�o|?��Z��)@U���8@����@&Br[@&��&�PY@/��T��@5[4t�+�@;���v@Ag9���=@Es!҆�[@I���GZ�@N�B/�@R-=�z#�@U�gy�@XJ�F���@[�k��eK@_OI��u�@a�NJ�s@c�ɡI��@e���sl@g�[9k�l@jSmRk�<@l�Ow�6@oPy/{r@p�2�p	@rXJ���[@s�D�E��@u7�4͗�@v��Y��_@xEȒ��@y�����@{}���G@})����T@~߼*,"@�O�LJ��@�4���͊@��.�*�@����jk@����$ @����"T�@��r����@��Qݍ�@��2G�vu@��>��L@��d:d@�4�p>@�#{�
��@�9~=v@�S44� @�p��W�@�H�\���@�� ����@�o=�2�@�"�ӷ(@���Y��Q@�60<ff�@��NyD�^@�n��|@��a=��@����;��@�Nx����        ?�60���?�k�䎺S?����@�-�Q�@��8��@C�KqB@$��<=@->�x2�@3�M�5��@9siD��@@ċɫ�@C�>귦�@H��j:�@L�f��DJ@P��#T@S���&	@V�6V�|@Y�����@]N�3���@`x����@be6���`@dlY ��@f��"Y��@h�t����@k��`<@m�)�Y��@p
? U%@qZ k��@r��/)`@t�o~@u����@w��5 @x�qg/!�@z.<ǒ��@{��B�?�@}w�_��@,_�^j@�u~,U�@�Y�_��@�B�z�f/@�0�$h��@�#aq`U�@�����@��9�@����>@�Vq�Q@�"ˋn@�/^�4�M@�?���0�@�T�/^G@�m;6�@��Gx��?@��H��u�@�fy��r�@�� 0r.@��w��;�@�&�1���@��@�CR@�Y�w���@��m��b@��ț��@�1�Sw@����Ǉ        ?�}r�JP�@
6ݶ�,�@ �loS%@0���3��@<
�^X(@EK��?3@N0�ـ��@TZ�+c@Zm4�a|@`��a��@d��ر@h�A9���@mhVP�zv@q:�t��'@s��Խ:@vߺ���@y�$�}@}K���	@�e\Wj��@�<�O
�9@�+�
�
@�2�Md�@�OP����@���ެ�@��d��c@�-$���@��K�\�@����,�@�f�����@���K�7@�&����@��~L�|@�[�$-�@��k��@�"�y��@��Ū���@�\�Gg�(@��q6{�*@�_S��r�@�?��ܬ@�#�SPU@�
p��@��4��@����'@��N\�@���x�@��� �@��z/� @���"@�Q�%@��f�*!@�,C&?�@�Hn�Ğ�@�4�!S0y@��� �2=@�[�/�_�@��o�\>@��[x-N�@�&b��.@��~}T�@�b�l�4�@��c�̘@���6O�        ?�g� RS�?яP���?�ݸrQ��?�y���Y>@�a�Vc�@�	hS�G@%�n���@��X@!���	g�@&
���@+�sX�@0KN5�3�@3P�,U�M@6�Hu'h@:)�kZ�@=⑗ܿ�@@�[&!Y�@C~�G0@ETc��(�@G����@J/����@L� Z[<@O�O���$@Q*oļ�@R����@T'ۡkֶ@U�@�Z@W\�o@Y	�Q��S@ZĽ�!�@\�G� �@^`R�*Ϩ@` W-��[@a�F{%@bՙ�@c����@d�y��@e*��a�@f>͏?@gV��p�@huEe�R@i��m�@j��|�Mv@k���A|@m"��W�y@nZk4',�@o� ���f@plI���@qS���@q�����W@r\"h9��@s�祛�@s���Is@t_a~�-!@u4��@u��.���@vt��$z�@w*HAb@w᳦P��@x��CT�g@yU�̅�@z�@]�s@z����}�        ?���P?ٓ��;A�?�2/�{@/8�	�@-.y��@k�d?J�@"�°���@*�Z�Ҡ@1x���"@6��a0�~@<�[n>��@A���$v~@EN���@Ii�h�@M�F�@Qe�P��@T�5T�@V�x��K@Y�aY
�@]]q���@`@�䚷�@b��ȵ�@c�{�QFq@e��aK�@g�2�p@j)o���u@lj�{��@n�Im�l3@p�'$K@q�'+q&@s&���pt@t~r}2��@u�b���@wL�k6�@x��G `�@zCJf[�@{�j��M@}a6D��@~�����@�R��w��@�*����|@�=����@��\w��@���Z�P@���ڎ-�@��F�u�@���b�O"@���T#>�@�����vt@����j�@��νo��@������\@����e��@��Y@O�<@����@{@��χ���@�w�_�O2@�Q�K��@�����2@�(�x@�p@��R���@�Q�nRN`@��0B�j        ?�����|?��;7?�{��R@ �,ZJH�@�>8�>@�����@!�����@(�	��,@0��QCW$@5��D�#@;A����@@���(>�@Dt`S,?�@Hq4�J�@L���3�@P����X@S]!1+�@V!���2@Y`���@\@3L��;@_�;��!@a��tMN�@cn���@ed_@��@gqƙ]@i��ޡ�@kӖ/�f�@n'�9�B�@pIK]�n�@q�<,��@r�{����@t-��֤@u�m�dP@v��O�@xv)�sS8@y�!![c@{���%��@}���)�@~�ν���@�6�ro�@��\w�@��҄a�E@���mWB@��t~�S�@����^e�@�����)|@��yɄ�@�����7@��	��49@����m�-@����i@��j�,+�@����I@�ر0�`c@��{(0�n@�'i�V�@��A*�@�+�D)�
@��ǌsF@�W�6�@��3D�Z@���R7�@�'y=        ?�A���9@�sf9-?@7��[�@*�eENY@6��B���@AN�s�d@H���T@P��D)�q@U����@[G#�$Y�@`�tQd@dN�~���@h#3Z��)@lK�W�� @pc��c�@rʳ���@uZ�z��@x��bqs@z����@}��]��@�����@�?D��@����^X;@����s��@��70�!@���۠ ^@��}����@������8@���hRY�@������@�5���޲@�bJ��C@����%�@��O7B�J@�fo�@�cWM+@��*�*�@���ݖ�@�rCT`��@���3Cؓ@�J���@�`���O�@�����@���)�o�@�����OV@�n6A��@�9��h��@���DYw@��S��9T@����@���T��@�^�Pr�@�;���@�I�@��
��@��ԏ!�@�ȹ�\}�@��D�ĢU@��5�#wp@���\%~�@�>�q̸@�������@�2��Ŧ        ?�s�d�3�?�N�/��f?�4�o94�?�g�Ɍ(@� ��S@�q���@86;z @IU�?K@$���Le@)$N忝�@.˸�ҵ�@2�1�?�@5����Q@9����g�@=�S+SE
@@�n��\�@C&:��U�@E��8ո]@H�>���@J�>����@M�e�4@PC�oKT@Q����ہ@Si
@nx�@U���N�@V�bAFR@X��ى�.@ZzI�(a�@\g9��ӽ@^dR�udC@`8�F�8�@aGly�K@b^��G@c|���P}@d��c1�@e�C���@gԣ��@hD���\k@i�qN�%�@j����p@l)n�n�"@m�[��G�@n�s��!B@p'�z�{x@p���d@q�g:0��@rZVc�x�@s��|�K@s�X��@�@t�c�l��@uw�ѶG!@vG|�)��@w�H�A@w���0D@x�f�R��@y�0�/E^@z�,f�I�@{jS6�n�@|P�4pt�@}:�YF�@~&��v�u@?�C�(@�}��
        ?�1i��M?�Ds>	��?�
E���@�7F��@�vۤ��@�*���@'%����f@0c��(/@5��vsW�@;�c��@A��'�e�@E�1���@J�Z��@O��]�2@RAIB7@U6o���@Xg"�Z��@[�,��u@_zI$M�@a��""@c�BO���@e��v�7@h/��t='@j��{�W@mD1�b�@o�Krr��@q7D�o�@r�^�H�n@tNM��@u��p�X@w6�M]�@x�h��t~@z��|I�@|A>x��@~	3���@݅����@����<@��¸�K@��Oܐ�@�ҡM�9@���߇N@��S8c�@��+h_M@�*T���@�+,�tm$@�L �,@�q�ۣb�@��ɘ��@��W]�	 @��&��7�@�	SE��@��z�-��@�V�GWd@��^n�@���ޕ4@�?����6@����L*@��	��D�@�7���<�@�╾ic�@����֡@�<�&�@��3D�        ?�����?��pYdID?�[�Ǖ�@�ZW�j�@�V��:0@!��,*A@(���-�@1J"u(�9@6����m�@=���*@B����
@Fʈ��v@KN�q�@PWdsd@S+�[%�@V>s��z�@Y�l�-@]�@�]�@`up��y�@bz�C࣋@d�ce�e@f�m���@iD6��a@k�����@na�~�a�@p�wnMW�@q�dq
Z@st�c�;@t��Њ�@v�-���T@x6��2��@y�%} ��@{��6e�@}rd/\�9@K%��@��hF�V�@���r�m@��'lH@���t��~@���T?-�@��� ,k@���6aq�@���,>k@���\�@�8U��)@�g���8�@�����RM@����MGQ@�E���C@�/'��(@������@�}|gF�@�(��]@���LQ�(@��q���b@�:��Sb�@��ё���@��r����@�d���]o@�"n~��+@����@��}Z�A?@�j��4��        ?��QQS�@�4aOR�@&���?�*@6��ߏ�@B]m�T�T@K�&�E@S��U�p�@Zmt�~��@a"{q��@e��#=�@j�4-��9@p��Y:@s�wo$�@vL��O�@yԻ�4��@}�����2@�׭2���@� C���@�I�M�a@��ԝ�@�>�i�Z@�����@��{;��O@�L�ثR�@��N���$@�b�eA�@�]��$@�������@�t�B@�BJ��r�@�U`M(@�@�*�@��ބ"@��ܮk�@����z�@����$�@�>ӫ�@��B���@���|zS@�=�s>�@�t�	V�$@�����@��`��H�@�BŰZ��@��בj�@�톿�u�@��a��@�Y?��l@�U:!��@�țq�=�@���1(�@�D���l@�P;g�Z@��x�0�@������@�a���6�@�0����r@�a�u�
@��4�T@����'@��Iᶈ@�fJ{�q�@�FP �r�        ?��R�=�r?��z���?�u��up6?�ҒWʋ�@�:���@&�q��@�_�� �@X~
�I@"��f-*�@'��B��@-�����@1shV*�@4�+�T@8���^@;�!����@?�F��@A�'׈u�@D:H�Nޟ@F�-,)H;@Ir�\@K����Rt@Nd���'@P�ʴ��y@RCqY?�@S����i@U9gy�"�@V��,�	@X�z�(�@ZW]x#E@\(H�˪I@^捀@_�v۹��@`����@a�:A%5Z@cY�v�@d�4��@e+����@fIL̴+�@gl�m��@h��;�cQ@iƻK3/�@j�ֿ���@l9��?�@m{B@ �@n�~�1(�@p�*rt�@p��d�@q_ۊ�ɉ@r�:��L@r�dщ��@sw�ao�@t0*��@t�3ѝ�@u��U�U3@vi���v@w,����&@w���@x�G����@y�����	@zTo���2@{$�'���@{�����@|͢�k�        ?���;��x?୯|��?���N�@N�"�%@n@X��&@ !vH6��@'������@0v�V�@5��]t�@<e,��%�@A���`��@F��k0@J�fY��@O��g�9�@R���E�@U���J�t@X���D@\v��W��@`�T�?@bn��S@d3��c�/@flX�Y��@h�
Rw��@k4Y}�I[@m����)�@p6z| @q�[N�@s���ap@t�ז��@vSQt��@w���"@yF�AP�@z�T�}�h@|�%P��=@~qO�X�@���k[@���*�@����t{�@����M+�@��ǂ�@���g���@���Tp�@�K=���@���\@�&V/��@�>� 5�D@�[-�@�{���Y@���:T@���pP�)@���p+}�@���P�S6@�.r�O@���Py=+@�iM��@�	H'(k4@��Na�@�O,���@���9�XV@��m��@�E�J)X�@��
!E1@@���b�        ?��wU��?ޅ���?�)�8�N@���#I�@'��b�@@��z�@&0�Lh��@.�.���@4��:���@:�����S@@�}�>��@D��8�G�@H��E�� @M�
�w@QR��,@TEk�;n@W�nD��@ZZf��}@]�����M@`�n4�@b�j��.�@d����)@f�5E?�@iZ���`@kyA�k�W@m��@p?�Jbh@q����(�@r����TN@td��5O\@u߂oF�@wf"��sp@x��>/�C@z���;��@|@M���@}�rW3@�ע�s@�����Q�@��E�_�@��!au@����rW�@����SU.@��G\�@���-[&@���[b��@��F�=}�@��C')7@�ō���@����@���K��r@�����@�CTe4��@�6+� ��@��{�EO@�d�a�!@��P�NM�@����;��@�6��N@��q`L��@�u�$��g@�Q7XI@��{֖��@�_w,�        ?��K�@�$` T�@#�D�8!|@3����p@@j��V�@H��pH��@Q�~�`��@W����\@_KZ�h�@c��h 5@hG�J�@m!Z�K�@qM�\g�@tFH��R@wyfn�� @z���N@~�	�>@�66fh��@�B���@�i�ia@���*f�@��5���@��LaC�@��7�Yh@�櫅�G�@�L,�Y&�@��й���@�>n�ZB�@���O�`\@�c���L�@�	9����@���y@�w����@�@����?@���S�0�@�za��Vr@�o�[~�6@�jn��,'@�j���]@�pհ�@�z��V/�@������@��i����@������@�ڲ`R@�����'l@�)U5��@�X �}P}@���BI�@�b2~`�@� ���@����(S@�EX�s9g@���r`g@��((�<@�=����%@��(�l2�@����@�J7g���@���s@~�@��<�*l�@�k�T��@�%&��DT        ?��f�0��?����m�?��P�{G�?�8:N@5#�S��@
��%s�@Ya�Hp~@��=纣@���}�,@#��eF��@(r���1�@-e^���@1d�p�!�@4O7���@7qN`4�@:�n��#@>Y�Bh}�@Aw�?�@Cud��@E#���R@GT�R�n*@I�)�p�@Lδ�el@NW���@P�&��@Qङ�8@SB�<3�~@T��B��[@V*=���@W���>�@Y>�P�!@Z�^��G_@\~��j@^/C���@_�0Ky��@`���%�@a��5}V�@b��X ε@c��v�@�@d�eU���@e�� �@f�^o���@g�L�\۶@h��Ti@i���A��@j��ekXI@k�]�k�@l�(�V,�@n ����@o34���@p-+�*�0@p½��Kh@qZJ]��@q�ȿ�[�@r�2��f@s,��Wn�@s˱�r�@tl�fU
&@u���@u�k����@vZ�nS��@wL��@w�\�.h�        ?����[�?��@Y=L?�a���w@ r��ݛ<@?��A@auT04@!m�u$@'�F��@/��[h�@4��Щ@:�����@@��|�n@Cv��]J|@G8�&"��@KU�Z(Ÿ@O�M�[`@RQ*��@T�D�(@W�H��l@Z�+� ��@]��i��/@`�����A@b@H?ˡ�@d怋)@e�:�a�@g����D@j*���@l/R�<@nkI4�@p]�L5�@q�G���6@r̩<!�@t�,�m@ub�2/@v�K�)@x.�a3@y�VE�+@{ �WɌ�@|~�/@~��5#@�A��@��[��@�g�Sj�@�<̄x��@��"�I�@���P\��@��ݽ�@��KF�]�@��g����@��b����@��,<�L�@�t�Q@��@�l��q�@�h�����@�g�	�ZI@�j�x>�@�p�M��@�z���@�C=Hv��@���YCpt@�T:���
@�����@�j��~�        ?��.&�?��"�T�?�Cp�4��?��j�#xu@W�m���@���<q@ '3 _�@&�`�Y�g@.^�!&�@3�a�a�@8��(h��@>ϙj�Ki@B�u׺X�@FV��]@JT�M��@N���FHy@Q�MJ�i�@T6�]�C,@V�9�h@Y�\\��@\ء���@`	!�~l@a��Q}��@c��yR�@eb��g�@gVɇEY @i_�G�;R@k}���_@m����@o�����@q)�n3�g@rax�&�\@s�?>F@t���x@vC�;�p@w���;�@y	��܊c@zz�e`|@{��=�@}x�Q�@ܕ6�@�L+���@��׆�D@��i-+�@��K�JP@��GӣP@�~Ln��@�aL2�u�@�H6�L�@�2��-�@�!�:�Mo@�ֹQ,�@�	����@�X�J�S@� o���@��yE@����@�]TB��@���⛫@���N�@�!�E��@��X��b@�1$�v�p        ?�W��f��@9+*�х@�K��X�@'�����@3��K=*@>>Y���@Ex}��w�@L�w��6.@R� �-�@W��B>M@]3�;]~�@a��(M@d�%c��@h�,�X@lZi��@p<��X<�@ro<Q @t��<�C�@w7�氁@y�ޔ�y�@|�Y�C�@Z����@�(�3��G@��9��H�@�M?�D)@��`�t�@��a%o�@�u(���@�JLB�m@�-h{Ӡ�@��B��#@���^��@��2$҇�@��-�Epb@���xPa@�Ϯ���N@����k@�_NP��@�B�T���@�u%���`@��9c�}�@���A�c@�.V�@�v�Ej#S@�ă�,s&@���+�E�@�7�z�if@��r���@�������@�KK��@���
�@��b���@�t�b@�1.<��$@���d�(�@��"R�@�u�SA��@�;�x��@���J�@��i���@����s8@�iL#�mb@�9ӿa�        ?� #�iY?��=��O�?�H���?���5q`�@��`�M@���ۋ@�nD2�@ٹ��/@!����@&l8ux��@+fb⥁�@0m|��L9@3dQ�Tm�@6�J��F@:����@=��db/K@@�q���;@B��yIn@E�C:R�@GK䫴�@I�B,G�@L1���g@NϮ.�o[@PĤ�֎�@R/&�?�@S�(���@U,z�E�@V��.4JR@X^o�S.�@Z
�����@[�����@]�raez@_[zCY9�@`���A�@a�/C�$�@b��I$g�@c����>@d�ifj�@e��M��K@f�A[O@gЍ���	@h�����@j���4�@k?V���a@lo�����@m�ñq��@n�l��@pU'4��@p���Y��@qZ�����@r�ܬw@r�S�U[�@s]���&@tl}�P@t���ٕ@uw�/�5@v0j�C�@v�o;��@w��b��S@xh��K!�@y+.���@y���`��@z�$7�1�        ?�ň��=?ۅSC3ԡ?���(�@u�ƺ�@���ݮ|@hS��@#_��y]�@*��ժ3@1�A~l�@7@�6�G@=G@j�^C@B	�i���@E����� @J0N<=@N��z�r@Q�LU��@Tq�̹�E@WO���@Z^	�?�@]�\�I�.@`����2@bR�� q@d7���-�@f2���@hCM����@jimM�@l�tIT�@n��bA-�@p��D�p�@q�Q�R (@s,~u�Έ@t{�N4K@u����$@w3�(f�@x�"���@zY��߃@{���;�@}#c��@~�o��:$@�����@�㗇��@��/�R.@������m@�c��]`@�@��(O@�!ED�@�[%$�@�����r�@����@��+���@����Qֆ@��l���@��=ș�,@������@���)פ@����;�@���ѱ�@�S�bA�@��?�vw@�^ �l�I@��U�<:)@�m�T�@����0r#        ?�����1?ۍ���@�?���Y��@�V":f�@@��>@RRCh3@$�x1Q�@,� ��@2����@8CPOT�@>��$���@B�h�h-�@F�_*r��@KJ��@Pd�i[�@R��-���@U��5T_@X�;3��S@[ڥ2�)@_S�K5��@a����|}@crY��@e~�Y{@g�ä��@i�2P�O�@l<����@n��Jա@p�y�t�@q�*V��@sK� =mQ@t��p��@v+^�!x�@w��9��&@y9�jF��@z�� ~�@|ux���9@~$2E��@�禴�#@��8�<��@���%�o�@������n@����6C@���=�!x@��`��@��F/�Z�@��NҨ^�@��$�/��@����Y6@���Y�@�ٱ�0c�@���n�5g@����b@�>�vv9@�4�>Uq�@���d�y@�e:�|�_@� ��Eyh@���5�@�=�!�rm@��ꞹ�v@��A�Q�5@�'�6|�@�έS�-        ?�8���-@�!M�w}@�)����@/&���d@:	b�%ݴ@C���q��@K�$D�+9@R�(�ۺ�@XJ`VB��@^�!�$��@b�?�>�@f�"��L�@j��"@ow�^n@r3,ƂU`@t�{
�5@w���T*�@z�2���@}˽H�	@���L��@�M�Ǹǿ@� �p�0@�	)��@��[�@�}<�@�;@�T@�s�P3�@�_�=��@��t��L�@�ț�j>�@�2`[d@�W.�S�@��D|��@�
�� �@�q�y@��=�,r�@�[�C�$�@���g��@�h�$��@�~\�C_I@�L�_�q @�CR�>�@��'��@��K�p��@����,�l@��9v���@�{�4�G@�g�-ՁG@�X�p15@�LAm�,d@�D��J��@�@��Э@�A[u��@�E�p�.o@�M�Lg@�@�Zz���@�4�����@��ǎ�]�@�JtƷ
�@����E<P@�gMy�L�@��rU�AT@��dX#�Z        ?��١Y-�?�`8l1�?�͕�f?�N�I�*�@x�Ud1@iy���|@���2��@ˢofx�@!�^E7(@&���_@+�9�e>�@0��F:"J@3������@6૾.'�@:e��[9@>(ү�R0@Ae�L�@C2�2�z@EoC7�9@G�VnC^�@JA-p� j@L�J�O �@O�U��@Q+y��%�@R�����@T$Q�۱K@U�����Q@WT�C�f@YL��J@Z�{D+O&@\��uX�@^W�\͌�@`�AO�@a ��w@b�ҥ@c�||�0@d 0 Ef@e0W�i@fF�n���@gcl�,�@h�U�]�@i�d��Ǹ@j�-�lɪ@l���.�@mG��!��@n�Ё(�<@o�io8�@p��p@q0	�*�@q�|ݶd�@r�hJ<CL@s3���Q@s�>�_4@t��pqfT@uM"�j�'@v�]�@v�
�Wb]@w{h� W@x9�{=�f@x�ǘn��@y��Y�@z���1��@{I��V        ?�������?�����W�?�f�O9�@ ��T�@���c�"@�~�}6e@!|f8��@(b����@0O�Ŏ�q@5�֦�$@:�Z���@@kcL��@C���L@G���"t@K���3�@P;�h�m@R��y._@UV7^o�@X(�����@[)@øp@^Wz&�b@`�|��i@b����v�@dx2�m�@fhT(3/�@hnUj (�@j�ȧ]�@l�mT��a@o ��0@p�$�0TX@q���	#@s%�T$v�@tqh��E@uƵ�!�@w%�I~�@x�a�*�@z �hr�@{{���t@} ���n@~��?��d@���&�@��A1�@�����@��i=��@�lL� ��@�MlNO�@�2�_�\�@�%�5�+@�	���@��ض�@���ْyS@����.V�@��	�=��@����5#v@�쓝Q�@���@� ��I@��R�M@��n� G@��X���@��L\�O$@�7�=jk�@�ǲv}E�        ?��D����?� ]1�'k?𲙫0J@]��x��@��i��[@SEG�2@!�c�3�@)�+�'@0��J�F@5�{I)u@;iv�e�z@@����U�@D��0Gy�@H��0�E�@L��C�B@P�a�S��@ShvG���@V.��$�l@Y'���'@\QWRā@_�`��x@a�i��|&@c|���:@et0�L�@g��l{e^@i�3�غ�@k�)\�g@n@hzf��@pV�9�3�@q���Z�@r�%��<@t>���!C@u��T@whf�A@x�����@z�_��S@{�
�>��@}5�w@~�m�/�F@�C	b��>@��;)@����nr
@������@�Б�.�@��A% ��@���M�3@���\��@���Ռ@���C�H@����x@���~��@���	@������@� 6��f@����.(@��`b��@��#W���@�Hs�U/|@��ᤉ�@�yg�-�@���J�@������@�RL��,�        ?⡘�5�@<%\C��@� @�@,vÐ���@7�A�r�W@B,�m�@Iƺ��î@QbU+�E.@V�m��<�@\vT\2�@a�3���q@e'i^��z@i!L�ϊ�@mrFn�^�@qԿ�h^@s�]T�+-@v4YS�@y_��5@| �wA@)��R��@�<F}�@���E1�@��.�=�b@��D��Q�@����,�@����L>�@��IH�)L@���0�=�@����\��@���)�:@��Yb��@�6ɚ�r�@�|���@��ݰ��@� �N@�@��Sk>�@��̠�@�VAQ�lL@���a@��@�MFTؼ�@�jQ&b��@�1�Z��@��J�;w�@��}�m�@��k�J�@�vo�g�@�P8���i@�-���Vy@�1�/��@����W@������@��([u̇@���(`?@��|����@��l۩1%@�����'�@�����@���Ӻ��@�G���5�@��Ю*�@�My��P�@�Қк>v@�Y.J�/        ?����`�O?�Z�s-�?�(�y�G?��x�6��@?�U|��@?��%�@�U��n�@2���P�@#{��Z%@(k�Yɮ@-��B��@1����X�@5@ {V�@8��!I:6@<��^'�@@W��;�@B�:<���@D�w�@G8+�S�@I�,�MN�@Lm�~H��@O7�k�>@Q~|�2@R�l����@T'��\ @U��1�{@Wz�<�[r@Y:˄��@[	M:¯�@\�Gʔ�@^њN�#2@`e�T�s8@aig�Y~@bt<w��@c�IL�@d��.�b@e��Y @f�3�S;�@h�3��@iDLh���@j~F�D@k�\#Ϛ�@m�F�:w@nQ��٦,@o�3���"@p_G��@q/<���@q�%����@r�
�Pa@sP��-�M@t��"j�@t�S��9�@u����X@vQ͒^@w����@w�e�@x��S��@y|�х��@zN9W��@{"-cL�@{��$-D@|щ��A~@}��Ar�        ?�@�&��R?�^�es��?���@T�0mc@����b@�Z�lX@%�����@.W�i9�@4ES��@:7���@@����Ě@DYW��Y@H���&v@MXzzB�e@Q@�J��@TٶO(.@W�7��[@ZL)���@]�1NS�@`�2��s4@b�:��@d�fH�@f���
��@i�MY:s@kb8��$@m�d�'�@p,y�dKj@q|9	��O@r׺5f��@t>�T�K�@u�0(���@w.�K��@x�D<&a
@zJ����@{�ojpV�@}���l��@C=�ہ@��)��@�c' GK@�KB���h@�8'N�N@�)��W�@��)��F@��$4N�@�
#��@���t�@�%����@�2*2?��@�B����@�W��H�1@�p���U@���#뱏@�� R��@�j&'��f@���l�w�@��w"*��@�.��H�@�ȫ�=ݽ@�e,��/�@���6��@���(��`@�E�����@���7�H        ?��f�td�?��{�]�?�5���R@���v@������@ڛG���@$�cU��@,�g�2�@3#�����@8�!����@?BR��c�@CI<6.��@G]��
�J@K�T
�D0@Pf���:k@S����@U��`,�0@Y�L��@\b��Lh�@_�����_@a����3D@c��=�@e�����@h�t�>�@jGiaغ�@l�S��=@o r���@p�����@r'D�0�@s�n�h=@t�o���@vh%Qyf{@w�mh��@yx"�I�@{ �}=@|�CC��@~de�L��@�26���@��-�(@��5`T��@��"b/@��#�ͱv@��M��f�@���a�9@��ɦ��@���ʠ'@��9��ߗ@��U��@��T5�N@��,��@���d�x@�?O*,�@�g�C+?�@�JDi���@���1{U@�~Q��p�@����)@���,��@�]���|�@� B�M@������b@�Qg��ؕ@��A>6�        ?磉U�@n�_H�@!��B��@1n+^�ј@=Lש�~F@FJ��3@O��R�r�@UeN�M��@[�i�@a��@e��!�	J@j<m@o6�fj5@rPs/\@u;m(�[4@x\�ǩ�[@{�(
�R@>85e�-@�~����@�w����@��%?}`�@���f��@�����H�@�U����@��K��z�@��%���@���|�|@�Z����@�¯���@�6��+i�@����S�^@�?�:��@����=�@�u���@��Yze�@���T��q@��.*E@��n4��@���$��@���2'@�{��q�@�tx�z�
@�rߎL�@�ty:y4R@�{��,h@����d�^@��eʎ��@���_9��@�ǳ��$y@��)����@�	6��@�9)!��@������@�F)��z�@��dzvPK@�|� 5�@�I�J�]@���y�@�^��/5�@�p���@��L�vH>@�S2P�R�@���i}v        ?������?�Hb�D|�?���M���?�' ˖m�@ ���U@X�V�	@\����@�m�؂@"x�d��_@'(�M\G�@,^��P�z@1C��T@@4-w��(@7�yNfs�@;2�/�0_@?\9��@A��\S +@C�.��uG@F�~��@H��c�@K��z9@Mǂ��+E@PH��?@Q����N�@S=��E��@T�'@Ð�@Vl����@XT���@Yӊh�M@[�Ӧ��@]q��q[@_UR?���@`��f6�@a�D�a�@b�y�T1l@c�2ng@d�M�CH@e���l�@f���L�A@h���À@iH1�U�@jwXg���@k��6��@l�K>�9@n%��u*@oj��Mv@pZ�r��@qL?�\@q�����@rYg_ qh@s�F�{�@s�����@tn� G��@u%]?#��@u�^��@v��[�y�@wWY8}9@x@�G�d@x�c�*��@y��EgV}@zdCo��@{,�l�>|@{��.�j        ?�� ཎi?�RϨ��p?�T��@^g6"�i@�6�@a'�*@#�ˈr^9@+��Vj�@2��9�@8/D�U@>��v�@Bԯ����@F��x�6�@K=���@P	�9�ku@R�!�J�@U�^�i�@X���Y�A@[��R[��@_Y|�j @a��O�&�@c|IV��@e�����F@g�HK�@@i����!@l_�(WV�@n�N�~:�@p��2{@r�G��@suՙ���@t�н�-@vf�x��@w����i�@y���oP�@{..���@|޴���@~�Lu9�r@�1�v	z@��$bߝ@�ۉ���@�dj��@��~6.E8@����@��П�@�3��Pn@��]��@�4�M6�@�Noի\�@�m�u�H@���9��@���]58�@��?d_@�-_�@��~e=H&@�F
�W�@����^�@���$��r@�+�u�u\@��/&��@�zbdFp@�$���@��K=L�@�П���        ?��ƅ�5?�ê�~�V?��k`��@���.-�@m�(Fv@$��xM@#:�N��@*�Z�Mp�@1��$@7CRjQ @=W=}0��@B����Y@E��w��@J,t6揬@N��X�@Q�ٟ��@T��8��@W�J���@Z�@G��@^yP��@`�6�U$�@b�=����@d��60�
@f�W3;w@h����h@kh�RRB@mc����z@o�(�B�@q(Q%׿;@rs���hv@s�^A�Q�@u+C
��@v�tm@x�
,�@y��\u@{�O�+@|�W!�@~A��C�@�K�+h/@���p�"@��7i� @��{�q�@�h���t@�O���H@�;�Њ��@�+yY�X�@�7A^v@��kZ� @�J�� @���-��@���[�@�18d{@�%���K@�3�x��@�E��D=@�-�ƴ�@��m��c8@�G{�]�&@��@�V|@�h��,�@�����P�@���Y(`�@�&�n��        ?���W1�@E�S�t�@Eo{�Z@.��kh�{@9�"���K@C~��]�@K�k_�Z@R��,�@X0�K�]&@^�+�Щ@b�<i}�=@f���E<�@j��SCW�@o�R���@rK���,G@t��k���@w�z@z�{��@~֢�Y@�����@����3�	@�b����@�T�ȺP�@�\>��b@�x@ȄE@����CW@��9�'�@��*J��j@��zƧ�N@���^)@�cEs�_@��oꂓc@��U�1�@�x{�RTU@��
�D�a@�^m�@��@��~Z���@�gf*�@������@�Ȩ�mCN@��T|�hE@�m�"98�@�F��@�@�"��@�@� �7��@��	�,ō@�΢Qw@��ݨ��$@�������@�����@��ߓ�9c@�����@���9���@���繊@���=b��@��3���@�L���Y�@���kJ=�@�Z�T"�@��뎎xC@�n�S�@�����@��.a�R        ?�!�@s��?��G�ƙ?��K?��g�sz@�Lڪ�Y@8�~���@��TW"�@C�~�)@"�^Dl�t@'�->��@,��x~!�@1:��ao@4U���`/@7���g�@;H�n,@?� �@A�\�x�@C�����}@FC�*�@HlE��5@J�j;Qx\@M�J:�P&@P"�H�8%@Q���rN�@S��Ӕ�@T�A���r@V!L�y��@W·���b@Yqb���n@[-/\o/�@\��ӵ�Q@^ˍ�(^�@`V�?�@aN"U#��@bKy�{�@cN��<K@dW��	]@egG"��@f{�k��=@g�K*7U@h�p�;M@i�,ԝI@knK�@l8"1q@mn5��Ӏ@n��V�8v@o�$яs1@p��U�^@q=I"�'�@q�'��{#@r�����@s<U_��7@s렖{B;@t�b�m��@uQ�dJ�@vBT��K@v�ZZ��F@w|ߨto@x:�-�e�@x�3)���@y�?22@z�E��n@{J���9        ?��L�Y?��a�|k?�c��(��@ �R"��3@�a?3��@�q	��@!��z��~@(��f]@0hcs�%@5C�5�d@:֨|̕@@�����@D�̐�@G�B �@LG\F�!@Px�\'�.@R�i=桌@U�_�;��@X�IP%@[��hu~@^��M�@a<!�G@cT��@d�,�5@f�I�Z,�@ig�ڱ~@kJBt̍@m��.�G@o�Z��T@q1>f���@ru�L���@s��H���@u���,S@v��@L�@w�k�@yh�_��<@z�Nx��@|v�Èb�@~�����@��-2@��%�Q@�� �&�@�`�5(ԛ@�B��-3@�)��JB�@���@��=2r�@��.)���@����<@��:�r�@��?v@���_D�I@� �X\7�@��<�{v@�"m��@�9�WH�4@�*��@��`��.H@�LQ'�QG@��W
�o@�vn݁�@��l�#�@���kį�        ?�����Q?�l�1�g�?����@ �vR @���|i�@0Af3��@"~�8��@)��)�œ@1*}�0��@6,��9@;�l.� 3@A-3n�@D�uB�@H�A2s�	@M����'@P��a��@SjL}@@V!�orX@Y����@\S��V@_^_t
�F@af֩>�k@c4�L�a�@e7i�@g`;^[@i"��e�@kG�D�_z@m�����@o�u��C�@q���X�@rU�L�V@s��BX)�@t�H�٘'@vD�'�3@w�[k:�Y@yc�ˁ@z�}��@|t��@}��	@2 �~@�Y�Ip!@�)�Z�7@��?�%q�@���F�s@��87�\�@��P��o5@�r
DF�@�XOK��@�B	��@�/ `�f,@�}h�h�@��m�7@�	��J(@�A�%�@���fA�x@��u���@�Io	�@��nN��@��xs�բ@�P��E@��]�Ċ@������@���t�4        ?������@k¶'��@6�s��r@-�����@8�>� @B��I-9@Jv�J���@Q�~�}g@W���	(@\���U;�@a�K�g@epߣ�A�@iknџW	@m�F���@q/s��u�@s�@,7V@vO��ڙ@ye�@|�p�²@/��Ѓ@�9p.z0�@����	Y@��.����@���6 !3@�y��x�S@�w/�&�@�����ƶ@��/�D3@�j��H@��^��[z@�� &���@���_�|@��9i%�@�^4|,99@��em��_@��!��^O@�MNkr��@���Q�m�@�����5@�~��d��@���+i�@���;Ѹ@�w�8��Y@�< Q�@���i�@�Ώ nK�@����W��@�n	�F@�@�B�!kf�@�K��@���>��l@��qρ*�@��,��S@��饑�'@�}����@�gU�u�W@�S�2�6�@�C�H�߄@�6�t��@���{ @����q@�w��%�@��|]2-        ?�~��Z�?ӣ�X�O�?�s��D�!?��K8�@@��LKe@5���|@��H}�2@L�w�g�@"�AG��@'��|=09@,�)l���@1L���.3@4m�&��@7�8c�@;m��*��@?J�lp}/@A��M�T @Cޙ��@F(?䯷�@H�j�=��@K��\��@M���o��@P8��-�@Q�����+@S���w�@T��g�p@V=oj�I�@W�(q9'P@Y��� @[L�6?�F@]���@^�L�E@`f�E�r�@a]��Ϊ@bZq�e��@c\��5,@de*f���@er�0c��@f�=0/�@g��&X�@h���|%@i�o����@k	����@l6�4�O�@mip2h�|@n��� �@oݑNU�@p�`W�b�@q2E��K1@q�j�'�@r~�q���@s(AC�@s�ݔ8]@t��+��@u1T���@u�&�ؔ@v�4�\@wL�Ɓ�@x�p���@x����ٓ@yz���P[@z8c�G$@z�(y<�T        ?���@(�?��!�n�?��C��@$���σ@�l���@'��8r8@"w�?|T@)���@1(k:{�{@6.{�u�>@;�g��9a@A7�c�@D�VLDsz@H�4h�9@M7t��$@P���dz@S�$̓4K@VPN�Z@YB��P��@\eݻ4Y.@_��?Y�@a�����@cw6'>��@eh�S[@gpl3��@i�����@kƑ���@n�d��*@p< iļ�@qy0o�:�@r�l���@t�f�(@urz�s�@v�j3|�@xN�*qo@y�U@�R@{Rֶ�
?@|�`��4@~�̔n#@�~s.T�@���Mw@����dX@���&��@��:ZR@�v'L@��@�d���M@�WL���@�Na��R@�I�̡C@�I3�&�@�L��C �@�Twc3R@�`@�l@�o��1	@��:}�@��P���@�Z�����@�������@�{,��q�@�(+.h@���G���@�9p����@�ѱ�<�        ?��ڸ�R?��xO��?��~��B@ f�T�@�����@�ǃx��@ ����e@'���MkD@/w�?S��@4_��v@9�ˌ��m@?���� o@C1֭���@F�����@J�1���@OY�z��@R�l+�@T�@��@WS�Τ��@Z9�p�� @]Kr�ݺ@`D��S�@a����xn@c���,.z@e����e@g��?�F@i��?:E�@k��4(��@mܟ���k@pO�1\@q7��<�@rjft�F@s�jk,L�@t��'�@v6/�Vw@w�7�D�@x�m��d7@zM���N@{���g�"@}/E��>@~�]��f@�`��iD@�ܤsΊ�@��gK�@�q��*��@�A!�(�_@���$�?@��ޏf�@��F���@���t�6y@�S�b�@�a|@��@�Fޏ�R@�/'�E�@�K)�2�@�;Iʸ!@���\B�p@��N��c�@��W��#@������*@�k_X�w@���Nf�H@�i��vu        ?���[	�@�8�~�@�2G쟵@.)�����@9>�4���@C5���@KB�j�@R-lۺ`v@W�24�}�@]��%3{�@b5E�V,o@e��9Z�@j	��y�@nxh��Y�@q�%����@t-E�T��@v�&�2;�@y�Y(�@�@|�n( d`@�}%۩@��I ȟ�@�zcC���@�R�.Lx�@�>����I@�>�	��@�P��%5@�v��U�@���.�|�@��Tɢy�@�+�8��@�c�i�_?@��֡vy@���xr==@�>:�m3-@���3C+@�����	�@�d���@����x�@�O��m��@�Ѯ&�/@������D@�v����@�BHM��@�=4�a�@��ژ��P@��#@O�@���'@/Q@�v�c�@�W�����@�<��1|@�%U��@��;0�Y@��R-x��@��;��@��F	��@��l!D�@�٥x��P@���O	R�@�l�MA}@��i��{@�rN8d�X@��[s�@�}�^2��        ?��L؞�?�o�Qw�?�X	3��?���R��@�w����@Ck�7��@I�~:�@ DTZ�@$���э�@*S>3	a1@0 ���v$@3c�[�91@6�=����@:�ΥȦ@>��A@A��s�E@D
&r�@F��lD#@I-�?�2�@K�*�|qH@N����V�@P��Goo@R�6�I@T8�*���@U�Ts\q�@W��|Q�@Y�@���@[�I���;@]���>z@_���Ou�@`����@a��2�8�@c�qA�@d5uD9�@ec���P�@f�����j@g��~�v(@i^���0@jg)��5n@k����@m&o@ntڍ�5
@o�p?/@p�P^��@q_� C�@r�Gv$@rݵ�d�X@s�^�k�Y@th��K@u1��Q*�@u�f��G�@v��	 �
@w�a��u^@xu��sR@yM���ۈ@z(:y��@{���as@{�d�I}�@|��~�@}���_��@~�&+	�@~	N��@�50���        ?��LYG��?�8*�3��?�-@E[��@�Y
s�@&j�a@I.�Z!�@&B���v	@/g�2�@4�?�xl6@:�����I@@�H?��"@DҲ&�@I6kE��J@N+��h@Q����ӓ@T�c�i.@W��u�V @[a��@^����v@a/FÞ<e@c1-?'�B@eO�m�?�@g�F��:@i���]@lS�c��E@n�2�wW�@p�	���@r(}k}�Q@s�kn�(�@u�7�b@v��i��@x7b����@yۏ�Y��@{�^�Q~�@}I���%@(�@�ta�A��@�e�4~H@�[���d]@�X	��D�@�Z ��cJ@�aV���@�ni�I@���P��@���x��@�����	�@��+����@���МHs@�'�hJ>�@�W�}��6@��!ĺ��@�b�Q2�@�%�y�@���g!@�D���v@��y:�A@��m�r��@�90� �+@���QO@@��Q/-c�@�>�߲��@���+|b@��l�� V        ?��:�a�?�Id��?�1?|�V_@
���p�S@X��YW�@"O�D�J@*���A@2y��M@8�Bk��@?��:��@C����T�@HI�[���@MI1|q(@QdfI5��@TdSH|��@W�G v�@[$T��*@^�*��x1@ap��o�@c���D(@eˁ�b�@h&��C�@j���d��@m6��;�@o�V}�@q]�P�l�@r�u�k&�@tYIb+U�@u���@w����@y:���[l@z��k@|���=�&@~����UQ@�;��"�@�3���Zx@�1��=�@�6yn@e�@�Ad]�Ve@�R�����@�i�0��@��\%�@�����qJ@��r����@���6�@�9`��n@�t��?��@���j4>@������R@���hS��@�M��|]@���z�R(@��$����@�Yc��yX@�>�˖8@�çԂ��@�|�]Nk@�7���Q@����4��@����"�@�xd�$��@�=-��<@�3�ڛ�        ?�_4�Zǽ@�����@&�Y��.�@6+�HX�@B�s�S�.@L	?ꤧ[@Sѽ��k�@Z����s�@aI5z+c@e���XV@j���,@p#H��c@s'7���<@vl�H@y��] O@}�`d�@��2$' @��,��@�GD}Tׂ@����W@�)S��$�@����@��|���@�/YGa�J@��$�\�2@�5�v�@��N��a�@�ut�D^U@�*ا�t@��_�Lg@���%�@��lӸI@�F`d���@�C�5'%@�HH5R�@�So�1�@�eUaL��@�}����@�� kJ��@���6�,@�����@�!��n�@�Z�ա�W@�������@������@�)�m��@�=p�c{�@����E�3@��=��@�H���@����P+�@����N�@�k���Y@�'͟h��@��a�8G@�����ab@�k2��z2@�1W�5H3@���w��@���mD8}@��>QQ��@�a��#@�3�I��        ?�M͒?���Qm9?�FJו� ?�r�S��o@�{	�v@�5#�J@�7��+�@ ��#<#@%M�b�7@*���۲h@0@g�Z&@3zc��)G@6�X�O�@:Űi�:@>չ�;J�@A��H
�@C��]/�@FR8bh>@H�)13@K�mފj@Nd`��@P�j~�@R2 �ƅz@S�r?q@Uo���@W#�g5U@@X�q#f4@Z���K��@\���g�@^��p�B@`B��ʌ�@aH�q(ɹ@bU ���k@ch���Q�@d��)\:�@e���|'<@f˼-@g�/��w@i/@����@jjߋB�@k���ڴ!@l��~�v$@nD�䗗
@o�� @pz���G@q+��e�w@q��nē�@r���&Ļ@sQ>���@t�+�,�@t���@u�U6,E�@vX��D@w"�6�@w�̿@x���F��@y�9����@ze�h�|�@{=�M5Z�@|���D@|��^�@}�'H���@~��iz        ?�甆u��?��kgG�?���F��@׬.G�@�H9�@ �xtL�@(K�\���@0��3k�@6��{yoY@=.��{�@B^�U��]@F�*�� �@K_�~��&@PL�3D>@S(
X�f�@V@��`@Y�m�.@](�/|^[@`{��!9�@b��ו�U@d��U/M@f�����@i=i��j�@k�¿O�'@nG�.YRu@pz��ǸB@qޒ�h��@sO�/��@t�#ibs @vW57�C�@w�{��[>@y���TЊ@{=�|�L�@|�2�*��@~��ڳ��@�Eݎ��@�3(U��@�%���j�@��딡J@�b��Es@�E �p@�#73�X@�.��o�V@�?C��g@�T{p�]@�n`�F�@���Dt�^@����Cs�@�ג�dI@��-U��@�鹡�@��hg�@�P�RC�@���@��(�`W�@�2ξ��@��iuB#@�}�W܍@�&J��%@��wl?�@�|c��@�*ɳM�@��Dz�H        ?�b�0?�v�>�V?��lDxl@��(�8
@�:ˍ�6@!�{���@)�iTU�@1t�/�Z�@7I�E<�@>H���!@B�>����@GC���@L���me@P��5�*@S��*��[@V��[à@Z7~�~�[@]�g4�6�@`ᅄ���@b�]浑@e!V��I�@gm��܍�@i�ƚ�=�@l^(�޵>@o ��C(@p�rԌF@rK@�/Ȼ@s�bMȎ*@uJ%#�NK@v�3O��H@xz8�^@z#���C@{���E@}��`7�@c�!cz�@���M��@��HH��@��$�D�@�z��B��@�y=J�-�@�|o
E�}@��;�hK�@���D+�@��=��/@��>�1q�@��q����@��<J $@��"�@�3+b�1m@�\!�QG]@�Dh����@�ܓpRV�@�v����@�E���@�����d�@�N�9ϗK@����MA�@��q�ә@�6��<i@�ܠ�Ǿ@��1f��@�-dn��@��53�}�        ?��y�s�@�?&( <@%�����@5��q`@A��� �7@Js����O@R��/P�@X���8�S@`#(��j@d1?ӵ@h�x ���@m�p�?s@q��pQ3�@td��i�@w�r��!�@z�8�wf@~�ߑ�4�@�'A�@0�@�"SU�@�5�T\�@�bj�U*@���!I��@�ƻ�N�@�u�BSȬ@��ܭ�9@�Ϸ�$�@�*��6�W@���0�@�@���Y�@�}?*���@��T^��@��a�&_(@�/�&*��@��o ��@��q˨�@����*<@���� m@�i�mq�@�U%7�^�@�F%��@�;�Zb�@�61Y���@�5^{i:@�9A\��9@�A���b�@�O,ݴx@�a;_�/
@�x	�<�g@���(Bͬ@��� J��@����N�a@��f{�}�@��:Z�@��LU#��@�NIp��@�좋��@��W��`�@�0h�0e)@���-1pF@�}�EŊ�@�'��W<[@��>���@��`<�L        ?���z�[�?ф�q�D?�Š��m?�a���@����@d�
m�n@�/�@�He�H@!j����@%�"q��@*�}�V@0"`+2v@3m^`jX@6P�fY@9�! ��@=tR��^9@@�j�,��@Bď��j@D�_jѨ.@GE�?��6@I�eNF�@L;���e6@N��1d@P�$��@RAv��<f@S���<f3@UI�,��@V�*WU��@X��~K@Z;@k��@[�jm�b�@]�[۠� @_��؇�c@`��w0��@a��s0vq@b�P�3R@c�)�-:@d�.����@e�[��@f��=F��@h7C���@i2kQ��@jZS1mǾ@k��X9�@l���tR@m��A*�@o2JҐ"r@p; �K�@p����z@q�hx���@r1����5@rާ4��@s�V*3��@t@���>H@t��5J��@u�q�7��@vg�41��@w$�Չ�@w�Cb!��@x�]��Ѱ@ykx�t!@z2.�q�@z��F��P        ?�4�Xq?��hW�׿?��s&��@���Q[@q���_@3�ӥx�@#_�,���@+��JZ@21�|e�@7�U�~��@=ؽr�	8@Br�j{w@Faa�d��@J����@O~6�4�@RU�=��6@U!U�	:@X!(`(s�@[T���X@^������@a*lBR�@c�)*��@e���O�@g#v��H(@iP�-g�@k���/�@m�[Gv@p07j�\@qs[�P�@r���@t���l�@uz�꫙@v�N��@x\���@y�ƠH�"@{b��sY�@|�Nw�I�@~��|'d�@�HE���@��X)�8�@��oR���@��tr*,@��OF���@�g賔�O@�P*�2H%@�< J�^m@�+T�45@��R׃@�(�}�@�I�p�@�
�hC@�	��O�!@�K(�a@��F�2�@�w�Hj�@���'H@���W�p@�"��+�@��lA�r�@�7��Xp^@��,��f�@�R�L�e@��$&�        ?�^���o?�}���5?�}28�c�@Z�
 �$@*?>�Ř@Y�Fĸ@$7��mI@,K,��9�@2�t�%�@8�M��z�@?%���R@CA�J�@G`�g���@K���@Py�W��@S4[Z�	�@V(�a�46@YVF r@\����3@`/KI6�@bn��T@d&^�@fL-1|J�@h�f��U�@j�(@ǃ@mfa�V@o����`2@qU�z-x@r���貁@t.m:�Q@u�`ܒ`p@w;@���@x�����@z{ ����@|-t�D|@}���q�@�Y�h7@��&!l��@����ƞ@����_��@��v��{@��:��0B@��?8��@��݁i�@��q�=��@�ݭE�r@��m���@����@�4��c@�Z��%@��A��@���Υ+@�q_�r}�@��(4�@���WB�@�E��tt@��s�nz�@�����v�@�)WZE��@�͔���6@�sJ�	ڨ@�m�܁@����        ?�ܯ�j�@�����Y@�P�$@*�<�y��@6��6�2@A.��'f0@Hf塐ӡ@PxDt{F@Ue)Μi�@Z��FZ@`� �G@d�
(,&@g�75�g�@k��%�z�@p���_!@rq)/<q@t��md�@w�M剤�@zZrC|ih@}IN�^��@�.�<�1@�˧�q�x@�z���e�@�<�P�Rh@��T���@��k)�@��3�@����%HQ@��Y��@��I�J@����^CU@�䀆��@�Yy�!�@�J#e"C@���WZ�@��� �"�@�c�q7@�q^Z~��@�ͣ��/�@�1$Z^,#@�����M@���s@��E����@��>��@�F�ǡr@����"@�����3@����5�r@�wU����@�L!��>�@�$\	'��@���-���@���I�@��c��j�@���4��@��#�o�z@�|t�I6@�l��O�@�^�l�p@�T�iկ�@�&ߍ���@���-�-�@�$�&��        ?�(ěL�}?�	�j?�&Q���?��yX�<)@�B�_Y@A��ʏ@��Ku�g@��nG#@!!���|�@%t|o�%�@*A�ށ�@/�<�W^@2�ٿ�@5�=��>�@9M�HfH@<��~���@@=$[n�@BA*w@Da���c-@F��VyD�@H����]�@Kl��� @M�6y���@PT���W9@Q�3�d�@S):ke��@T������@V2��s��@W�_EHv}@Yp�=��@["���@P@\�@�$�@^�j�+�@`Bs��@a3���f�@b,�t�@c*����@d.)�T:@e8	r�@fG�H�@g]eR�*@hx�*03@i�P1U�@j����z@k�D����@mTE�r�@nR�ę�L@o�C	��@pg��A�@q
n�K��@q����ډ@rW�or~@sW0�x@s�L%�#�@t^�@���@u��M�@u���b��@v{�]��z@w4�&zr@w�l4���@x�Z�[��@yn�����@z1L�"8	        ?�g{�=�?����y�7?����@�ߵ��@��E�5@a��y7@"�߸wn@)�l,K@1`�΋�'@6�/V���@<y�����@A���>8%@EWr�冢@I|���@N����@Q}��0�@T*dxz@W	�IO�@ZH�H�@]a^,!V�@`lI8/�@b@��F�r@d-���@f3�xU@hP���@j����}@l���?D�@o7a�$�@pـ-��@r"�9���@sw���@tׄ l�@vB�۰�<@w�8��@y:�[��@z��Ɣw@|^K�ϯ@~ >��@�ýȋ9@���Z�@���l�8(@�x��Y��@�d)����@�TsSL�@�I�l U@�D��\@�CBb�@�GR1)ug@�P.�q�v@�]�w͒y@�p�D�@��� ��@��V�e_@��7�H�@��|C��@���KUZi@���C�@��{N�s�@�QsŦ�@����➇@��>�Q��@�,ʄ��2@��B�K=        ?�VD���?�O�� �[?�*@ �y�͡�@w�er@ZE5�Xf@!.��}�@'�9(�@0 p$�5W@4��T��\@:�F%��@@t\@Cq��X@G+$h��K@K=����$@O�7-�wO@R6�aΚ�@TĮ-G�V@W~qU߾_@Zc�+��b@]s��-�@`W��2[@b	P����@c�V�7@e���˛�@g���/z�@i�QA��/@k���(�@m�m��C@p�ˁ�@q7�8+��@ri��L�R@s�VfT�@t���2@v4�~;sd@w�(�V��@x�,-�'W@zN�
�1�@{�|�n��@}4��v�j@~����kN@�[��P@���+pjb@��&��3"@�K��* @�R4HiE�@�(�@jj@�Ώʈ@��/��@��vʹ�,@��pl@���\��u@�{���v�@�k�s+�@�]��ObH@�S��z�@�L����@�I$ h0�@�H���z�@�%ě^�@���j�An@�-7���@��>��        ?���4F��@"s��a@��*���@,"��e@7�0OJ��@A٧���G@IL���n@QD	_��@V-a�-@[�'AZ��@a$->�@5@d�a�ښ@h���yO@l������@p��=^�@s]��Q@u�����!@x^�]�&@@{B��#�@~M`j�@���K�ݏ@�jL�I*j@�(I�_xw@���l�X@��.�L�@�ψ���I@��p��n�@���>K@�
i�%��@�&�2�@�K�`�~T@�x��Z�@���;jF�@���o��@�/�ցn�@�|��@@����x@�-4_qL�@����͉V@������@�m΀"�@�s�J��'@�3���K�@��H(M@��L���@�������@�Vi@^�4@�'mN��b@���/�4@��:#���@���<��O@���ZGn@�l��3W@�QC�Ɠ!@�8����@�#-B>y�@���� @�msYbb@������@���i�{�@�r�v�Gk@��MHl
@�p��dI�        ?�&qO�
?�|�(�{�?���13��?�8��,@�J^@[�@,����J@8�Z��x@ @�K
@%<�0Z@*b�X��@0/�Lf�@3{�6��p@7��L�-@:�U�d]�@?/�K��	@A׊ĘY'@D<�BS֐@F�ċ�'�@Iw�/T�m@LM_��,@OGf��"@Q2�����@R�8!:��@T�qR��@VLsRh*@X"�5j�@Z
|kp��@\$�@@^����-@`k3ە�@a(�xX@bFv2��@cl_���;@d������@e��e^��@g�*R�Z@hV��4if@i���5D�@j���G��@l[ӍbI@m���;��@o28���@pT��W �@qcr��@qב|0�@r�̐v�@sj�n��@t:!���g@u��|v@u�X�q]n@v�M�h�@w��v�9�@x�S���	@yk�A�P@zWs�6/�@{F�J�7@|:��&�@}1���4@~+��Cw@*7�c�9@��BI}@���Sh�@�S��}        ?�K�-_rG?��CU��?���5 ��@fUoR�q@��Ua�V@ 2�s�l@'���rr�@0~
�)�N@5��bŪ�@<V��{��@A�S�-��@Eో�!@Ji63{@Oe�S�p@Rk`Pd�@U]����@X�t��x�@[��WQi@_���Ϛ�@a����<�@c����@e���g�>@h$In�@jyd���@l�-'�LU@oz�H6�@q����@rp`�a�@s�'K@uQ�Gr�v@vӌ�6*@x`B��m�@y����T�@{�sj��@}Ex��;@~����<@�]�&R@�Bi�OK@�+�j��@�KꞦ@�����@��
�"�@��O�F�@��`�@��F?b@�
�?5�@��
$:�@�&s"�?8@�9Ѽu�(@�P�G�:�@�k-���@�������@�T����6@��	��g@�z��S��@���6�A@��a��@�>]�;@�׼�8@�rw�K(�@���q��@���I�q@�J�����        ?�l9h)?�4Zt�U?��Z��}@�/�F�b@ܿE�7~@!I{m�(@)^�����@1�Hʌ,t@7{��y�@>F�)��@C��{�@G]�Ee�@L2p�(;X@P��"H�@S��Ճ��@V��A+�@Z+_���z@]�q���@`��<2r�@b����R@e�1��@gG`�� +@i��:V|@l&_= +@n�A{Ia	@p��Q�@r!�n�@s����L<@u� Z�@v�ͺQ��@xC�9�X�@y�J����@{�z�+f@}c%�n��@1/���
@���I��@�x�-;��@�r/�Z�@�qXT�H�@�v^�ر�@��1�H��@����ȯ�@������@���x^�I@��O�ER@���b-�@�8g�@�i�Z�@��\ ��@��WȒ�@���ޭ� @�1Ҽ.=%@��k\�H:@�|G���@�)�O@��ဩ��@��!�'�@�7��;��@���\g@����#h�@�Z�5@��'ܑ�@��dJ=��        ?��ɜ�,�@R��2:@$7W���M@3�m@�j@@�w\$?@Ic��Ǉz@R *����@XGd=B'@_�L���@c�u�u�5@h{T����@m�A�l�@q�J�ń�@t�@�O�@w�ڨ�r@{Y0sͿ�@(����@��>���@���M�G�@�Ӻ�m�@�&�`�"@��D(�8"@�"g9��@�ʫ�{�@�GX֋v@���/��@�4@,E�B@���)x�@�V�}:g"@���Ͻ[@���l#<z@�l��c�F@�8�&��H@��}��@���T|��@��yX��@��d\��@�����@�T��@�Fe@ܓ@�4�av@�T{�.@�y��@��@��,q8r�@����t��@��],�@�Qq�¹@���V���@�rp��@����<�@��t�v<�@�x� �\�@�+�t�Y�@��=�>i@������i@�Xl0x|�@�
b�uK@�ڔ���c@����ǻ�@�h#�$��@�3	?A��@� ��I��@��ԃ� o        ?��m5�I?�[R\u{?衣 a�t?�	��=N9@���]�@/���V�@=��ؓ@r7h�V�@"Y̔�/�@&���w�@,)�9h�Y@0�7,&�@4T��@7Y��7�@:�fn���@>�P5���@Ame�S"@C��E.�@Eޤ6�W#@HE���@Jɔ�h2@Mk�?W�v@P���[@Q��~��@S ez� @T��e�K@V#K�D��@W�V�s��@Y|���ց@[=�X\��@]���"�@^�̕ʝ�@`gc�[rK@aa�d���@bbx,(|@cin�#�b@dv�1�@e��Tk�L@f�Q�q'Q@g���5��@h�,o�a�@j{��@kD��J�s@l{~���@m�
�DGc@n�-�>�[@p �iCF@p�w����@qp��v��@r�r@r�+����@s|O�"�k@t0@�@t�<
��@u���V��@vZ9�\�@w�'�~@w�-e7V@x��V:+1@y_�����@z'�����@z�n��)<@{���T��        ?��:��	�?ޟ�T�M?��=n�o@�z$l]e@��7�F@Oll�@&׹�@.���V{�@4�FmA]�@:��97(@@�MMd�L@D���@H�V
�:M@M�y��D@Qw1�F�@TO~��@W`���sc@Z�5�a�q@^0�?�g@`�3$���@b���R�@e��bFO@g:��@@i�3���r@k��?�@nr6��@p��f��@q�N5��@sH�=���@t�pT4@v;�Bx�0@w�ߑ���@y]�.$��@{ ����g@|�r���@~g~}T��@���R�@�� x��@�����V�@�۬�Нf@�ҩ����@�ή}��@�Ϣ߉J�@��r���>@��p~@��M�inR@�.�<4y@����@�8n"A�@�Y�"�M:@�Ķ��@���K���@�kGw� �@�-�� l@���3��@�;��5�n@�ڎb�ѱ@�{����@��F��E@����]=@�g�\�~�@�9!H��@�����0u        ?�qd\p�?��,;�^u?���R�-@.L%�<@X`���F@��#b@!��%6�@(ˊ>��@0�~�I��@5��w�E@;!�c��J@@�)B]�@DI����@H3Se�@L{���vx@P����E@S�/�S@U��a({@X�H�$@[���k��@^��9RI@a$vТC�@b�����@d� K��E@f��&O�@h��K�-�@j��bE@m��y�@oI�s2@p��:	 @r�m��@s> �@@t���?1@u�^��@w&J"�W@x�wf�*Y@y긙Xʀ@{X��*gq@|��t�S<@~L4�	��@�
0�?�@���&ä�@�x�	@�E&U�j@���WN/@��K3u��@��B�`@��d΂��@�w�R�k�@�W� �
 @�;���'@�!@��@�
81��i@����`�c@��i*��U@�Ձ�5l@��.R-��@��]W��G@���L�@�Y|7:-�@���\{@�W��3,�@�شQB�        ?�CE�@	
�`S@ LU�vt!@0��^�@:�f+C@Dl����@L���/&�@S�$X.C�@YP:.�@_�+��@@c��ɓ\@g�N	��@l�Q��<@pv����@s�|�@u�-��7`@xɏ�p?9@{�>3��@>���a�@�^؃��7@�4�x�8@� ��Z�@�"�O�>>@�:ab2��@�g@6;��@�� P���@����Z@�5X��_@�t�x!;@��W)��3@�����@�nq�xft@���;GӐ@�D��Öc@����"@�@_V��@@���U�kW@�`�;"j@���C@�R8�Ʒ@�)��J.@�h'��@��}�h�@�ɣ����@����D@��8�f�@���@hI�@���GO�@�{+��d@�wX��X�@�we)jZ@�{DE�u�@���wT@��M��_@��eZ�@�Xt��@��I����@�pK��W�@��M�X�@�����ns@�!�x�@���԰��@�K����,        ?����9<?��d.��?��+�C?����f�:@ X��D@9U��@4ӊ0h@�Y{L@ �_2�k�@$��*Ʌ�@)�*�}��@.�x��Ŏ@29Ej�י@5G��D@8����n�@<�8�<@?�V:Dh?@A�0L��@C�ç�@F�e�@Hgt���@J�|F���@MD�$�K�@O�t'�I@QBC�ɨ @R�8&���@T�@jT@U�	�N$@Wz7O��@X���\9_@Z9U;�@[�M�${@]����5@_G7�k��@`�_<W0�@alj�@bWxG��@cG��[q@d<eT�Op@e5�G�R^@f3�n~^@g5�r�@h<g�O�@iGS� J�@jV��>f�@ki�2s�D@l�����@m�F0��@n�!#�:@o��F�@p����o�@qz��t}@q�p����@rL_����@r�G��@s�'/�i�@t%��:�>@t����O�@uk�ʗc�@vUf �F@v�I�@wb���@x=
&        ?���ԅ_�?�W��U��?���>\�@�:�v�4@TE���@�H��v@$b��%@,������@3F�ʔi@8�ŴFr�@?T��	E�@C[6��&@Gz��
/@L
C��N@P� �6�@S=iEO�4@V.
}� @YV�I ��@\�^'��@`'�>	�F@b�!'�@d�].A@f/����@hf��7��@j� ��;�@m$��P�@o��ʩ��@q$	���L@r_Ox@s�Ō��>@uZ���W@v��w���@xcEF�m�@y���%u@{�w�ܭ�@}D�%q��@~��cQ@�]���ֆ@�CoJ�[@�-Q�L�@�yr�x�@�aϕgy@���@���1@����KZ@�a�>�f@�o�Tk}@�%�`l�@�7Â�b&@�M�c��@�g���@��;ji@��`��@�e�E��@����,2�@��;���R@�&�ũ��@��m��2�@�Y��HP@���,q@��%�x��@�1�m`R�@��"Vi�m        ?��,��Z�?��O�oo�?���+U�!@���wS@�XcL@�^��@#��Ϟ�:@+v�^Dׂ@2kO�@7� ��@>0P��&@B����ؖ@F���3�@K`E�@OЍ��@R����:@UVn�|w@X][2��@[�HS-��@_�Gw@aUvi�@c@��k�@eEO{�0�@gc:���@i��<��Y@k��ol"@nO��y��@pgK92I�@q�v|zY
@s	$z��f@tk!�@iG@u�9��8@wP5�B�@x�����f@z_�Z�@{�G�I�H@}���^@C�u�ص@�|%�pp@�["�|�@�>�4�&�@�&�I�Z�@�&f�+�@����)�@������@��ՎN@���Z��@����9@���۝Ն@��ͳt��@�
`����@��H|�@�.�O',@�E�#5@�0lS@����+P9@�P\q��@����Y~�@�v���J�@�>ת��@��9�P��@�;����g@��s�n&�        ?�K�
�.@�8�	}f@I���@+���L}�@7�-桧'@A��!�xb@I����@QEN��@Vs��6@\QiT�@aoyb�ފ@e��|�@i ����@mH�@L0@p�z"�Z@si� �2�@v	8@4+*@xИ�x��@{���Q��@~ӏ�ݦ@����%�@��$�)`@�whb���@�JT��@�.�J��/@�#�Wߵ�@�)d��g@�?NB�2@�2��i��@�M� �)@�oAd|M@���P6@��w^�m@�6b��O@�?��@�@��6w��@��-l3�@�#����V@�|ZίV�@��O�+c�@�@YaS6'@�U����@�Z�d�@��e���@���rPq�@�Hi(�@�@ tX@��dB��@��jPt�@�g��g�@�5k�iy�@�`���@���"���@��#�p�@����8@�d`7��y@�Bn%A�@�#�+E�@�p,1��@��f�=�@����bL@�`b5�{@��^,��        ?�}���1�?Љ��9��?�Tkΐ�?�){�Vk@�K���@
��� �!@�t��@;ZD��h@ Fy͎)@$cɪ�*�@(�+�@-��r��@1����ֆ@4�7��?@7�8�h,@;9ߨ��@>�9��I@AS�(U�@CXh]�1�@Ex�s�A@G�tJ�f�@JKG(c�@Lv9���@N��1囟@PЉov��@R.4*��@S�R���@U� ��}@V�^�MI�@X  [6Q�@Y�|f�@[`�TS�@]Z'n4@^�g�,�O@`K�Ӌ�@a5o��~�@b$vK�cR@cѫ��7@dp�=@eAf�=@f5!	6 @g9@��@h,:����@i?&b�7@jV熝Dq@ksh�D?�@l���L�{@m�L�\�`@n�1]�@p	��!F@p��9�Qv@q>��W@q�-Ѩ��@r{�z�@s�o��%@s�S`f1&@tg�.�@u���	�@u�(:	��@vc�>re @w˭\�C@w��\N4@xp�j�1�        ?�����?�T0�,�?�tq��@T��� @�\�>�@;���4@!���O�b@(�&�XK@0���@5�L��|�@;)5����@@��2�ԯ@DJ��s@H4d�5�@@L}�}B��@P�WZ�@SG�J�@U̼ �A�@X�i���r@[��k�`@_	���'J@a>�E��~@c��\��@d�۩�V�@f�%)�"�@i-�=�@k9���]�@m|P�m�@o��Dݘ@q!^�n@rb�ɯ�/@s��[��@u����@ve68��@w�Gr�@yC
�Ge�@z�U�[@|F��H"@}�����G@oփ�r@��ݞ<��@�^4�r:@�7��pZ@���%�@���B��t@���u�V@���t@��&uw�@�����R@���cyg1@���l��@���h�@����J@����3@��w�I�@���f'@�������@�c f��@���y@�w�p4�@���y �@���+*�<@� �J�i^        ?�7V�E�?֍�/�\p?��1@ }�{O�@C�,"@R\�Z�@!>��i��@($�]@03/�J �@5eq���@:���t�@@ok�y�@C�æߎ@Gմ���T@L�]��@P]�X��X@R�JyqC@U��O��@Xqe�^[@[�{~r-y@^�u	�@a��o5�@b䴑���@d�?�]ۂ@f�\8�4�@h������@j�i�81@m:�h�`�@o�&U
G
@p�n�@r:j�Ӄ@s��B5<1@t�ȹ�+S@v5� ��@w�)�cR�@ycb�;�@z�q��4@|+u�M�@}�j!� �@:(( @�m�K�JQ@�CS~k	�@�/�{��@��j2NV�@���q�J@�ĭ���@����ew@��� m�@���k¬x@��|��kP@��P��i@���]�Z�@��``��@��}QT@��?Y��@���'$@���g4�"@�cuS�\�@��f1���@�}�@@�k��]�@��y0��@�02�T�,        ?�{C��E{@�j�@��0k@)�⥫I@5���%Q@@z��K`�@GdWl슸@O�j�/�}@T%ث�@Y�CڤI�@_̣�-FD@c0��(�]@f�iǍ��@j�%��c@n��ޒ=C@q�4��@t����x@v�8	ޖ�@ySX��G@|'��5�q@ A��
@��6�4 @��;7�e�@�m�$���@�.���Ϡ@� ���k�@���=N@����6�@��+C��@��&�^��@�T� ��@��H�I@�=�S3x/@�ec�@@����d��@�ɚ��^�@�����@�J�ߗ��@�����@��C�uS@�?�Nrp@���Cq@�qhE��@������@�r�/^~@�.�}$�@��d8x�@��2f @�w!�yM@�?��@6T@���Z��@��+�w�@����gF�@�ގ�!@�V���@�0���C@�0�X�@��)����@�������@��Ayd�@��0U�5k@������@�7\͸�        ?�,VO��?�,xi&�?�QO�鉳?����t@ ����~�@	dE�v7@��C�@)����@#����@#��=��C@'�����T@,��,��4@1��O�@3�Wɏ@6�����B@:G|��^p@=�뒳��@@�C�.��@B��� 5A@D��$5K|@F�b3��@I�p��@KqG�I@Mޫ/Pk�@P1��%�@Q��FL@R� Gp�@T=ix���@U��7�QG@W&�& ع@X��`N�@Z9��}�@[�(R~@]tQ�g�@_�:94@`j^���#@aIMDb��@b,��	4@@cd�c�s@d j.���@d���|@e�q��@f݃�l�@g���{h@h�[�o].@iޔ�`�@j探���@k�0�L/@maNu:@nO��@o*	��%�@p!�A���@p��Bis�@q?��WX@q���@ @rc�#7��@r� �:[ @s�����o@t%T��@t����q
@uW���*�@u����m�@v�{ZX~        ?���"?�:�"a�h?�J���D@ ���$@�7@F��@�D�J/B@ ���ˮ�@'���-�P@/���X(�@4�����@9��g��@@&wP�@Cy0���@GD9�w@Kl�L��@O�g�3�@Rk�����@U�Ǌq@W�KAE��@Z�N�'�p@]�qLl)�@`����)�@bkj�v�*@dA�I?N@f-�i�NY@h.�Aa�@jDR�Ǳ1@ln?d�(@n�$��@p~�v���@q�4L�@r��/��@t2�
�@u�H��@v�]`�1�@x7.� q@y���zG@{]�t�t@|�l@���@~
��_�@�����@��`�RV=@�^���Z@�.�=� �@��}fx @��R�9�@��v��o�@�� �]c�@�v=^ۗ�@�[�M^��@�D�"R�@�0{Yc��@���R��@����O�@��mн�@����%� @��j^̵@����o�d@���Ȥ��@�|���G@�� �1�S@��� �+�@�R^OL�        ?��~�R�N?����;E?]Ɏ�@ $GM�S�@�c͂V�@��n���@!
.�L\@'ޟ���@0�*6@4�j�t�@:owy)jJ@@^�B'3�@C�V�0�@G�-a�@L U�½@Pi9�bbK@R�vTX0@U����F�@X��%�u@[ûk��=@_�b�/@aN�q8F�@c*H����@eYn]G@g*���r�@iN�ؕN/@k�	�I�@m�~�1�I@p$��K�`@qe5Q6R�@r����@t�=!�@ui��H@v֔�J�@xM�^'�@y�M�t3@{[��ӏ@|��r��@~����B~@��*�E@���l���@��ȗ
Wr@���9�@��}v��@���c>E@�{4�JP8@�o��l��@�h��-ƛ@�e����@�f�֌|�@�k���#�@�t��m�@���-}\@��S�v�A@���|��@���hE�@�m!��_@���%��@���^Ol�@� Ɂcc_@��ScHX�@�Kv��L�@��*:y�F        ?ܒ7�a,@-8	�@q��5
@&>7�x�@2�^�)�@<��I��x@DX=���@Kw�����@Q֣sU�@V{Z= }3@[�ia�*@`�Q��d@cʃv$�n@g(��S��@j�Zf�@n����;@qa��8_q@s��`X�@uڟOj�@xD�$�@zʜ�h��@}mԺ��@���h �@����_��@�����&�@��N��@�(td�@��
H@�l�}.�@�&k���z@��wΪS@��4���@�M����u@�A`���@�:�+S�@�8ӵ8�c@�<+Sޙ@�Dr�%@�Q����@�cp��>�@�y��o,�@��#�V@���z�@�،��-@� ��Š�@�-�/^@�]�_�C@�H��@��!��@��/&�E/@�#b(u@���n�x�@�hI�ˉc@��:��@��fu�U�@�\�{�-�@�)�.@�����@�`a����@�^���H@���7I^�@�r��@�%�5�z|