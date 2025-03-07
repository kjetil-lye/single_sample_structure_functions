CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113741        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�l��?�%�Fү?��
�	��?�梵F?��	F�P�?���|G�|@5����@y���j@��@>�@��-���@n
��K�@k�>�M�@!o�˚��@$eg�1�@'�V�m��@+@l��@.�����@1H|�޵P@3Y�su�1@5�B1vT�@7����@:E��7q�@<��h�<@?w-��@A&��T@B�t��ܷ@D#1*^Bb@E�t���)@Gbz4�@I�S�.@J����=@L��p��@N� �Xѱ@PWK���J@Q`}��@Rrn�I�@S�B�i�@T���"�8@U�لv�@Wp�	�@XX�D��@Y��/��@Z������@\X[�Gk�@]�&P�	}@_6�G�!@`Z�x��E@a�K6��@a�'�p@b��G@c����@dl�薻�@eN=w�f�@f5��-ו@g"��r*�@h����@i�j@j���_@k�n��@@l\$�""@m&d� �O@n9��*`z@oQ�o�x�        ?=�����?n_\Tޡ`?�B�^�w?���o�>u?��q� OO?�\�`6!?�� �D?�q��fT?�
,v�?��p{�?�/ *��?��dM�@%� _�]@�;�l�@����8y@ԜT�XG@"&A�WL@@'A��(^@-P|HҠ @24QYB�t@6M鷻��@:�$�L�@@$����@C�b�2@Ff����N@J%X��@N �-T�y@Q)`�w��@S�wP�@V�Y��@X��,��@[�V<K�@^�~�B�T@`�G�!�@b�ɒ���@d���Xm@foA4�@hw �v(@j���o@l�~�P|�@o9��|C1@p�S�ㆾ@r)��5N3@s��d���@t��K���@vza���%@x��WS�@y�ݳ���@{qᡯ�@}@���u@&j!�y�@��("�V�@���W�1�@�����l@���t�@��~���@�@A-�@��_�@�涉���@�P�	�J@��fz���@�V���u�@�󜪀�         ?0�E���M?`OVkJ��?�!м^��?�ޭ��0�?��ҍݴ�?�$d��V?��Ǚ4�?�[��O�A?�� @��?�کW�b?�B�%΋@��CB�@��"�W@:(��@�Y��@"���@"@(�alMh{@/���Di�@4'uZ�۩@93�h���@?S��@B�g@F���qʹ@K/�K�S@Pk�Ƣy@R��4)@U�z�$�@Y6}#�iv@\����@`wN��&@b��?�@e	ީ��@g�g��p�@jb}�u_y@m^A���j@pH�C�p�@q�߂�A�@s�	���t@uɣo �@w�܅|�)@z�%��@|o�����@~�>�@�������@�.'O��@��1L��@�4�4��@�ד���@�� =���@�_���f@�E .�@�B��,S�@�,��@�CQ��o�@�g-����@����$��@���3D3I@�!R���i@�zk�@��r�X�@�V�W�ӟ@��E��RR@�l�<��~        @\�y�@7;���٫@P�z����@`ν^��@lv�����@u��q ��@~~rt?�=@�q/�"nK@�ak�0{@��V�~ .@�<����@�N�8.ˋ@��&�e�N@��s�gn@�]����@�$�ިl@�G�n�@�B�҇��@��N�0�@����C��@�p��i�0@�h	�C�F@�x����@���_�ͬ@��3�m@�GךC��@�`����@���F` H@�*�Pג@�k
w(v�@����Hʷ@�eK~�|@����yѢ@ʝ��~@�Rf;�H@��f+�@���J
h@��|{x4@�觖��@�����@���}T�@��&��*@�:d1�s3@�f�0��@؝_,�@���Z$�@�(�V���@�~Y7;@�ݺ��@�H �ے@�^|�@�^����@��\��w@⮉�O�@�~�C&��@�T�{#�@�0��Q{@��6u	@��
�2�j@�⃅�Λ@��4痊�@��C���@�����\�        ?XZ�ix�e?�c�A]��?�����?��T>�2(?�$t���t?Շ>.	�P?�>��W�?�T �XS�?�޶KC?��|�f ?��Wu�x?�Uk<X�?�a�5��\@u�t��>@z�W�@�b�u��@Q9�Ǣn@��Ko�@#�l3��@[WV��5@�|�ph�@F4�n�h@�u��R@�L9N��@ ���8Ʈ@"���Z1�@$`�ڽ��@&;���@(3L2e�@*H�-ʜ@,}�hQ1@.�M�&D�@0�Pk�'�@1��}�,�@3L��=@4�#��@6<�w���@7Зҹ��@9w���+�@;2��)h@<�ф길@>�ܽ�	@@j�ۖ@AnK��8@B{�O�q@C�>�?�@D�s�#<�@E�1E�@G����@HL���I@I�g�@��@J�{O��@L>�q��&@M��_پ�@O��![@PE��>@@Qa(��@Q��䚺�@R���*he@Si��H}@T?',�WY@U��$@U�u͠�        ?#�#_..�?a}��:$?���t]PW?�&�j�b�?�NJk/�?�f�x?�<Z�H�4?�f-��?�$��i ?��t�6�?��@GԼ
�&@����s@b�I�Yy@0�4�@#|:�h{@)i:��@0a�)�!@4�	��	�@9�:l�#�@?��w���@C9�^��@G �iƋ@Ki_��wg@P"���T@R��W�(@U�Yg&3�@YQ8q�#@\�!PWq@`R����@bt16�VW@dº�Q�@g?�ڡ�D@i�8,/�Y@l̨3eR@o�몽��@q�gW���@sT��v��@u1Q(B�@w+�����@yD#?���@{{�c˚�@}Ӧ�oњ@�&�V�@�s,���@��oF�C�@�AF�
@����F�@�W=����@��#`�B�@��({�[@����d��@�gLn@�.i��,q@�3��_�B@�C_t�?8@�]�l`@��d���@������@��9��@�8 �"+�@����J�@��c�:A�        ?BKU���|?tsUQ�*?�w�nh?��ȜQ�?��H��<?�`0��?ҸV��j:?�m��ۼ?�l��¢?�܄�m�O?���$�@ �z�@U��a7@����<@s����@#����A@)po?�#	@0H7�@4��3�e�@9�;�<�3@?Qy�.,@C	��a�@F�Q���@K(w�UG@P�t(��@R����n:@U�6$�Y[@Y(�~�}i@\��ׅ�@`z��3�@b���ڟ@e&�Q��@g��-@j���*8@m��'��@p��M��@r]�[vs@tL����@v^ۧKv�@x����@z���`i@}s���t�@��4I�@�y�h�@��.��@��"h���@�8q\��:@����t2@��Iꨶ�@��ڗ��@���J�@��E�y@�i����@�BY�<F@�zW�T��@���4&7�@�6�@�rj��=@��S����@�\�Y��@��ͬ)�@�}�F� @�#�9��        ?��LC�@�_q�@0����~k@B�z�iR@Q6K\��@[/:���@c������@j�K�$3@qf�?{��@u��*ZV@{��~�)@�U��+/@�o���@��#�Z$�@��a��WQ@��k wv@��:���@���8W�@�yr�T{�@�A�X�һ@�@�g��v@�z��Ȼ[@�x�FLq@�Tڄ��@�R��3k@�t/��[@���
�"Y@�'u�TX�@��2��G�@���&��@�1xM�2V@�����@�]Z�
�@������@��^�%@�����@��<���@��ΠS�@��u{�@��Z[��'@��]�d�@�6�bW^�@ň6�?R@��*����@�S�w��W@����*@�U�<Nd�@������@΍6O��@�`;5R}@����2�@��]�mW�@��s�gz@ӽ��;u�@Եw�̝�@ճ;X!�@ַ=�q@�������@��3Wܳ�@��K��5<@���\=@��;Ό�@�D�W�]g        ?c{`d?�3�*L�	?�KJ�M?�@E �I�?�xO�˅�?��xi���?�na%���?�B���?��8(�$?�
�A�<h?�|$J�A@zG0K	@P�VR4�@
��KP�@M�;���@>��=p@t���@&f�6��@{�*q� @�a�@!x��bw@#����m�@%�M��3@(�:D�@*���1p�@-1�����@/�L� ��@1p$0��E@2�#'���@4���G+D@6BT�@8�U��@9ߺߓ��@;�P�>�(@=����@?�^�QJ@A����@B5�7lf�@Cf���V�@D�vy�N�@E�sJZg�@GE2�o@H���-�@J���h>@K�S��z�@M$SS6�@N�(#�@P2˷ۉJ@Q}���"@Q��#�@Rצ�V@S�/r��@T�pg�y@U��o¸�@V���~�<@W��a:x|@X۶,#^�@Y��5Tl@[����@\;��5+@]j ����@^�h��R@_ۮ���        ?7�'�-]Z?p<*d�#?���_DH�?�����?����GM?��		��?џ�֫=?�:�4UV?��~���?�\�iV�?���Z+�@'ߓoښ@�2J�@�p�>�K@@��<@�@u	�+υ@#,Yz��@(�*V��@/�)��@3Y�o�@7�W���{@= ��9j�@Aw��0@D���7�@H��=љa@L���@P�H�x,@Sl�!^(@VM���;0@YwE �@\��膯�@`W���%@bb�����@d� ���@f��b�a@i��{=Ů@lTߡn(@oK{:� @q;���X@r������@t��Ɯ6@v������@x�T��q@zؚa�}V@} ����^@�P�epo@�	�^��@�_�>�V@���(�@�A��bV�@��5�{�^@�m�W'`�@� .'G�@�揄ſ�@��G"��@��$)��@���(�x@����}#�@��V�9��@�!ZB&�@�N�,�k�@��vN<Ƕ@�ͨ(M2        ?S"�O#��?�	�}�J?����8�Z?��S��?�޷�S ?���d�H?��t68��?��)Uc�?��Xr8�?@+���@2�<>#@�b�'0@4�uHqK@ þ��%�@%�P�^@,Q�f@��@2dP��@6��s�@<S�ʱ@A7��/�@D����@I����4@M���B@Q�7�^X@T����2@W����a@[��[�@_��*��@a��e"�@d`���P@f���^P@i��n���@l�j�ҥ�@o�<7�+�@q��fo@s|�-z�d@ul*��6�@wyr�V�@y�c�+N@{�=`]@~[�".�y@�s����w@�ɴ�߳�@�0|����@��ݏ7@�0��4�f@�ʐ(34`@�u�GwZo@�2���!@�C���@��Q*�z@�jj���@�l���ß@�x���9Z@����O@�����t�@��w�%w@��ݐ�@�D���ϐ@��EL�5 @��R����@�7��L$<@����        ?�3b���@��}L:@;�#��Y@P#�����@]��*�y@h:�T8��@q씟��@x�L��#@�������@�^���z@��o�%��@��V�@���h�QZ@�� �Σ@����n@�_k%)�@���O��@�����4�@���c�W@�߃[-R�@�PM���W@�~���"@�sd^v|I@���H�L@��}yPP@�[?W��@�|�U�@�i�Zٟ@��-�?O�@�I��W�a@�â���{@�N�2]6[@���v��t@Ș�-�@�X��6d�@�+(��@�\��@�"o&@�	����C@���X��@�3jO��\@�WC�+�o@ՅN.�S�@ֽ�I>�F@� 4hj�@�L�6Ӝ@ڣ؛V�@��-�@�p;>0@��&>�@�2a����@����+E@���㋅�@�0��@�b�S���@�;Al˱R@�+���@��Pܯi@��X>-�@@��L�$"@��b��	@�;��K�@꼶|E��        ?[ůj��?��+��[�?�ll܄�/?��	tE�?ΐ�B]?؛�Ln�?�?�"7?��ݔ��?�+3��?�K�k�6�?��r��F�@ A��僄@���X,t@.��E��@+����@�,�`��@ -*�<T@�ݰ.�@s'~+
!@ke0�BO@����;@ ��;L�@"N�x$�@$:+L�#@&Cn�'6@(j:d�o�@*�h/	��@-�V�7@/���\@1#si�4@2�e�o�@4	�g4@5��e�@7&H��@8ӟ���?@:�HHW�@<e!xT@>I8d�X;@@�8�z�@A$���}@B2�m�1@CJ1�1i@Dk���l@E��Oz�8@F��s�@H���c�@IUV��d@J����V@Lp�<�@Mq�v�H@N�,�1�I@P2�6��B@P�w�J�@Q��o��@R�d���<@Sfa��w@T@��ԡF@U #�i�{@V˫��/@V�S�&�@W�zo�ߢ@Xт/�QT@Yʶo���        ?Koʛ�?�e5�M�?���a�j?�{�m�O�?��c�w?ХԬ�RT?�!-�zIu?�*�C��?��Wc�+?���?@-,�\@3�
�@ї���@�K���h@�;�~q@$RtO�q�@*k.V�^@0�@v#��@5j��s)�@:õwg�@@�V�c��@D9����@H~�'x�@Mh%j�D.@Q��Vz�@T�Z����@XF��<$@\L��S�@`e8Ofw�@b�'��9@e���%�@h���Ջ@ls��P@o�Hg��K@q�{Yg�J@s�4��ƅ@vU|��@xހd?��@{�l�Yt.@~�j~��@��͵H�@���o~@�X���m�@�F&E�]@�R�I���@��$!�r@���nLV@�@�^5@��*��@�F$KV�@��q���@�5Z�c�@��+���@�p-gv$@�*��F\U@���(K��@����d@��5Q�@��ѩ1�@��a��@�R�-�@�;��Q@�j�M�`|        ?�^5N?J��~C�?l�­�C?�"u�T��?��{v��?�x��sѭ?��r��?��,O4�?ժ{5�9�?����v�?�DFy�)�?�z3�9I?���mZg�@w-5Om�@(�S�ߞ@��e�@��C�Z@"3��Ki@'H��� �@-V@j��@2:����@6`
z�U@;(Gݴ�@@P/�M��@Cj�,�Zu@F� ���@Jԫ�޴�@O1HF	�@R��u�@T��F�D@W��{WQ�@Z��~ģ@^B����@a�6fO@c�ۜ��@e@�Bw<�@g�z�;�@j(���^@l�h�/�@o�6�r�@qn��P�@s�(�i@t�����Y@v�"��>@x�&���@z����@|�h?�� @5����<@���cP@��<��t@�r;�`d@�� '9@�W�⊦@����� @��W�:�@�:�A/@��'@��7`�6�@�h]�k��@�k�~��i@�zY20|j@���C��@��J�z	        ?ذ���� @�m�� [@+>�ߎ-
@?��q�Z@M�-�]?@Wؓ�$��@a�	����@hF�����@p��<V@t�|c��@y� ���@1f='�@��^�ʹ�@�'--,�@������@�L�ᒂ@�@���@��;(�7@�K���+�@����@�';>�@�gcyv�@�p�ϭv�@�K;��GU@�D�@��@�]��œ@��W;��@������@�p���V�@��N�+��@��T�^�@�a����@��(��S�@��h	m�@�3�yZ�+@��CG(R�@��&�@�� Fx�X@���E���@��\�p��@���V��@�*Jz��@�0�Y=S@�`p�{F@ƚ��ߚ&@��n�R,�@�.�u��@ʉxU}�@����-@�_�J��j@�ۄ��Rv@�1K� ��@��n��F@��(�N ?@ҝtT��y@�wF��m@�V��6�!@�;G���O@�%V ��@���S@�	Ks��@� k�x@�&����        ?n:�eQ�?�,(/�{?���ڟ?�2�_�h?���YhC�?������?�f��?�M�U<G�?�	�:@R��O��@��=���@ �� ϖ@}��sB@��s@�V4}�@�ґ��@(�i֪@�����@!�t�@#��§�X@%�'6�0�@'��(�V@*�'%��@,�J9�ؼ@/Gd	,o@0�ƨ��W@2-���e�@3�}�ل�@5����I@6��ۼ@�@8.aGtR@9�[byܹ@;���$�g@=Fd����@?���Ώ@@{;�g�E@Ar�ggY�@Bq��]p9@CyC�XZ@D�~��@E�!L�%@F�6e"$@G�e#��@I���@@JLCq-0O@K���@L�[��@N%67o�@O~��F"�@Pp�K!�@Q&�URTN@Q��B��r@R�ݏ��L@Scw�z@T+�Vx�Q@T��k49H@U�}�JW�@V�C�l��@W}7We��@X^���~!@YEF�,�@Z1��0=3@[#X�        ?\
���4?��2�1n?�oCX��?�k;�땭?�L�/9s?���`.*?�>�krn�?�km�"?��Q��@�����f@�V��>@\'<�z8@�H�T�@ ,-ԏ:/@%�$'>@*��x�X>@1��>B�@5a/��M@:|w�\�m@@=�B
�@C�>g��@G %��=@L`(��h@P���t@S�B���@W�+�a@Z��V��@^�>e��@a�"1�@dFd��+%@g�SP�W@j	�E��k@mP���!�@po��}vG@r\��3�@tq�*; �@v�uS�p@y@��@{�X�[ �@~zj�UF@��J܋ �@�Q|q�{}@���Q��@��^���@��W,��@�����;@���[�/L@�:��!@�R��)@���|�@��3fh��@�X5�Xm@��^��=;@�aj[�n@��F!`A@���t�ŉ@�}'�	8�@�X�7�3�@�$lc�N�@�&���ҁ@�3�����@�K�M��C@�nȨ�,        ?8%�1F�3?s`,E�7?�?�T�?��xŀُ?�j|�:/?�q�I��?����ܑ?�Z�̝?���a�?���� @ >�8�I@Q8�<�@Wϟ>��@j���n@#}�ĭ\@#�,�e@)�Q1��@0~ȓerD@4���k@9֜��6@?��f�@CH7F>��@G0/�G6�@K�ᳺ-�@PP⍝�@S���@V:����@Y��fo$(@]y�z�x�@`��=�N@c<�P��@e�+I��@h;�^0�@k�;�(�@n5��7��@pãr�t�@r�P{���@tlz9N��@vm�$�jF@x�8�ER�@z˜���@})���<@��ּ�9@�!h�>R@�~�n.�'@���M2[@�i�&�e�@���.�i*@��#�K
�@�>�O1�u@��{.?��@����Xn@������@���!˘�@���ui�s@��X��{�@�¼�>߾@�И���@����ir@��3XZ@��qp`W@�F$Z�X�@�rq�0_�        ?��`i��,@*�� x�@G�H˥@[S9\K@h^��S-�@s%�s@{�˔�x@��X�{��@�,��utI@�Z*I(�@���4���@�K���U@�R4eRDz@����y�@��U7�q@�!�'��@��/)8��@��C�a@���[]i@���i@�@��c��@�D��-�9@���Vt@�	S���@��*#@�)���̉@�[�+�b�@��D�	�A@�Sf�I�@�;9@ޙ@���Bp�@��/����@�&Ҡ[x@ǉP���@��{��L7@�k(
p�@��$�ȷ�@�r>*W2�@�@�?�@�Nz�7>�@�� �}�@�����@��PG���@ӫ�{z��@ԍxn~�@�s8����@�]%��0O@�KQ���@�=Ѷ�M�@�4�3��@�0@#R�@�0n%�PV@�5r�5@�?xȊ3%@�N��B�m@�cA�g�@�>���D@�ζ��"@�a�d�=@���Ǻ@⑱FCA�@�.� >�=@��_*�2        ?a-52�C�?���c��b?��B��b�?�U��̲�?�c���?����+?��
�,/?�҂ [��?�Kf�$�l?��I��-?���2�?�9eQ\�@���J��@�����
@	E�8�t�@
H�-x�@��.2�@�
��S�@�ne��@\'C!1@�~�9I@��[^��@_bX��@!(�}<G�@"�}�Ҵ@$S=U�AF@&� �&�@'�Y�c�5@)��K6��@+��o�@-��?��@/�R�ޡ@0� ���b@2"�]�V@3W/�Ap*@4��:I�5@5�ج�?@7DDS�5f@8�ĽH�V@:'j�nA�@;�jC)y�@=C����6@>�Y|2�@@M�dY4@A/|�okM@B@�9@C
�4@Rr@DP�K�@E�rF@F�_�@G)n@�@HHI�)7w@Ip�&&ul@J�o`U��@K�
2�i@M&�p7mB@Nw�H���@O�sNA��@P��B�@QU'����@R��Մ@R�\�c|@S�`߁Ȃ        ?!�6" 	z?\}�z?}��F��?����r�p?�8�t΂�?��˙�>?�:<�?�w�Ȇ��?ޭ����-?�y��Os`?��0�Q7R?��N)�@RB��5c@�����@��Y$t@���z%@!��F��3@&�ӡ�L@-aDA>EJ@2����h@7!�7�.�@<�v��I@A_ɵg	@D���w�@I3gwX@M�D� @Q��(�J�@TxghqM@W�/�A�@[lc��#\@_v1I��S@a�Z`H�2@dayV5�@g��_�@i���}@m<��#�@p2\}}�Z@r�x{�@s�E���@v�����@x@Sx�@z����u@}!V�y:�@�_�o]@�O䉈<�@��Y�&eY@�b!2ub�@��N��h@��
�$O@��b~=�A@���>p�
@��!�V{T@����G8�@��Īf��@�%h`EN@�]�ZW��@��;�)1n@��C�/�@�]L�J�@����78�@�TK;� �@��B�Љ�@��>ٙ�8        ?L�p/`=??�,1��6?���e�q?���T��?��@�T�`?ьs$��]?ܐ�fp�?������(?�0����?�'��4�@ &�ao$@@�)@��?(@��)#��@z��b�@ _5���,@$��ܱ�@*$p���@04;d�X�@3|"�@8Kоv�@=]��ڡ�@A�ze�@@D�o��`@HƬ�f�E@M[/A�J@P����Z@S�Fs���@V��G��@Z!o�.��@]��?���@`���q@c<nT���@e���_�i@h^��D@kE�y+�B@niiL~�@p�ˁt�$@r�o&,Q@t���sz@v����@x���Cu2@{[N�X��@}� ���@�H��/�@���/5<d@�4�H���@�˻_�C�@�yJ��@�>-C��=@�z��@����@� 
�-;@�$�i([�@�G�U7@�wbA�տ@���>��@�^�bk@�_�o>q@��!�Êj@�Hc���\@��)<�0�@�r��\�        ?�S�Gй�@pߺLt@1I�m3@DsD�.~@R�_���@]���1@e�M~s"@nd{�l�@t'�#;6�@y�<����@�(���n@@��u,pa}@���C���@�>��S�@��j�@�2��yF@�2n�}�@�)v
H=i@�|��h��@�Ztj�@��u�(@��S��@�?���V@�`Ub�@��4��V@�T�6Hf�@���2�@�l���@����uG@�yv�S��@�C�8��@�� |-�@����`�@��'A�hp@����T@���^���@��k�sN+@����'@�>ʯ���@�~��79@�̝O�B�@�)k�!�~@ȕd���@��i�WL@˜��|bW@�8{e%�@��@R;�7@�Q�3�3@�9[B��9@�*���@�#�n�c@�'�9@�3����+@�I��n{@�iΫ��@ؓ�����@��V���@�0��z@�MF,\h�@ݟ�Y��<@��Ɛ��@�2K\��@�빶Cy�        ?Y�c��	X?�q4����?�P>�J�0?���>'{�?˿��[�?��bd�S�?߽�!��?専0�G?�fC���r?����Q+?�=J>}�?��j� �@ �g�l�@�=�T�z@҇	�f>@	����@���\Z@ ���lk@����@5��(!�@px$��J@��|�P@H����@�����^@ T��tw@!��븐@#J��d�S@$�T1s�@&�`�kQ9@(F���6=@*~(B�@+���UB@-�W�.@�@0 ���f�@1w*��/@2/avi�!@3W��C�~@4���a��@5�p.I��@7���Հ@8p-��}@9ըl�v�@;HC��6�@<�E;�C@>U�>Љ@?�[G�@@ͩ���@A�ƋxJ@B�<3 �@Cx(�$��@Dj���@Ed�d���@Ff���#~@Gp�Y�@H�县�@I���~�l@J���Hb=@K�tW4�$@M!B�פ5@N_2�̓@O�i�Һ@P{��;rd@Q(����$        ?>��2'��?v��m���?�Pwp�?�)m���?�Y��G
?̘�J?D�?��6�'?�51�?�u�ߺy?��&A��?��bQ9�@K�%+)�@�3�6V�@�5wγ�@�`sO�j@!���0۝@&�%<C;�@,��4� @2,��uJ@6(�R
 @:��^��p@@+��Y�@C=��F�@F�#hY<�@J��Jd��@N�k� ��@Q�_J���@TG����B@W����@Z�����@]S�K+,@`i(�ü7@bG����@dFڮ�=@ffU�i�@h���%/�@k�СT@m�m,�h�@p$�_�P@q}X>�W@r�*��y@tz_���	@v���|&@w��~��@y}nhT�@{M��˄@}1bmI�@(e�a�a@���-���@���lWĪ@��b�G\�@��L[c5�@��{,�@�N5���_@���1�H@���HD�@�>.k<t@�����@����@��-ɫ�@��l7M#@��&�m�@��d�"��        ?5V�!>��?ecN�@�?�'��>?��?'�?������_?�q�ƀ�C?҆��|?����ѧ??��ea!1?�tn�-�@]3w-��@	�Βs��@�����@L��v@"�H�-�@(%dZ�<u@/��)WC@4x�+ʗ#@:a�n@@G����T@D<�@H�z���@M�f��Y�@Q¹�XE�@Uވ�f@X��+��@\ޭDqr�@`��a6r@c;�Eg�@e�U��:~@h�ut<�Z@lD �R��@oͅTہ@q����@sۂ���@v�z���@xf��1֞@z�!�>@}���@@�3V���@���a�D@�Kn�j�J@����t�@��<����@��	���@����w�z@����m@��~"r@����1�{@��q]I_@���~�@�a��I�0@��|��@�47"�a@��o0��l@�GH�Y�@��
�]K@��/b�M@�bI���R@���) ��@��#PnS@���ͼ�@���ge�*        ?�E�)Z�@xTf�!�@-�0/W@ATV	�Q@OVB>��@Ys�0�@bhI]�yc@ii��F�@p����=@urCH8I�@z����V�@�D��h@�{�Gc��@� iV��@��(�f@�����f@��8�e�@��<���@��5��+@�l����H@�X�}�M@�s��|v�@�_�t��@�Jė��@���7�,@��$>i5%@���$�T�@� rĹ��@�f�"��!@���U~�@�&��Ԩ@�w�vH��@��+.�@�K Nn�D@����@�b̉1��@�	��f��@�ÄI�0B@���{m��@�q�u	@���῱�@��~�� t@�����"�@��J��@�	��c�@�@6���x@���*�
@��m�q��@�$6�@ˉ�\J��@���hX��@�}���JL@�)Syp@���ꍾ7@Ѫ�(�F@҈b�Y�g@�m�a��}@�[Y ��@�Q��@�O`��H�@�VWR�ͺ@�f:\�|@�?^�F        ?cMfu�
v?�u�(6?��	ɖ�?�o)���?܈b��=m?��!9��?�:� �J?������@փ�7@����V@DO���t@5ǵu@{\\O�Q@�5���@!a��:�@$E;جo]@'�R�Y}@+�G`Ie�@/��A��@2/j�A��@4��0�K�@7Kjy�r�@:!6�8<@='wa��6@@/(��[`@A����p@C�E@^:�@E�l��@G�� VӦ@I���kU@K�/.�A9@M�Խ�T@P!�(�@QQ�7q]�@R����P�@Sϒ�5^@U�|k��@Vv�lU�@W�2�#�@YK��G@Z�D��@\T�T��@]�뢛��@_�*O�q@`�܉��@a��$/	n@b�vw1��@cy����@d}B^��W@e�}R�}@f��i��@g��897�@h��P�@j"�(f�u@kb
x4�@l�2��*@m�F���@o[�yq^@pa��m{u@q�n�"�@q��+HU@r��=A��@se��ಯ        ?bgW���?�U���j?��g�3�?��^�:M?ۃs̝�n?�μ��?��6���?����nb�@#9�ݷ�@U�i���@��{���@����x�@!�Q�~�@'_��1@.i�Tϴ�@3��X���@8А�%�@?(p"4�@CY�:�/�@G�1��{@L�8@Q| ǀ�@T��v��@XӒD���@]<@��;T@at��|�@c��L .@f��Y3�@j6�d�|@mܚ�,l�@p����@s�;s�"@u[OzD]@wҌ\�D_@zsx�V�9@}=�G�v@�ݛ!2�@��'Erf�@�I�f|@���,�]@��-U:�@���	d�@���J(;@���ި��@���(��L@�fY�is�@���GD�@���?Pu@���g�P�@�Qs�~@�=Y$eI�@���-ډ@��"|�T�@��,��@�{|��O@�ߘF=u~@�L)�3C�@��[PV4@���5{��@�c)�[�@�+8k	�@����:V@��R���i        ?^s|E�r�?���D�?�ّ���8?�#O�(��?�a�Nբ?�>8?�a��R?�Z)_q�Z@��x�@�߶�r@��9�p�@"���-�@+$����(@2���f@9��ւ�@A<$�'�@F���+1@L�E��~@RK��^�@V��{9�@[ޞf 7@`�#���G@dx� I@g��v�@k�"+���@p���6�@rw�3Ab@u���}�@w���/[@z�El�@}�c���'@��;nZN�@�?���V�@�
-�ߓa@��^�� �@�֠ ��\@��>T��	@�觞��h@�
o�4"�@�(�"�K@�?/���@�h�*:�@���&:�@���p7@�w\Xy�@�]E9�@���h�v�@�
��^2@�n��^U�@���4���@�R{�ٞ@�ң�}��@��g'�Z@�x�^v'�@�Hh.I2D@��2 �@���}��@��U���J@���'���@��8~�j@���:�h,@��[���@����(�         ?�T��*@10f����@P��-S��@d�A �~@s�;L���@��ZJP6�@�`��d�@���Щ�@�4��u�@����]ެ@� ���@��RJ@���u@������@�E}@6T@��;�P�V@�)jϽvM@�c��[a�@��=�2@Ɠ����@�vǇi)@̊���x@���`_^�@ѦV�;�@�}��:v@�o���K@�z��6�@ٟ�~2�C@���>pf@�7@�ɥ�@�T[c��A@ᙌQA�,@��9M2@�I���F�@���-qB@�-�I>@�?��a@�Ka��,�@���M��J@����X�@�l�zё@�EA(W�@�L+@��f��|@��fK(@��-�g~�@�М���@��k�H�@�/�l�@�q+/,�5@��l��(@��^�<w@�}�_I�@�����}A 6��NA ��+(M�A����G{A��p�EAns��=ALZ��A/�PB(�Af�߁6Abru&�        ?x4��N~?���u�!?��#�H�?�S,�{��?�^A�@Sl?�A$�^�?�SY#p��?���.�?��Xֳ�@ �V�F@p%��W�@o)�T>�@�m��H@�ۇ+%@2K F>�@�\��@�*��^�@��XB��@���aJ�@ �9��HR@"��6Oe"@$x�oՑ�@&Pq����@(:�d�l@*5}�ե�@,B���F@.a��3�@0IWv�x�@1j���@2�$�e@3Ȍ�#��@5���@6J��l@7���y��@8��L���@:S�FoL�@;���Qe@=4'yw�@>��z�@�@@��@@��Ul@A�պ�w�@B�p��@Cjy� w�@DJ�)��@E0��>~�@F�tخ#@G��'Q@HҠ���@H��)6�@I���6�+@K�~W�@LH؛��@M g(���@N7 �t�^@OS@�Z@P:?���@Pͦ��~@Qc�'��@Q�q�i�@R��;��g@S6cTR@S�*�̤�        ?����4?Q�[�H7-?u���?�����?���J�(?���&��c?�R�B_�?�N�g\/�?�=�5�?폠od#�?��o���N@ �C>܂@X=/Gh@�9*}��@�в@�+�e�@#��lo1@)lY��P@0�pf�@3�QQ;�@8r��"/@=��� �@A�$����@E>.T�lI@I�zC8#@M^���7@Q�F4ru@S��:S\�@V��gm@Y�<��Q�@];ϩ�k>@`}�ؽZe@b��8�@d��ŋZ5@g���I�@i�D5���@l4���&9@oe5԰9@qV2��@r����@tN����$@v5s[h@w�C��@y�6����@{�T$�J@~ߒ@�.�n@�Z��Z~1@��=g��@�؇�/$@�*�Y!w�@��uF(s�@��D���@�nYX�@���/�c@��ݵJ@�'N�1��@����Bk�@���>���@��*#�:x@��,0~
�@���جI@������        ?�f���?NW�*���?rb�q��?�#�M�@?�ܣ���A?��)��H�?�b��R�?�,���L?����1?�m6�+'?�+[��R@��'5�@q�P��@���@* (m�+@#�#a��@*-F��@1p���@5��z�@T@;X4�1�@@��#XJw@D�*o�3@I'���+@N$5Xg�@Q���(�@U
�zx��@X�a���@\q�9"@`\��XȬ@b�od��H@eB���,@h@���@k݇��@n?����-@p���k]L@r�RF�@t����oI@vʺ�j�@y_�4�@{f[���@@}�v� V�@�G9gί@����'�@�$�3�e�@����f�q@�N�Mr�@� f��@���-�t@�����@����y��@����t��@���z�F�@��aM��E@��7:�@�D@p;��@�����@�����W�@��k�@�w���@���I��@�\8��2�@��׋��@�t�ҭ	�        ?�!0W�@"�҃յ@<9�@MK��#T@Y�ܘ�@c1�ɿ��@k9j���m@rN�h�j3@w�x��h�@}�*ҵ��@�4O\<�@����!k�@��hR��@�H��>��@��w��$@�
G�X_@��k��@���p��@���Pq>�@�_w~+@��P8��@����>��@��/�T@��,�:��@��%�$1`@��|!���@�W�c�pT@�hD�
�l@���f�Z@��\E7B@�s��0�@���σ0@�ol�?H@�h~�O�@��G��Y�@�^��o��@�%"Rh[@���(&*�@���poڱ@���G{M�@��c�@�@��ً#@�4�3U'�@�_&���U@ǔR�]�@���,�{F@��ly@�r�����@��SS^@�:�8��@Ϯ��a�@Ж�Aj#�@�[�)w@�$�P �@��΂N~@��o��p@ԠQ����@�~3���@�`��X>�@�G���}
@�3��qZ�@�$2U]�M@��jfT        ?4ϧ4 Җ?i5T߇/�?�m8���?����wS?���S�Y?�#�R��?��H�ZrG?�H�,�8?�?��H�C?ִG3a��?�BJ	?�0���;�?�[�(���?��}?�0��0"�?�*����'?�|��KD�?�.
A��?�D;T$$�@b�h��@�SB��@�-���#@	��KM�@��xL@t-���@�[:�]7@��m g@!��k@s�E�@�Ls���@���L:@ -��$�g@!�^���@#;
�}Y�@$�(tY@&�>�Ť�@(x�&Ǿ@*g�T�@,n��c�h@.�E��?@0d�����@1���)�@2��b1�@4
.dl@5[�u�@6����a@8'�%q]M@9��K�o�@;(ϸ,�@<�]��.@>_'yј�@@{@ds@@�U��Y@Aɸ���@B��c���@C��G#k_@D�8���@E�|?c��@F���@G���|�@HŸD�6�@I��>ˑ*@K:����        ?ՈJ�?P$�}R�?s.`�2��?��B$�09?����8��?�pCȅ�?�G�(�?Ҷ$΄��?�A��H.p?��CÀZ�?�1�E�.u@ � o�@��}xO`@Ԭ��$�@W>��@�M>��@$�z{7@+A"g|}�@1m����I@5��yf�@;Er��M@@��"P�@DL!_�q@H_�o�G�@L�H!�@Q4���6@TP�1y�@WB�i��{@Z��r@^��?@a�2PM9�@c�8�X�@f�ـv��@iS<AԚs@lYvjB��@o���P��@q���V�k@smI;�5@umvd|P�@w���@�@y�N,��P@|87�c7@~�.�z@���̩$�@��a�@��~��Q@�&O�ʈD@�Ÿ�_z@�w�`a�7@�="j8�@�z=�)@�9����@� GU�@�	�ȄWP@�n��u@�;)��%3@�c).`@���]L�&@��}}���@��Sk@�luB!�@�ɾ��vE@�2�kc        ?#xd�UW?Z8�"T ?~���ʢ?���֭��?�#:����?�m_�>s?�x�ҍ1r?�F.|��?�f�s��K?���2��?��%2Ӕ@���U�@	�����B@
kK�ά@���|��@ ��{�K�@&4=�R@,�^��F�@2T�5��@7�	-�y@<�7,��<@A��� }@EK ��N@I�x۾�!@NV����@Qۤ��@T٘+�A�@X(/��@[�v�f<7@_�zV+y@b���ѯ@de5S(�@f�V ��@i��ou@l�~�J�@o�}� e@q�� F�@sK<�)|@u-�i��j@w-h7��l@yJa �t�@{�p�>[�@}�4���@�,%u
�@�x��{l+@��xk WQ@�B�*�k�@��JA4�@�P���V#@��_{"�@��Ȼq�@�k����v@�D':C@��P��@�O�.��@� ��U[,@�4�@tp@�Q�p�Lx@�y���W@��}[&@��RZo�X@�1��Lx@��瞼        ?�����?�{X�JBP@
U(L��k@ ɀ�'(@0�Mɣ"c@<jvX�8�@E��^@OIXR�S�@UK,Ls8z@[��YH|@a��s�̈́@f�jd�4@k����@pF`L�ܝ@s\�
�@v�Ů��@z��o
�@~٬˲�+@��KY,@�S���̚@�$6R�G@�7��Gh.@��2�@��O���@����x@��"�#�@� w����@�w}'�@��܆��@��bߖ��@��i�6d@��]X�@�Dpî 	@�$_���@���J"�;@��%m 9�@�h�v��@�D�����@�K	���@��ΟyL @��	��@���8@�~ ��@@��?�R@�q�J��@�a���@�����4/@�U�-|L�@�y�c
[@�t��(d�@�e��L8@�_M��s�@�a4p�#@�k����^@�~�R+��@ƚ�����@ǿK�40@��'�.Y�@�$A�@�d���Q6@̮�34?@����@�`3g3q        ?m
ˋ-?�\m:�2?���B�?�t8�TS?��bm��?�_�>u^�?�U���?�U��?�1�S��e?��m��g+@��^@�d~V�^@I�ߠ˽@L4�L�@K�e0�@�8F+,=@��U�@�k���]@L��zG�@)h�d9@ 7>��@!�E�z� @#T1��W@%2����@&�� @(�l���"@*�RM�@@,��d��@.���p�@0�7Y�
@1�6�#�@2���/�&@4B�2��@5�w���@6�m�%�i@8`u9��@9ڸ�i@;c~TSu@<��u��@>�A���@@*I �7@A�� �@A��<���@B�n윣@Cݽ�&��@Dݹ��@�@E���@F�|;�6�@H���@I.!��@JWAAI@K�� c@L�ڥ�t�@N(R��@OT�>m@PT�`1��@Q�ǋ�v@Q���A��@Rm���zh@S(fg�D�@S��z��u@T��oj(�@Un~K�~!        ?M�0�S�?�1 �늕?�u���˃?�#{��?�f7nF`�?��|'�	?ܽ�Vml?�f�i�?�`�S�?�P8ω��@�jM��@I�.��@I�Х�@@7���D@#��xi�@)�O�ҮR@0�->�@5V�8~@:T�X���@@3p���@C�~y�nr@G���@L�,��i@P�j�@S<�Un��@V@��0@Y��u���@](�8}x!@`�ɉpP�@b������@d�3*Hd@g_�8��@i��q|@l�MC�@@o��U�rw@qz� ��@s*-)�9n@t��S`�@vՅq�@xҢ�3@z�OE	@}U�AE@m覽��@���0���@�1y*ý�@���ur��@��ӂ.�o@�X)a���@���]@�idg��C@�	�L��Q@��iR�_�@�{�1f�7@�&�4g��@��J�@�?�B��@�:o@�!:�̩w@�6q���@�U��Q@�}J�t��@��Tl�J:@��d'7(        ?aV�|��}?�A\�G?l?�F��2&?��r�rd?���Tj(?��%)'I?�uߚ�=?�,A�l<�?�iw���@ o�@*ZJ@�q
�9@C��yP�@���?|�@��'��@ �9��_�@%�t��n@*T��[7@0F:��Cx@3�}�H�@8�O�@<���@A5�&��@DO��-�U@G���C�@K��OӠ�@O�0�~�@R_��7�@T��Ч�q@W��9���@Z�%�T�4@^^j^�6_@a+�B5�@c B(��@e!����@gj�a	�F@i܏ƴ�@lx^P8;�@o?f��V�@qs��	@r����@tR.�+��@vs@;'@w뉰�)�@y�$���e@{� 	F�Z@~��V�@�+H�li"@�[o��o�@��H�0^�@��6&�6�@�E����U@���u��p@�/�J�
j@�����S@�[�!�gq@�"�w@��|��f@�N�ꁵP@�@E����@�:�$!��@�>}�A@�KGf�>w@�a[d�p�        ?��YF'@#������@@h*v�W@Rdԅ��5@`���D�@jW��>f@r�)��@ys��5�E@�����Me@��EJ1�@�wo����@��A�Py@����@�4u�m@�]�l� @���A�U@��:��wF@�Η&���@����ő@�5I� �@���=2�@�(YW�O@��p��`�@�U�!\κ@���K[3@�a �Ŵ�@���Z�s@��s��@�V�y��@�Z�ː��@�I���0@�L}�O@�1�;���@�GR)U55@�g%�=�@ÑIM�#@���0�#@�����J@�N�۸E�@ȣ��P�@�y�+g�@�l�S���@��L*z@�c�Ԗ��@��!�lޕ@��R=���@ј~�y��@�rYBRG@�S"ٶ�C@�;��m@�*y��y@�!l���@� ��3�@�&} ��@�4��MwN@�JyδCI@�g�n��@܌�zq�u@ݸweT֠@��o��^@��?�E@�c(�6)@�W|��6�        ?V�a22�?�:0:T�L?�Zd���?��!���?�[K�e?����ܗ?ӍZg戲?ڽX
�C?ᓀ�1��?�iGB%B!?��g����?� ���$2?�d%�-�?��Y��?�/�7���@ N}	���@�_��@K���T@-�az@���z�@Ov����@�dd�9@�v���@��ش�@�z\w��@�p��@a��Q�@�c�iK@ Gy_�t@!���kw�@#0��#$1@$Ɉ��~@&}z�+�@(MHrdN@*7�m�@,>b
ŕ�@.a���z@0Q.���-@1��M(x@2���A�@4n��
�@5sSm�@6�Jl1�@8nX�?j@:h���@;�`�J�@=z݁�]@?TV��7�@@��E{@A�Z���@B�P��O@C�)��@m@D���݂@F)g�(��@Gi;�cu�@H�Գ�:�@Jv��jL@Kvn�*�M@L���}O@Nm� �|h@O�8?�<@PΦN�W�@Q�����        ?ٹ�6�?P�`���1?s��NL?�H��8?��!,Մ?��W!&��?��jN��?�"��/P?�p��N�?�c��o%?�X��)�@ �W��P@K����@���@Z�;6z@6���p@$n�ˇ�@*D�[7��@0�S�z��@4�К&��@9}�Q���@?�)r��@B��<�@F=ڠ��1@JHl���@N�	��A�@Q�D�'��@T��g{��@W����^�@[7�.A�@^﹢�i�@aa~�<�@c�z�%@fXTmo@h�4�tr�@k{R���&@n|�곌^@p����##@r��3�2@tp}N���@vjg��5-@x��vj|�@z��!���@}&b��@��+��h@�.#��@����;�a@����]@��å���@�[�Io~@�e�@��ztw@��X�a�@���[���@��j+C@�����g@�ު_	��@�Э^V@�e[߲1@�������@�'��E@�� 9Y �@�&�c/�        ?O�"1��2?��!�u�?��;�$?��$�g��?��洙Q?�����?ڬ-
E:)?���1y��?�lӻ�I?��}��7A@�|˩Ƣ@�W�R@��0��@"c��q�@)z�O�(i@1E�-j�@6�y�a@=��:��/@CB��TA�@Hb[���@Num���@R�L���@V��a�\B@[��`�N@`���[�@c�	���@f�|��l�@j����R@n����>R@q���ã�@t>O�٤@v�o��@y{4��@|z1�J��@�5�g@���X\� @�J�E��@�)o|��C@���[]4@�.z
�N@�U&��Z�@��Kz��@��G�m֝@�.Ǣ�K�@�tR���@��D��@�'>H*�@��2��@�1����@��~��+q@�4W��EV@���{��@��}j���@�,�+N�@����^@��ɽ{9@�r��gi@��z��@��җRL@�+�>�@�8��n9@�Z{�7�0@��r�A�        ?��ܒ��@pE����@(|$^!��@:���'�@G����@Rq	�L_@Z��ƺ�@b9H�3|�@g�K��@n}Jp��>@r�Lb@��@w��$@{��a�*Z@�p�T�=@�BG��@�Xr)5�
@����
��@�dC=�� @��*���@��D�\�@�2�@�|�@���h�a@�r�~�#�@�_="q��@�A�2�@��N�0�@���i%9K@��vW;_@���'���@�ڎ�Qg�@�,�٨RZ@���&�L@���|Z��@���3ZN@��(���@�+��i˃@�����^@��S�C1�@��XX\�@��̋��@��z-l�@�i�wJ��@��[�9�@���J mY@��?�}%@�gź&�@��b";��@�C�����@���zD��@�b����@�	�,w[�@��&�r��@�Ec�TZ�@�1ֶ���@�&[ǭ}n@�"�i�U@�'_�{@�3ͯ��f@�H)�.��@�dtY�:@؈��&@�@ٴ�]��@��X~#�        ?m�@�E
z?��h��?���T^�?�?�_	A?֡���"�?��P�!?�4�l5�??���\�?� �-�;?��9ɏ�q@N�>L��@����e�@�$�W5*@�&�@�Cz��@b<~�,f@��ne@�:�!�@!�,�.rI@#��UdC@&P!v�%�@(���
qC@+�i�M�@.�S�}1,@0�dzZ��@2��c4�#@4W�|^�@61��@��@8%��F8@:3�X�6�@<[�,V��@>��]94z@@~��E�@A��L#	C@Cc5�!�@Da�@��@E�c��Kt@GB8Fc��@H�M��C@J`U�*@L��@M�;����@O�B�=/@P��߷ܤ@Q��e�3�@R�����@S�K��@T�wT"��@U�E�rF@W��_o�@XA:1�}�@Y|��ŋ@Z�qY(�@\�Vn@]m�u��@^�����@`"�!wd@`�.�N��@a�ƏwV�@bp�3�},@cA�D��@dѺ�'L@d���hs�        ?7��,(��?l*E�w�?��6�j+�?��g4h'?�t۔?�C?�Qu��d?�P����?�V�s�?��.e�2?���b4M@�:�@
�4���@%ϸX�@�5)0�@"V�k�x7@(�#�ü@0(C�2�@4�d�:]Z@:��΁�!@@�${\� @D�\�R��@I +�({.@NOt�6ț@Ro�;@U\j^Zm@X�O`4&�@] N0���@`���	\2@cྶ�c@e��ă�@hi�;�@kaL�!@n�_rO�R@p��LZ�t@r�O#x�@t�V�bp&@v��/cn@x�;���@z�]B��@}>l�Q�=@�}
L�@��W�<@�f�̴}@�Ķy�a~@�0"��M@��K�72�@�0H1�@��5���@�h9E碥@���N6@��>�t�k@�S�V�F?@�B�2,��@�8�1���@�7)���@�=b�q|�@�K�º��@�b��+2@��D����@����o�I@��]g�`�@�m�!�@�\4��%        ?7�|D��?k���Z!�?���|K�?�/��]?���73�?�M9{��?�P���!�?�w`�_?�S�d�4?���"M�@KM�L�@	�~�V7�@g���I�@���@!���_�@'��!�x�@/6�&{k�@4,���@9���ݬ@@mg,��@C�egx.�@HB���?�@ME���@Qw���c@T��,y=�@X*�s?x�@\�.��@`'�e;4@bxµ"�@d� uW�@g��s��@j�O+�*@m�C�E�	@pr8�_'@r+��me�@s�t�.@u��E�xb@w��0T��@y�?6c@|+T��@~p�6t�q@�f$=p�@��N��Z@���.���@�3�<BK@���0O�@��9�`V�@�gO����@��	�^(@�n��ѷ�@��i,��@��T���@�)v�2`g@�mc�a�@�顣&9@��'�R<�@����@��~�Ε@��zʳ�@���%@�ā���@�չ/U�@����W��        ?�I�)a.�@�`gat@3|O	<@F< �K�X@Tv̺K�@`��pB�r@h�(�%2p@q%���%�@v�>�@}���:@���0�ɲ@�>K�~�@��Inܤk@��"��z@����!@�X�t�x@��d�Ne@���Qg@����U`@��h��V�@��F�ϗ�@�U,����@�U��X�#@��$�@H@��H�7��@�X�2e@�O�Ή�@�d�*�d�@������@��<:A@�iP3@��1nkw�@���5@�@�S�Ƈ!9@��,Orͤ@�r���@�)��!0@��$W8��@˸��V�	@ͦ��l�@Ϭ#Y1�I@��>��@� ��p�@�*D8��@�aB4
Z�@զ5NZ-w@��RA���@�Z����@��ϙK�3@�I���@��V�N�V@�tc�:�@��x|�2@��۹W�g@��_��Pq@��Ft5��@�¬`@���Y�@��E��צ@�׳ۏp�@���c�@��7S!@�H
��"        ?S��rw4?���V�$�?���Q�s?��YJ�?Ș!����?��o�hs�?ݭO��K?��,Z� )?�)YkÐx?�i��o'?�y'��^W?�H�}��9@쫝��Z@��O��@	�4�c�@��<S�@[�:h�@�b鉡v@�;I��w@g��	]U@i
sZ�_@�~��0@!v�xn@#8wK�z�@%�X��@&��H}ٷ@)UDL��@+��pF@-Qja�eQ@/�K��@1 ��U�@2?+�!�2@3�L�V@4�k�[@6E�v��4@7�K��ű@93��t4@:����@<WU9>5 @=��'w�@?�2AC��@@��	@A���a�@B��j��"@C�,�'FV@D��J�w@E�A���@F��v���@G�!�$�*@H���m?@J�W�@�@KW��:rJ@L��l��@M�cy.9�@O:�rz��@PLӔ:2@Q
�N7@Q���?U@Rw�8�k@S:s��~�@T���lq@T�o�ƍ�@U�ל�n�        ?��]p�?H��'�j�?m�0B/R�?�D[��?�����p?�������?�;�j\?�#��?��v��F?�d��g?�ȫ����?�?施@�p-,�@5��g�r@���Lh @�B-��@#*�N��9@(�M���@/�-4T�@3�3x"�e@8xN�r�k@=���LR@B�,���@E�dc1�@I{�A�ܜ@M��,��@Qcڶ���@T%�>@WP����@ZE�y8�@]��I�j@`�"��0u@bւN֏�@e
N���1@gf�X���@i�x֤�@l�]�
@o|��J�@qC�֘�@r��D���@t�)|)��@vdd|���@xLJ)JA�@zN����t@|lO=�b�@~�"�id�@�~���.�@���Q�a@����@�\�\�O�@��7����@�B���Y�@�ϊ�K�@�n�����@� $�T�,@���_�!+@��v'�B�@��'-#Eb@���j��@�� B�n@��5(��@�[� C@�G��c        ?,;:'�?^C\3?�E?|��i��?���D>@?���<4I�?�@�
a��?�*d=xSX?�ب�@6?��Ό�Ԣ?�E�KN?�-6�Q1?�����Z(@�d醑b@�z�N@��վC@}�x[P�@#PV�6�@(�U�Xv\@/c�r.��@3�"�I�j@8Gܓ�+@=�Nri<@Aw+��P�@D���Ă�@Hd._�'c@Lr�wѥ�@Pvhq��@R�vk�@U��_|�@X��O�@[�2��Ow@_�d4@agӽ�S�@ccbB�Yk@e�Y�H�^@g��"Y�@j5Y!N,r@l��H�3�@o��B\A@q7�^M@r��C�u@tbuX��@v$bFd@w��~r@yє1�!@{ҪA݃�@}푶I��@�}l���@�9˅�W#@�p�@@����yí@���vL�@�i�;r3@��t��o@�\�=�w@���'Z�@��e��@�A�R��T@����+�@����a��@����@��`�ȥK@��׭h�X        ?�ϑ?!L$@۪��@%c
�P�@7�t���P@Eyߔ]��@P�ц�@X�i�Q�@`� 1�{�@e��ע�*@k�R� EY@q<ȶ-}~@t��&`>@y{� K*@}��@�R�^XQ@�
��33@��c� �=@�1��e�@����`Ȑ@��:�|�@��a�@��.]�=@� �Sa@��=��6�@�*����n@����3�@��/v�DN@�oWw���@�
���@��8�6O@��c�U�O@�[k*~@�L���Tf@�T���_�@�u-3�)�@��+mջ@� ٗ? @�8F!��O@�~D��@��Ȓ��@�6�BZL@���u32@�/��N@�����@�jd���@�!�i�ڔ@�u��U�@�d\JN�r@�\H�\��@�]��@z@�iv��@��@ƞ�\3�@���M�a@����ߗ�@�<��]�g@ˆ��Xs�@���MK�@�:QL^�@ϣ�jkr�@ЌN�Uֵ@�L���/@�B�0�        ?��a�sg?�%�w�/?����c?��z)4 ?���5A?��V���?��j�q�?��e��@ ��Jq"C@�P[&@	@�,�G�@A���4A@�E���@��S�W@�ٙ�@9�LBb@�e��O@!B �+�@#<����Q@%Q��(�@'�-���@)ʍ���@,-��(�I@.���'��@0�m���%@1�Z��!@3]P.Mv@4�gP���@6LtN�/�@7�+q��@9n��#Ķ@;���K@<�*jڜ@>�s�K]�@@'{���@A�����@B�`]b@C ����@D�\�Ў@E	����@F�jʯ�@G.��<,@HL�)�Y@Ip��~��@J��8|2�@K��=@M�#���@NNx�P�@O��\�u@Pu�Q�[6@Q"��[�@Qӑ�z]�@R������@SA�.a��@S��a-Y@T�}c	��@U�ET_`@VPT۫�?@W�G1�
@W�Sz��@X�J�$hx@Y���#1M@Z�glo[        ?&��sw2?`��/�u%?��L��>#?�Z�����?��z�~`?��;/#h+?�K�U?���	0�?�*�MX'8?�p��ê�?�a�J��K?�����"�@�o���@���G&U@��"��@�d(�Y�@!����@&ѱ�:�L@-$޺a@2F$�*��@6��1`�z@;�ɿ��@@�3Km�%@D&�"@G�?�nT�@L-��-@Pu'`��a@SH�[!�@U�n��\@Y&C�u�s@\��ҟ��@`/���@b8�-��@dj�3�-@fƶ�9@iM�q��@l�e3@n� GHp�@p��}q��@r����@tS�h��@v%��"�y@x#θV�@zq0"V�@|<0.
x@~{ͅ��@�kh�><.@��c*�`@����)��@�O$T5J@��J�2�@�5��7~@������@�^����2@��^2}@�̝�PKi@����V�@��sw-�'@����!�@��&�ƿ�@���&@��㼣�y@�߳���        ?Q��ؤG,?�Z���u?��꧛�?���/?ƅ$�!�?ԡ�XiR?ᣀdd��?�o���?��㖪f�@�Ҵ$@	-���@��LC�@S����M@!Z��W�	@'M��yg@.������@3㳋���@9^HxG4�@?�?����@C����L9@HGgP8B�@MsD�W��@Q�B�`��@U�YN��@Xː�S�@\��.@`�</p[-@cc���@f0����@i=�vik@l���?@p�s�@q�����@t^n��@v1����k@x��"�Ze@z�	�K@}�	J�X�@�%z��az@���Q��g@���A@��U����@�S;�b�[@��m@��9��ō@��U_)g@���b�\@���F��Q@�߃�Io@��ZF[��@�h1�m5@�6�O~@�fI�~��@��8`�n@��Ϙ�@�-p�OL�@���x6#�@��$d�3�@�K7�P�Q@��G� 4n@���s�n@��m㊅f@��N�9uD        @ ����v@*P�v(@DM�q2z~@U�-5��@b��aYt@m|����@u22���@|�w_��*@��9/��q@��4�s@��@�I�@��`&Ob@�c!o�:�@�-�_��/@�NMvף@����e�@�N��y@��c�@��;]�0�@���g��@��3��`�@��6/}C@������@���D�0@��;-II�@��Hy��@�'���]�@�}�6��@��w���@�A��c��@�h�2~@��Up\�@�y�uo@�n
Xګ@ȜP��g�@�G҅�@@�okEe @�ժf�G�@Ϲ��n�@��MJ��@��ʄ�x@���?�@���׫�@�.|��.*@�_pM��@כ����@���`���@�8#ſ��@ۘ���0J@���n�@ހ+�
�O@��۸�b@����j�~@��Bf��@�z��M@�[�6�@�D��[�@�6%���P@�/�/�@�22Qț�@�=raw��@�Qۓ4��@�o�/�T�        ?r���@�?�}��u��?�S��?�{��آ�?�������?�[�}�7�?��LAޱ?�%�S�?�Uħ���?����Tw�@�H�ύ@ڈ�%�X@5/9��@��1��@�tIuP�@j�q��@x�����@�`	x�/@Lr�8@!����RP@#�� ��P@%��Cɑ@'�ʂ��@*eܳ��0@,�\���@/�m��}@19|���@2��� �@4D�ۚ�U@5���Q�@7���Т�@9k�e�U\@;My��7V@=Dq��i@?QHv�@@��^q�@A�%��#@B��qȔ6@D0P�W��@En]=DE�@F���*@H�{ @In3�l��@J�{ʮ�p@LU>�7|@M��Ab�@Ooc��G�@P�(8�<�@Q_b�Y<@R=s�R<\@S"lJ���@TT�*�@U2�owA@U�	��@V����@X���_@Y���U�@Z(��7T�@[Fk�Q�@\k\e�|X@]��^�\(@^�1�1�R@`7��+        ?Eu0�ܢ]?v���tx?�]��?���rw�?�@E5z�?����_?بs����?�O�L+�?��а?��5��n-@#��@�D�4�@z�wPMG@�Bt��%@!�O~�QN@'�H�L�@.�� n|,@3e&�P�|@8N^R���@>9��@B_`<<?�@F7�zB�@J�7�M�^@O�ߞLTf@R�g6��8@U��-�V�@Y'�r.@\�*� �@`��7���@b�g��}�@ee:����@h�;3;�@k
)x	Z
@n1Kޙq@p�X�pʺ@r��t�9@t���j@v�m�^"�@x��.�@{���x@}s,��M@�  ��@�W�N��^@��F���@�:�׵l@�ŕ����@�c���@���dF�@��i���@��׹�x@��{g_@�E�we�@�K����@�\'�%m@�vIF�GS@��EǏJ�@��2���@@� %*κ@�B1
�%j@��j���F@���}Q@�E��Z@����u�        ?Z�C�9%+?�vHq�?���ɪ�?��T�,��?��1:��;?�R$�e�$?��7�]?���p�[�?���c��J@~�̴޳@sb.��@�b�u@��DSa�@#'���'R@)$�t�@0>.'/`
@4��'{��@9���>f@@Ȏ-JJ@C�����@Gů/�@Lp��,�@P���_�@S����'@V��J���@Z�d���@^l?aV�@aP]#�]Y@c��=+@f�tM7.@h�~��p�@ko�=�C@ni�j�޺@pɥT���@rv��	�@t=Wǡ�@v�wpѻ@x`/��k@z.�۶�p@|`��j@~�O�j��@���P�L@��1+��b@�+�����@����kB�@�
�M?�@��W��@@�0A}eإ@���v���@����� ~@�u�}Ezg@�/�����@�.U�(v@�7��_��@�K@E�@�i�$��L@������(@��R�u@��+$��@�Q�e)�=@��7���@�
r�Z'�@�x�S�	h        ?�4�$@&�ն��@B��S�I�@T���
�@bP��(M�@l��_!�<@t�>�)@| �V��G@�jW<��o@�f���D%@���>��@�����_@�DT�kl@�8myb+�@����3�@�4'��t@�׶�J-G@��e|��b@����Hq�@�B0���	@�wij��@�rYKIj@��kG�5@��E k7�@�N��Лy@�����R5@��8��
@��u�~�@�r��a@�%�i�@@���\?�@��.�X�@�쾽�V�@��=�V@�c��G��@�h�r�|@ѱY�鈊@��j�Y"@�y"�C}�@��c��@׍:���@�5.�*li@���!�h@�Ô~��h@ޫ�2�@�TB�Md@�^)��=@�sK��h�@㓳�h^@�c:/ó@��U�@�8��u��@���Y@��kZ��V@�Bsk7@���$@�*�޸�@��	w+@�B���@�n-��{@�A�l�V@�r��@��hL�        ?g{��`�?�����?����PM?���p6�?��H� ?إ��T?�^�?��q��V?�ܨ�2�?��o��?� J���?���-�V@IG�.�@B�ji@|���2@
�o�x.�@��K�6D@]�[� �@�nަ@Ψ:�y@>�;J/�@ձ�/�@���?�e@ >Uh<k@!�vN��@#e��,�!@%1k��@&��ڋ�@(�����@@*��H�c�@,����@.� �U&�@0����@1���XH�@2�#z�24@4���@5g��n�@6����@8#�!�*@9��Ꮫ@:��+\�@<|>�u��@>���@?�����@@����V@Ax{G0�@BT����9@C6Yg�2/@D[��B�@E	�P
@E�t=P��@F���zj@G��F͹�@H�U�\@I���7:�@K���K�@LO��{�@M(ߑ�lx@NCMyiA�@Ob���@PCT ��@P������@Qn�b��        ?V��=�?�F��6�?�T���_?���I>�?Ơ{v�F3?�&�䂗0?�.�Z��0?汉���?��� ���?�c �ޝ�@ 7�R)e�@z���@��j�O@i���@,,\f�@ j�L2�@$U��6�@)b�G�@/Y���`�@3*M��D4@77+%�;K@;�r���q@@��K�I�@C�L�7q@G�Zo�@J��#��@O<���|@Ry*���@T���>��@W���V�@Z����/�@^n�^{ j@a(��Y��@cGĂF
@e��G5�@h���7�@j���p�@m���/��@p]�If^W@r1���@s�R���@u���D��@w�����@y�BMS.�@{�S���@~Y����@�jS��@��n?Ů�@�\gs��@����$@���NQ�@���C��@�7��I@��*{�u+@�����ܧ@���lj	O@�;���H�@�:�nc%@�C���[�@�V?��@@�r�1��@@��� g@�ɘϸ         ?=w�=�`�?i� �D�_?��v"��?������X?��q�р?�Ar�o?а�s��?�a(�It�?�#gmG��?�^�4�P�@ �U�#�R@	��~@ ��e�@qL���@!_� 6C@'*�=��@.?�qZ2@3a��.�@8m�-�6@>T���@B��)�	�@F}V*���@J�Lօ��@O����@R�ٓ.�@U�VvN�@YL���2@]-;�@`��b.@b���χ@eV�p�R@hE�{�@j㆞%��@m���8�c@p��#�9@rv�_�ji@ta�8�@vn=��J:@x��Y�>�@z�!���@}eĖ=��@� �i��@�bDN�Y@��R�j�@�`�ۅ��@����PAl@���=/v@�z�7�h@�Yh�rb@�N�\��b@�[0Lm� @��xD4��@��=�� @��qB@�=D����@����a�@��:�ߡ�@�+eN�ќ@���CR�@�
��S�>@���u�yr@��[�&�@����>H=        ?�
uC�)@�²�@2X��HӅ@C�9�@�@Qe"KD��@Z�-˗G�@c7���N@i��NW@p����}P@u,�g<E@y����	@H�B��@���?u@���s^�@��$v�@��[�#�@�R�[8�@�l�m�@��mat�@�7Y��@��-�֠0@�O���|M@�1�wXC�@� �.݊�@��GE0��@�x��뫒@�J���@�6�lN��@�=���I
@�`�"u�@���<¥@�~Yt��@���^���@������@�eAM>@��%���@�O�l�{�@�ݸ��@�|���>@�-M١�@��%x	@��Ocw@��E&?��@��3w��c@���e%ty@��" �4�@���{\@����6@�6łri�@�eGuN5m@ɜ�׾�@������@�!�C��"@�p.���@��G@s@����@��`l8�	@�z{ �G@�441�Xu@��w��@Ӳi�Ulp@�v�A_��@�>�A�r�        ?_�q?���� �?��4��'.?�B�4���?�4�f5Ӹ?�y�H��G?�#��cP?�C���?�ϟ��m?���>օ�?�	�N�q@ �&�Z"@�ټ�V@�,��;�@�ˮ>��@���@I�$��@�Zbᕖ@��	S@_�hR��@p�d�yD@ YA%T�C@"A8T?�@#���<�@%����$@'��d��@*ϰ��J@,GmȦ�d@.�n���
@0�:<Q��@1�7'��@3P�]��9@4�Bl��@6W�i��@7�*]��%@9�P����@;}����@=_I��@?Vv�
�@@��$���@A�ՖW0�@B�Ӯ��@D�y�D�@E6�YW+,@Fr��x�@G���۱B@I	3s��k@Jc���$~@K�˙t��@M7��qx�@N�N �U@Pq��@P�Pܠax@Q�<�w�g@R~&�@SS�O���@T.����@U3k]?@U�s���j@V�j/��@W�=�>�@X�n8G�2@Y�~�j%        ?a��,D�?���zcRN?��fji�?�^���?�#h��1?�� Jҽ�?���}@�!�Ҹ@�M�<�@;�2C@&h�y1@ /�Z��0@$�sO-��@)�ɴ��@0���+�@3�ܗ1]@8S��_��@=~�8ϲ�@A������@EƲ� �@H����7�@MF0 -8@Q����@S�Q%��H@V��g�̦@Y����A�@]%�>�S�@`ku�g�w@bg��{�X@d�Ǝ�L�@f��
*P*@i7ө���@k�k���%@n����Qa@p�k���@r8x��h�@s� b��@u���æ@wNԍޜq@y/5����@{'�~���@}9b#5 A@d}�ڈ`@���Lmu@�胆`9@�B�V-�@��"Fu��@��֜\�@�O�w�e�@�ƕK?�@�L
��T�@��z��-�@���"{�@�7��a4@�|�+@�e���@�V�'5�@�P)����@�Q�}���@�[���3�@�nR?N�@���8f �@����^3        ?*�3<-�?^�T�P�?�Os����?�ƾ��_�?�@�84�D?��C@)��?̳0��H?���A�W?�=���?�%���?�^'��[@XX�|��@��Ю�@�6�7�@S���Q@$ �=x��@*\G|�>@0�	K���@5S��c��@:sf*@@*��V�@C�p���r@GF_�*ZL@K|p�j��@PuF�	@R�N�7�@U���H-@X�1��@\�+6��@_�˚��@a�t�B�{@d)�����@f���*6@i%f���@k�L�׍@n���|@q]�YO@r�d^5LY@t��`��@v��y�~@x�u���R@z�]����@}��i@w  ��@� ����@�U���@��gx�g�@�1�%�@�����[@�R�|E��@���ś��@���-'@��Tz��F@�l�H��@��q耐@@��I�~��@��0F��s@��VA��@��L��@�0�\Q,@�i7N@������@��֬*��        ?���}&۟@ xj/��>@@�-���@T��@cn�� �@p#�;O@x=�'���@���.��@�� x��@�	O�A@�����1@�ޏ��@�o(K�r@�*YY�z@�"����@�����@����^�@��^HԂ�@�+5Vv4�@��2=��2@���8���@�~�Z06@�u���8@���Ge9�@��M�xK@��`1��d@�$���b@�ĳ��	�@�����@�O�O�E@ĩ��E�@�tM��@Ǌ�Ϯ�@���*m@ʪ�n��o@�S<Hg@��xG@��1�j�@��Y]V�@��>�y�@��D�`X�@��i;9��@�۪��&�@�����@�=^�C@�4	8�z�@�a��@ڗ9a���@���_�v@�`�UB @�g�e��{@߽Q9���@��T�+vu@�?���_@����Q�@�>�j@�oz
�J�@�1�4�@��_��@���U�.k@摔&H2@�dy�A�M@�;�\@(�        ?B[����?y��o�O?�5g5g?����	3?���fb?�%���Y6?��}�.o?ܺ``���?�T��eZ?鲨�C?�`i�@?�b�8�b�?��N�_�?���W�@�&��?@Ҥ���@.�t�"t@�ǧj��@Ӫ��*@H�HLl@d3��~�@�a��K@�3����@pED���@�bKAa@!a9J}�|@#�h�P�@$��,`l@&��U��/@(�XQ9;@+%�!@-t	O=-r@/�qT�@19c�G��@2���y�@3�נA/y@5{�B @7
�P�|>@8�S�e��@:c")'�N@<,�Z��@>	�q�v@?���@A p��(@B�_Q�b@C%f��.@DG��fvG@EtߕvD@F��k�@G�7W}�@I>�����@J������@K�q�eߜ@Mpb�ϙ_@N�4r\@P<�4�Q@Q�QS�@Q�
9jjc@R�&Rt@S�p3%>@Tz��A�@Uh�Ξ�~@V]��        ?3� *���?q*e��hR?�R��T�?�C��?�\�ڑk?͛�*�/?ڏ���?�x����c?�)'�f�o?�=�yJ>O@9LW}�@��H�^�@�NX*@L��0/o@$tnC�ʊ@+	7�m��@1�0V@0�@6Q�~fN@;�$2 ��@AD���P@E	�A��@IOp��@N�ou7@Q�J����@T�����@W鱶�0�@[p;��$@_B����@a�KF:�@c����x@fHYNFF�@h���P@k��¹�@n_�����@p��Oe8�@rML��a@s�֌�F@u�~��@w�Z�9$z@y��L�so@{�i�,[�@}����@���)�@�,ي���@�d�Ջ�&@��ʉF�P@��"o�Q@�\ۨ��@�����<@�FE<���@��f�-@�k���P�@����@��o�/��@����%�@��$p�[F@��fc���@����2Ė@���q~? @���!j��@��?�|{@�)�i8�@�M$3���        ?qSX;I�?OS���7?r�y�S�?���~��?��t���:?��B>�9?�S��:P?ӓ��&k�?���	��?�j�cL�?��F�b@/|D^�B@	SD��w'@s��G�@1���Q@!'��d@&é��@-����k@3�D��l@8����@=�\�3s�@BW|� p�@FAQ��9@J�o��@O�E�\3[@R���7�M@U�,���@YP�9�{@]#k;��@`��9ky@b�cѵ@emE���@h��*W@k ���@nu�,'@p�շ�J@r���@td9F&�>@vgス�/@x��~�tx@z�N���4@}01's4@�߽�8f@�,g�p��@����=��@�
Ml�@���'�$@� n�RZ@���Qh��@����.�@�Nf�TM@�+�ݰ;I@��
�@�@�W{���@�-q�@�*�� �@�F�u���@�l+�C�%@����GYx@��I���@�I�M�#@�]����@��e��Z        ?Ƚ�yX�@6 ��"@"����@7��y��@G��i@Tx�?1@^֕}�.�@f"�g�@n7Χ�
@s�xEӨ@yXnK��8@�mn��@�Zr��~@�U�
�]@��}f�@�W=���@��O��@��vު@�C�4\'N@���Ա�@�O�B,�@�aD�`5�@��`�{��@����u@���qKQ@�M��|�@�9C���,@�*���"m@��g9A2�@���W!�@�p��l�@�g�pPb@�|�K�/@�����<@��+BcF�@��|���@��{�%�@�X�1�+@����{�@�<kQ�]	@���+�@�g���@� 
�}@��7��@γ�c�`@�N�� 1*@�M�)�W�@�V�j�@�iSYj�@Ԇe�q:x@խ�ru�@��-f���@�\�ɠ�@�e�gs��@ڹ�d���@�dg��@݅:/��@������@�ALjKs@�
fX�l@��5�N@����?S@�u-��~        ?t����Q�?���V��?� �ɡSm?��'�_?�V���E?�����?�I&��~?��=�~��@i<�΋@p�Q�S�@��|��@�Y��&�@z���@�x*K6@16���@!�(����@$�(�'��@'s���ħ@*|�����@-��&�S@0�@aX@2rJ�n�@4f���A@6x��w3@8���G@:��2'�@=]�u���@?�װ��Z@AD�y�@B����).@D:(��@E�Xyh�@G �!�@H�U_&O@Je:Kq&�@L��D��@M�۳��@O����z@Pύ�x��@Q�3���@R�V���@S�	"s_@T�w��ab@U����	�@W�~�7�@XCȷD��@Ys�H�)�@Z�T ��@[���\h@]5�݇�@^�iZ�e�@_�Sr�[@`���1�@aWoe[r@bI�!;@b�v�w�8@c����}@dX�hדL@e$��~@e��@D�@fǥ�_�@g�#'	M@h}#b>��        ?P4�tJ� ?��J�c?�ָZ�?�� %U6??�����?����?ކ7����?�,��*?�P��=�n?�wè�ȗ@�W᣶e@����͵@�I��k�@���@%���y�m@-_�@3��v�o@8ɊT
��@?�#?vY@C��v#@H�q6�@N�R��@R�����@Ve��m�I@Z��5��@_�"�9)m@b���L@e��ώ�@i!y1��@lѬް�@pv��OU�@r��}��@u����@w��g���@z�k��8�@}�|B�+A@�YE���@�"x��@��K����@��f	�+.@��B�;5�@���*�� @�ك=�s�@��G~��@�5E�N�m@�j��l�b@��kj�@��\+O@�Nk�/@�������@�����@�����"M@����r@��E�,@�>���@��`�V�@��^}�@�� i�A@�����@�n�a�@�\�
��@�N�?dc@�G�����        ?Xb��	�0?��`��?��_kv�K?�B�P8�?�g�O?�\����*?݁�#nI�?��D"��?�/%?�+dS4v@㴰f�@	�DM�@�<�l�0@-!��@ 6�ހ&@%e(1;��@+��H�@1�w#�@6��dC@<!Y�<��@AZ�0�@E-�&�T�@I��Ԛ� @N�\��=y@R%�U@UX��J�@X�{���@\����@`� ~�l@c��eI�@e�#~�$�@h��]o-@k��[�@n��$y@qB!�s�}@s.M��8@u<DY ��@wl��Q�@y���'@|8�Rԧ�@~�:��*"@�˵��9�@�?�L���@��}�S�@�b���6@��Ǭ@��j��]3@��)��@��f��;@��F��W/@�W���[/@�m9� ��@��({+:@��r��A@�울x�r@�,�%�0@�w��s2]@���׫%@�/�Q��	@�����I@���M�@��|��ˡ@��p�/3        ?��pf
r�@&E@s���@B�"�1n�@UZ�Iʦ(@cm}�?�`@n�9&���@vy���`S@~���޷O@�({����@��S�|��@��`=W��@�t���@���G6�h@�v�u'�@��0�7�@��u��sT@��=훂%@�y�k O@�1,�r��@�a"&�@�'tW!1@�48�]C@��D#}�@��Q,	��@�����]@���
�C�@��g��@���$�^@�F�n؀�@���ؤ�@�g��@�b|�F@Ĺ�U��@�/e�@ǌG�v1@��')�@ʍ#��G�@��3�@ͻ��
:�@�d�6W�@Ќp��ھ@�lho��@�RB/�@�>R��q@�/���@�'���ڿ@�&>��v@�*���@�@�5�H��@�G7E�L6@�_�O� �@� �.�@ܥ�Y6�V@�ӕ.�@��?��@�"�>���@����?+)@�j���]@��|�
�@�©k�ߔ@�tjo��@�*,�E�@���_䳊        ?g?���y�?���z�N?�Y��x� ?ʸ����?�[����?�gʬ���?�\�"���?�;���?��#-�@@ r��@@x֣EVz@���X:@�3t;i�@�%�{`@����@�՝ �@wsh�i@L���i�@!���|@#��ԥ�@&Y=!ttu@(��(�@+�@C�yy@.�n��t@0�{�@2w����@43��J�@6��ڹe@7�m��f�@: Q����@<#�AU�J@>b��� @@^���د@A�k��@B�]L�X|@D:��_@E����r@G�D�٩@H��8��p@J''��@K��� @Ms�M�~�@O0�v/�@P~��}�r@Qm:��4@Rd?Q�s@Sc���j@Tl^0@�@U}��E�@V��� �	@W�C&N��@X碹Ӡ�@Z-Q^x@[[����p@\�3ȚS�@]��%a@_Q7A�@`Z�_:N�@a�IT@a�r�Wm@b�ޅO-@cT��r!�@d.:MH        ?k�Z���B?�me�u�1?��v� ?�\9�`��?݄2��?[?�W�����?��n��?��P�?���>Wh@�xڂ�@
�X�I��@?:)F��@�;"��@���q�N@!LEf���@%��y9@*�����|@0S]]n@3�`�Kc�@89���[@<�A[���@AE;Qc��@Dzʄo_@Hv殽@L>Q�N	�@Po��[N@S<����@U��gv�@YE�g�@\��E��@`9bz�b2@bT=����@d���[h@g�m&*�@i�NEVxy@l��s^��@o�P����@q��'���@s\����#@uC�c�6@wI�;	ţ@yo�Hl�@{��K�1\@~D}�l@�SB���u@���AO�@�o�n�@���:�b@���^��@��ɼ��t@�aWѲ�@�#d�q �@��}�:@�߭�X@�m"K��@�tD?�d@���CSĹ@��6�@'#@���4��@��SN]@�+��V�@�ol�^�l@���2�9        ??��ٓN�?q����·?��x��f�?�Pn��@?��6�F8�?��Sz`΄?θ��/>�?�\'0�e�?�5����?�4	0?�cce��@�
wt�@=��O��@�Q((�@���sI�@l�Qr@�@#�j����@)�5eK7�@02�>�41@4<ͷk�@8�L^�D�@>uSNmtD@Bb	ي*@E�p�-l@J�x�=@N�ը,EV@Qݵ��>t@T� Pp�V@W�C/��@[Pͥ�@_��3�@a����>@c����@B@f\�/CUF@i�5���@k绕P��@o�C�v@q+�r�-@r����N@tޤݿ=!@v�d1�Oc@y�m*�6@{g3K� x@}ܯ��@�<�e�@�����!@�0�-��@��Ƀ>�@�=�t�l@��H݄�@��tX�PP@��?��}@����|�@�����ƒ@��5�8(�@�@k$g�@�HX1�H@���F)�@��uG@�+�7��@���Ī{}@�����@�������        ?�>�9@#�/��I@A�M� �@T8�z��@bZ%Y��"@m=�(z�@u��j��@|�k���@��b�~��@��X�O@�~H���@�۪�aߩ@�F�ܠO=@��J2��@�BO�D@��:�Vs@�!E`)�@����q@�}����X@�z����1@����MD�@������@���H��@��=�#�@�ߤ+@���M6�@�X�6)��@���ՔL�@�(ء-@��
5�d@��Bl�ݱ@�a�^�Q@��tu��@@ǈ��{R�@�6:H�o@��W��R@����B�@ΨG�x��@�Nþb@�Q��@�\�h��@�q��E;@ԏ���@�@շ|$y��@�覟B�0@�#�A��O@�h�&j��@ڸBvc@�ʦH�?@�u�����@����<��@�/�;@��="R@��k�px@���,,\@�X����@�0�By@����@���yVXe@��f��9�@���lC@��J�}Z�@鼰���        ?��>�I�?��y�s��?Ǒ�V���?�R���?��_��w?���{�;?������@kS�I��@	�G�{c(@�
܂�0@׌f-LB@����@@�Q�g@"n��$s@%���E@)C��0g@-&ED���@0��CH-I@2�v���@5_xw��@7�B���@:�ةl�@=��
�f@@gp���7@BɡZ�@C�7�,@E���v�\@G�� �W@I�N27�@K��f�%@N/��,��@PLy�ٳ�@Q�����@R�����:@TC\��׬@U�TS�&@W5�� �@X��ѩ(.@Zl�ʔ�@\#���@]�Mw��@_����@`ފF�d�@a��� �@b��<�[@d		 R@e-�p�	@f]ʵ��J@g�����@h�<:Mް@j6����@k�z�i4r@m�I�{@n~�D(��@p�5�@p�7��@@q���uu@ru��yq@sT@��is@t9�3(,@u%��@vN��W@w���4�        ?]9�.?�o��k?��@%�p�?�X|�߸�?ˆbsˍ�?�l�?�a�guL4?�n��f�?�f(Gj1@�g���@�K"k�G@7�&{&�@:ǃJ�@%uHc\�(@,�9��2@3�?I@8��͍��@?�K싀p@C�Ig�}@HËӟ�T@Ni�yU�@Rx��0q�@V5�8�g@Zu���@_Ayu�`@bP��7�@eP%t+��@h����@lL����@p)+85�@r[���d@t�u����@wVtKR�@z"J|P��@}$�+�	@�/��l�@��q��@��m*V��@��߆`@���π�(@��cG*�@�m(9�f[@��S@@��wyp@�/��5@��|���y@�4�7*�e@��%�u��@���0y�@�RhI�#�@�/��n�E@�!l�B�@�ֻLA;@�!3�*��@�8�Rh@�Z�G�{@��L�Ƈ@���|a@��m��7^@�D]6��@����R�p@��%G��0@�V�w�        ?^V~&�K�?�UI�m۟?��WX�U.?¢�x2(?��ck�>�?�-��*vL?�=Q�q3?�����@_FE�y�@g�L>�@�W�O�a@&Y��8��@0;<)�_H@6�v��!@?����4@EZQ�Cp�@L2����@RC���@W=0�A��@]�B��@a�_m�`@e�pn���@j5GR�϶@o/��@rDW�
b�@u=��@xz�or�t@{�����'@��U�
@����6,@�q4�V,@�F�!qs@���d�!@�,�Jg@�ϙu���@�H���YT@����#.@�:��|�L@�˃k7��@�lU��0�@�^��_�@���.(̬@���Pi��@����W�@��H�r:&@��˻q�@��Z��P@���5;C|@�6tT�@�&0D�}@�S�O��a@��rQ��s@��\@��@�%���@�Z��$�}@��,�u��@�
�Etgf@�l�}&�@�j��7@�!� ��G@��^�cY@���xi�@�VՂ�$        @�g
��@=���q@@X��ܧ�@l^���@y�W�@�@���K6U�@���q�D@�Chס�@�S��q@�B�����@��44�ܓ@�H�rGn@�%�Xd�@����
ʴ@�F򕡬�@�r~V:
@���KY�s@�
ߏG��@����ӛ�@�ƞN��_@���s�,@�x�za:@њ ����@Ӛ|��ߣ@տL��`�@�
y�B�@�~�g��@�Oj5E�@��Xߏ�@�p��}�@�_%`D@䲒I���@�xX�ܕj@�V�� &@�N6�P�@�^���N@�ҳ5@�fD!F/@񕝖��@�Ҙ�@�`\�[�@�v!��C@��(��?@�R����@�����FC@�j��Eo@����s#@����{eA B�"!��A-���)�A ����yA�^`�A!Y���`A/�.��AEӶP�>Ae�����A��ê�A	��xjp�A @闾�AG�u?�fA��9��A�\$�2A.�B�        ?Kz�4�K�?�d�֔�?�ߐ�~o|?��Pv�"�?�����:?�!���,8?ն|I$�$?�M*(W@?�(�ǈ�D?���hگ�?�'z�u=�?�5ꍞY?���_��?��#ZK@ RQ�C��@�B����@��,"��@��ҽO@�^���@��ݽU]@Hi�^&@,�򌧘@.����@LYW��@�=�C��@�JN�
@[g~و@ yw����@!�N�ڞ)@#AR���@$��-Y�_@&K���@'�)!U�@)�W[@+X���ī@-*R��@/���! @0�;@�U @1��Œ�@2���RCK@3�a���@4���W�@5�I��τ@7�y�х@8E�۠�@9�L����@:��1�@<��n�@=v�� �@>�5��@@#�[�U@@ߕ�},>@A�_��>@Bf<$l�~@C1(�+@Dt�F@D�ƙ��@E���@F���T�@Gr���_@H[�Kk,@II�rQ
@J=-�;�        ? v2l��4?WP��&?y�߲F�?�B��
�%?��iMvuS?������?�$����%?،�MJ�?幋�u?�Ad�/�B?�R�}б@��~r^M@��Z�ǀ@hh?�I@!-�LZ,@'�ʈ��@/�,�Y@4��~n�@;%�9�qZ@AR�u�*E@Eʣ��U{@KvR��<@P��D�+�@T#���`9@X1�Ch@\̽�%$s@`�߂Z��@c�$*�|�@g#�+}@j�B�n��@n��ڳg@q�M>��n@sݝ��m@vp,/>[�@y:-Wڧ@|=��!�@}��d�@�}��V��@�]
��w@�]�ˀ��@���O���@��C�c�@�6HdLR]@����W@�¶�G
@�5S��@���&��@�Z<��ȇ@�]��@����@A�@��S�b�@��"%��@�Ί��7%@�
*^P^@��@�k�@��H��@��w�@�h`3��@��7���(@�5t���K@��}X@��@�A�7*�Y@���F|��        ?W�/��I?��,�RA ?�������?��f���?��P~2?�Ǽ�Rz?�`��Bܹ?�g
�-��?�ё.�J�?�y8qD��@�v{-@
@�X@�����5@I��'�@Vb7�@#�����@)!4�/@/CG5��@3:���N@7f�i��j@<1,��`�@@�Y8��=@C��=;J_@GW�-5�q@K-���(�@Ok���/�@RAg�d@T�%��!-@Wa|�{@Zf�P_@]�A��k�@`��-�@buT����@dvK?x�@f�����@h�:�(�@k=hbM0@m�bm1�@p3q��@q���7�@sf��P@t�1n��@v��q%�@w�F�W:@yrF�E=@{3���P@}��y`�@~��@;@�j�Yʺ@�isP;"�@�pr45�w@� 88|Y@����Q�@���UN@����G��@��N�6@�=���@�{k�B��@��]Њjz@�p"�=@�e����j@��6O��@���N]X�        ?�6?�v=@
���ED�@)�����@?G�t;�@M��l�L'@X�G���@bd��@i��r���@p��r��a@u�C�1��@zÊn�n@�8-x��@�N4bO@����.�@�8�sn4@��	��H@�j�O��@�AL.w%m@���VK��@�՞���@���$�Q�@�ZK��u@��AOq}@��I��6�@�7����@��	�>�@���m���@�nA��@�R��{�@�J#!�E�@�V}�9_�@�;�����@�V�w�9@�{��t	�@��q$��c@�声`9�@�*[W�@�y�ӑQG@��UV�D@�7���(�@���0�@��P��M@���SM@��+L��@��>69c�@��&}`��@K��ܸ@�e��̢i@�F���@�,�H�$�@�X�L��@�	W�S&P@����!v�@��U��H@��6Wi7�@�Bʃ�@�mF=.@�����@�2�7័@�M�;�@�6:�S@�� մ}E@�\W��        ?�.�%@ ?�qg��tE?�LA���?�Y�c�u ?�CL:L�?�<�5�f?���|��?�8�@x1�?�v�k���@ק1���@sA�P0*@�!% �t@�v�@���*R�@|¾��@���ϧ@�ú�$@!�\���@$:��9)Y@&�԰�A@)YV�N��@,03���@/99T��V@1;��"�@2�U��@4��7�o@6�1p#� @8�X �@:�!�leo@=I�W1=@?����ܣ@A!���W�@Bx5���#@C�xX��@ET����%@F�^�36@Ho�B�e�@Jko'{@K�,�<^�@M���t�+@O[�	��@P���^�D@Q��7�{@R���^k�@S�ƫl�@T��-�@U���F>@V�~��@W���o@Y	��,�@ZLfp�@[�H�z�@@\�Ȍz�@^
��?H�@_Y��*/@`X:l��@a[u"�o@a�J�� �@bqU���@c+����x@c����@d�5Z��@ery�"X        ?U�n�C�?�R����?�o�Q^�?��u��?�`�<��?�A���C?��-_��?��Pcs��?��Ān@@�a>��@	>�x��@r���@��9���@����@$�����g@*������@0�;&Sk4@5����x@:���@?�Nl_]�@C�η_@F�BLu��@J�Q��8�@OR��!@R&zfwT�@T������@W���n�'@[�?���@^��� ��@a#uU��@c$�U�@eIZq�x@g����@i�f}ڿi@l��L@oJ��9@q���]�@r�Z�bDh@t-m�+V�@u��9�@w��!L@ydV\�0�@{H"�Y�@}?O@m!�@I�f�TR@����0�]@�̽�À�@��ls
lL@���g@�R��9=-@��#�SFW@���.*�@�6��~~@��>n�n�@�XQ|�@�z����l@����/��@�Ec�m��@��� ��@��]��r�@���/a��@���KzbI@�~`�LP        ?X=G�&�?���=��?���My��?�����P3?�	���.�?ۈǺ�?�����#?�]t�?������@�-�DU�@zf�+��@=�s�y@����@"��2u @(�v�˶�@0ZA�UIW@5l'iE@:� �
l@@��@�So@D���e@I$��T�|@NS��}#@R�	�~�@Ug�@� @Y�4�/G@]1�p�t
@`�hk��@cX�c�b�@fA��ӵ@i	�7�@lC7��d@o´"�P@q�ieƳ@s�k1��@v �&�қ@x[�*���@z�Zœ*w@}�hNxX@�9�p���@��� ��[@�b�\h�@�E��m@��j��@��]��Z/@���6ø�@��ƬT@�e^�>`@��9��v�@�, ��/�@��z�kv@����j^@�`Ey�o�@��j}��?@���,��@�60Bp@��BL��@�Ϳ�K�@�[f]�#}@�Y�,�R�@�b@E��J@�t��h�'@��z���@��u6��        @	42��s@2HҎ�
{@K�g۠��@]�i�D͚@j>;]�G@t�2���j@}��`�H�@�L���,9@��u�J�@���d�Q�@��IT�~@�93�G3�@� ���@���Ը@���H�"@��l9׀@���wʺ@���p���@�8]1V/@�J�4d�@���N��@������@�g�8�5@����Z�@��h�-Vr@��o��@��z~�@��� Q�@ƦE�Jh�@Ȓ�[�YI@ʛ�@��Co$�D@�E	�)�@в�Қ��@��2��@�C�<�k@Ԥ��W7J@��5J�@חIl|�@�)W�u�@��_��@�}��t�J@�@��C!�@�
6���2@���_n�@�������@���7W�:@�m�ױ�@����4@�>ax�23@�g�����@蛺���@���E�D@�"��'�@�vi��=Z@���{f`@�>��*ى@�Y���{@�*|@�ߺN_�j@����D�@�{�lzn�@�R[�7T        ?JXq8��?}����?�hT0� ^?��CF��"?��0ke�<?�	.��W?�~}ò?ݷ<����?�����4�?�܋�q@
?�N�s�\�?�z4��?�dI����?�"٬`�J@/�뜷d@U� ��@2���P@
�-��۶@Q?��;�@)=k��@R:Y�[Z@�n�{��@$���AK@Ѵ����@��׆@ ]��P�@!�4��;�@#�g�%�@%���\H@'w�X�@)�9�\@+�8�Ob@-�s�.�@0"��i;@1`wT$�@2�'Y��@4	��	@5t}�(֜@6�6��4@8z�C�@:�����@;��"U�@=|@T`��@?Gq�Ζ�@@�8�uL{@A���X19@B�����@C�L��܉@D��m�ٹ@E�<�-ح@F�Fy�Vd@G���d@I2(ڏH@J@	���i@Kx%[	�@L����1%@M�P��)@OL��\_O@PQF��@P���\�@Q�]̾d�@Rh��v@S#�L��        ?�#���?Pvf#��?uQ�8|��?�"%���?� ���d?�S_���?˕u|��?ق���R?�k\>'?��Q��i?��)�,@ėx��@���U@���@un~'G�@"��	@(����n�@/�h	��@3�p�x@8�V�Uf@><]���@BKM=c|�@E�eQ͔�@I��Q@Nt�J��	@Q��:��@Tyg�R�@W{_
Y�@Z�q���@^Q�؜	@a�|�@c*��>�@ehY��@gы�߰�@jhC�<>�@m.І�u@p�$չ�@q����o@s]Hʳ@u,v��j@w7��a@y'�]��1@{V�E�@}����B�@��^O��@�Z#6��@��ݛ,چ@�-X�;M@��7���@�R��@�����1@��}�9Z@��:���@����p��@�Z ���B@�n.K>+P@��#@@��9���@���L@�BI<�=@����K�@� o�(�@�u�<��        ?D��Ё�?vy���?�F0���?�|6��A?� o
��?̿����?�r/F�?㮄Xf?�u���?�֙sU�@ �%Z7�@��G��I@�f��D@�{|zIm@%<�P�@#�Zp�$@)�Z�@0Ao�$j@4^J�-$+@9-��^�@>�Ot!�@B��PX#{@F"xϟR�@J)}�@N���6�@Qɋˠ��@T~il_.@Wq]�dt-@Z�����s@^^�9J@`�S��!}@b����3>@d���6@g=�����@i���9@l'~I��~@n�˒�@p�˧���@rMp�n��@s���#�@u��o�H�@w9�{N�_@y*Fk��@z���0�@|�0m�:�@~�"�*��@���Sl�@����'@��3���@@�&n~5@�r���"@��{��M�@�5�N�?�@���(%V�@�7GJ!e�@��)�h�&@�y��M�@�Am�8B@� m ��@��3�@��B�nq@���3�@��j5�O�        ?�o0T�S�@�Lv^X@#��k�	@7��pw��@GM/����@S��=O9@]�p3�i@d�`����@lJd��s�@rcW۔�@w:��/1�@|���@�c�()�c@��oE
�@�w�3�d@��O�8��@�s��9�>@�ӝ�E@�a��[Z@��R
M�@�]��@�*�I�	@��/@��@�����i@�^Lz6��@�V�6� �@�ky�h�@���m�Ʒ@���BNޱ@�W��<@��֏@��@�E��_I�@�������@����it@��'$��@�=����w@���S���@���ʖx@�o�uN(@�O��&3@����8��@���*q�@±GƝ�@��Z ��@�����:�@�o.�@�A(=*�*@�{��TC@ɿ-o���@�1�{�\@�_����f@ͼ���+�@�"O���@�H%�.Vu@�`���]@������^@҆��-�@�N�ın�@�utT��@����N�@��q�r@֝��x�@�|�oWc        ?Z���C�?�>4`k�?��:M��?�3%���?����eͧ?՞����?ߟ�.�d�?��=oX?��mE#?�]�YX�?�h�1�?�"���[@ &H�8@�g)���@��ګ�@	)Z����@��H4[@���Z�@T^�n�@'�"@,>~"h�@i�#�g@�9��@<�Ǘ��@�Dk+0@!E��:�@"�K/�@$/�o���@%��n�h@'`Z<�S�@)�����@*��W�@,���<?@.��a/7�@0V����@1d-��y@2}F��~�@3�^	�k�@4���\�@6^B�@7_�љIj@8�,��Á@:%����@;�o�@=&Y����@>�	��>�@@2�\���@AF��@A�:u�x@B�!;���@CΨ�L�@Dȷ��n�@E�7ڥ�@F���q@G�7�p�@H��`~[�@J"��@K>���@Lk�Ne0�@M���PZ@Nڪ�"2@Pm��~@P���
7        ?�Q��?K��{�1?nbT���?��	Uq?�ju5�?�s;�5�?�h����?���{�?Ӭ*�@@�?�%�N?�^YL
1?�B��B��?�S�����@>6־2�@4�^��@3����@�ph1�@ �����@%�?���@+j�����@1(7�؜�@54�/���@9�t��-�@?W�r�@B�!<�D@FK_I��@JC6#tK2@N�)�2P@Q�Yk��@T��_~�Y@W���0@Z�e<���@^�9'D��@aAA�@cf�(F�@@e��N��@h<��.@j��d�@m�F1�s�@pw��S@r�"M�1@s��0ک/@uÚ�1L@w�	�!v�@y� ��@|O����@~w�N��@�z�"�|@��,��~@�+"��@����X1@�"7%I�_@��c1'�]@�c�W�"`@�!�&O@��D���@��^U��@�i�]�@�@�q�l��@����k7�@���˟�e@�̒��!�@�  �	6        ?Y�r�� ?�v���S?�îح�?�;SWh�?�f��k?՗zՑ2?��|��?�F��,k-?�=\�"(#?��m�1
�@�wh�Ȝ@�6D@�T�@A�<�B,@��Q���@!�
=�@&s�<��@,��G@1_��+@�@5@ܑ���@9�YK�@>�s^C�@BS���V@E�(� ?�@I9,�-�@M@Xs��@P��0��@SE'�*��@U��y��@X�>�Y�@[���/%3@_2|,v��@aa���\@cI/	�U@eP�}$�c@gy9�Dh�@i�<�a�@l/����4@n��|xc�@p�2[Ζ@r'o8�r@s�cvj]�@u;�W/1C@v�S�A2@x�%�s��@zu�*lhL@|_����R@~`l�m4�@�<n�F�Z@�T��Y@�y|w�	:@���W�@��k��ϗ@�5>�E��@�������@��.�
�I@�k�o:�@��>5+p�@��xDd�E@�%独�@�k�RM|�@�L�*���@�5��:�        ?⤖���@�0�F:t@0��A6��@C<�x\�@Q� ��$�@\	�Q%��@dP.��(C@k�~q��@q�����@v���߀@{�f�p�l@��>)���@�������@��hI�@�O����@��J <��@��&X#�<@����چ�@�;�=�@�Q0���(@��1nD��@�' �HW@���rMG�@��K��Z@�)<�6�4@��RNZ�"@�7%�cU�@��Ty^8�@���:��x@�Wh��ե@�4���X@�'G�kӑ@����B@�'��A�@�CTCkGX@�kaH���@��r����@��L��X�@�4��eQ@����o@��Σ�D@��3ޱIA@�����@��/��?�@�?SU��@�$�Da-@�(��n�@�����@��y[�@���@�.��$��@�L8�)@�r�a���@ɢsK���@���k�0A@��M�c@�e���_@η��r�@�	5�+��@к�)X]�@�p_;�@�@�*1� �C@��,Z!�        ?B������?v ���j?�1Ǡ0{t?�C��D?��D�(?�X����?�+B3h?�ۋ��?޼z�إ�?��V�Tz?��NG˘?�Ի*g�?��V�U�?�+)�R�T?�䓥y1?�V�5c�@�mgwK�@��b�@��jl�@	���7H@*�wc@@_'׸'�@N유b&@fK�K�b@����m�@�a�@�o* @o��̢^@ �b��8@"H��u@#�u�DO�@%��^Au@'���~@)�Mʞ�B@+�v���@.�EƝ@0=>:&�@1~�.J�@2�^�2vO@42�՗�@5���rg�@7)����|@8�ӄ��^@:eTz���@<b8ɤ@=�/�]��@?�����@@�u����@AتÔ�@B�<}���@C�O3jg@En�AY@F8�tיR@Gh�y�@H�T\��c@I���o�@K6���p�@L���h\n@M��W0t@Ob%�+G�@Pm��>��@Q0A��@Q���,N        ?�@�?SR&f �?w"����?�;\.}s�?���J��?�5��?���E7<?�ɨ��h�?㙽mX�?��jw%)�?���%A�@�8@ը@��ظs@�X�%�@'��z@!���#k1@'!�k�o@-�dV~@3����@7�Y�ݶ8@=�����&@B)�U�@F��.��@Jl�OJCy@Oq�;B�@R���)͹@U��R+@YMv7Ӊ@]A�����@`�D�R�@c:�T5��@e���]-@hĤ� �7@k�`���6@oW=&.��@q��Y��m@s�� �@u�$�$��@w�x��u�@zq6���@}�?�A@�ך@��@�n�\N��@�4��X@��v�U�;@�sԗC-@�P�8ɷ@�F�t�k@�V{~�@�� ޷Ӯ@�b�/"@����~�@�ΥA�L@���L{.@�r�!t�@�٪̐�@�O>�m�@��p��@�fr�! �@�}ZC.5@��ˉ��@�=N.��9@�%�ƨ��        ?J��P�=�?|�Q�CEf?��<�?��Գ'|?�rL��x?Иo��k�?۔��F̫?��60�P?���l?���A���@.k ��@
	o+�.�@Jp�ŗ@:$X�L�@!��I @&��(���@-�ź�X�@3@�&V@8�����@>�>vig�@C��`\@Gi����@Ljz�Lr)@Q
�T[`@TT���'@X-��@\j�D#
@`Wr�۪@b� Y�#�@e�Ǳ
c�@h�"�Z�2@k�A@B@oy[�@q��#�b@s��?#��@u�(�{ �@x)j�Z@z��#j�@}.�>��@���b@�^�x2�)@��o C��@�j�A6@�
J�q�@�������@�{��>h<@�MI�G�w@�/��ې�@�"�S���@��R�>��@������S@��0{R�,@��9�:�~@���u�2@����s�@�Oo{��@���dv+�@���r�(@�"V:�Z@�z1ǩ@��h�O��@�E֤}��@�\��U�        ?��G�@<<Z�,@#�p�"D�@8�ڡ�@H'%*�m@T<�>"�!@^�q90�@et�+۹�@l��`U��@r^�*]�y@v��|�H@{�z�J$@�̥+f��@��!n��@�AXdS_�@������@��ta� �@�� �^@�-��./@�����Њ@�l��M�@�o�E9@�����@��� �}i@�rkF�]�@�qLB�<@����ۙ@�ط2-A@�D�r��K@������@��F�z��@�?�	rC�@��e�g%R@�l,�͍�@�%��,@����uG�@���z��}@�� p��z@�w�a�&@�����E@�����@���:�@�K�j���@š�H�@�|�ɼ@�vSé�#@������v@˅a4�Om@�"�#�q@�η�r�@�D��P�@�)�?��@��!}�@�	�#�ӕ@���1v@�	��Y�@���d�@�*M��t@�F�"��@�l�C��@ڙ��'�@�Г��9@��2ܪ        ?g�u�?��_���?�����?ɳ��*×?�X����?⎩���x?��oKr?�� �?��F	���?�=\zY$�@k���U@��)@]KQ��@�56�@�9qQ�6@��D�!@�E 5R@��Zm�@ �)� 3�@#m��!�@%|xS˾@(sf��"@*ܠ\6��@-߅���Y@0��8aX0@2Ha4^@�@4 kTW�d@6"_k�J@8)�X
\@:\~ct��@<�ZH��e@? ,�,BV@@�D���@B2����v@C�u�?�@E����@F����@HC���y@I�=�>�@K��1�0�@M���Q�V@Ov�7߮@P�b~�F@Q�7�Ì@R�&m׿�@S�����@U%��a�@V^gĹ�^@W��&ZX@X���X@ZU(���@[�-[5��@]<���@^�!>)�@`-�=�L@a 2��,�@a�f�X�T@b���v	�@c�Ϙ�a�@d�C��^@e�;���@f�sܝ�@g���{?�        ?DQ+��y?{h�`,4?��:��o?�pni�g>?���kd�?��|u�W?���� `�?�n�''�?�!B�hB�?��O��r@�"�� �@A���#@�	��@ �oo�j@'J��?��@/�q�.�@5F?�CZ@;���E�@A�2q���@F�:湠@Lj�k�^@Q�a�+C@U�"���@Z��sJ/@_.� �@b�2��ɑ@eȠ��U8@ioj)&�@mz�P��@p��l�@shG����@v	S�f@x��i�+@|�0R�@l��@��5h���@�m�a/�@�yv/�@��X���@���I�@�[�#O.@�蟵�)�@��Ǎ�v@�2;\��{@����I@�2��/7@�����@�vBǤ۲@�1�+t(@���b��@��K�Cp�@�͘�c�D@����;t@��3Y�?�@��\d>@�"�3c�@�H�e@"=@�x��h @����^[@�����s@�D�P�đ@������@������        ?(�{�?`$�&�?� ���-?��J �ז?��c�W�i?�5q�2�?��?]�s?����r��?�o6���Q?��}\�?�fu���@�bV�@	����l�@�<�Yc@%�i�B@ QGw�@$��(i@*��e��@0�L�}��@5��4�@9�L��@?f�}�J@B�-*���@Fd�(�w�@J^�E�'@Nʩ�:Ϡ@Qֳ����@T���z�:@Ws���kf@Z��KTt@^��8�1@`�?%A$<@b�g}�u @e	�j}4�@gQ�~1��@i�8���@lU4g�ʨ@oKd���@p�?��4@r�~qG�@t"~=�@u���Sh�@w�C�@y�Ot]�@{��S��@}�P�_@���g�]@��T�t@�7f42�?@�w���@�����<@�!���@����,Y+@��̇@��j����@�0S2�MZ@��'v�_?@��^�\�j@�����P@�����@�������@����N�@��I�bv�        ?�Ӽ|���@#���D�V@A_�wD�~@T�"�@bE�}D�@m٠�@u+�,݆r@|�8҆r�@���5� @�.�$�@��<	,K�@�����@����W@�\�퐁�@����@��P�۹@��!�8�<@�N���'t@�K'ܵ �@���n׷s@��2VN@��猛��@�-B�@�]��o3@��[(��@�p^�O@�?	t�@���s��@�6ä�	^@��>g�Oa@Ŵ��S@Ǜ5�`�T@ɞJ�@˾�ue@��C�(��@�+E����@�hP���@ҵ%J1�@�/G�6�@��
1b4@����� �@؏��]�c@�3
0#�@���v@ݴ/��1z@ߓX_є�@�����@������@��c�:@��S�"�@��ɛ@�Q�N��@�U~��o@��:eا�@�7�@��@랕f��@�lj<N$@�f"�@�8}�j@�ߌ>@����@�bkB@�u�*���        ?p���[\?��K#�w4?���Дls?�#���\?�P$��-?��Ђ��?���~p?���%`�f?����	no@�I�iQ;@� �+:E@�݄���@o,zp	�@8c���@6K`�@h��m��@�t�r��@ 5G^��t@"����=@$�N�L`@&;j�q�@(q���@3@*����I�@-/�v��@/���F@1.��
[u@2����w @3��)F��@5?xdS@7K^h{�@8�H�\J�@:\w���@<	toQ@=�&9�@?��}�<U@@�a}��1@A�����*@B�&I'�z@C�G3H+�@ET_���@F?S ���@GmFP�~�@H�4��L@I�,y���@K-DJ*�@L���Q�@M�O��6�@O@�w�F!@PW��'!;@Q��1U@Q�w�*5@R��czx@SgeZ�@�@T8J6+@U�$C��@U��5�{Q@V�<Z�@W�}�6/�@X�
-K{@Y���ޡ�@Z}�
�;z@[w_]���@\vK���        ?L��u��?�kP6(}?�2�s�i�?�4Ť�f?�1v���?�7,6�<?�Aa�MC?�2l����?�n�'E��@-�/h�!@	HÆ�#@.�қī@����[�@��_O1�@#P,ڴm�@(����e@.ũ�ؒ�@3�O�5W@7\����@<T��UO@A�����@D?�3�s�@G��#�w�@K��EP�/@P?�|�3�@R����H�@U~|�� @X}J�UV'@[��?�"m@_G�	�N<@a��)�V�@c��gH��@e�7ؑ_@h'�&�Cb@j�����@m\}[�,�@p�@v��@q��7��@s?q`��@t�Ӧ�@�@v���k��@x����K@z�ê1!2@|�"~2s@\�:fd@�����h@����%�@@�F"�-7`@���]�w@���	u�@��y�"@�!�<�@�ñ�q9�@�x:Fu�@�>��i:(@�k&�ô@��1c�@��N���@�O���@�#R=n�;@�Bݮ4�3@�m%��Ft@��\�R�        ?Gv�s��?x���N?��x�R?�����?�����26?�
�n�|l?���Fu?����_?��Y�{�?����F�?�p�YD@��^H�@��Τ�@ꏚ��@���آ#@�ă@G@#Q�T�+=@(����z@.�H{�M�@3Q�s�@7P�$��@<4n����@@�::l�@D��f��@G�f���@K�J�D�I@P	pEK0;@R�g'�4@U=��'ݤ@X?����@[�ϱ���@_%ի���@a��`pI�@c�C�eZ@e�2�q�\@hqRe@�j@kYh�d8@m���v�@p�e����@r&�̖�@s�8 %E�@u���3@w�����@y����@{��av�@~Gڼ��:@�[\���@���6xY@����e@�a�����@��l�X�@�c�d���@����+�@��ރ_Ü@�h�M-,�@�9DK�k�@�d6@����C�@��n���@�	�b�;@�4��N�@�W���Tn@�����jC        ?�Am%D.�@"t���
l@@$5�?��@R{(�ۏ@`�74�r�@j���b�j@snu��
@z��L���@�e����@����(@�&�H�eP@�e3gZ�s@�v��ʎr@�ǪΚ�P@�W��}g�@�&z|P�x@�f]!S�@�A�Q�Yy@��⺒��@���N���@��u;��l@�1��F0@��A���@���A�v@�BoSV@���y5��@�x�(���@�L��R�@�8r(���@�<wR=q@�Y���O@�H����N@�quA�	@¨�Z�"@��~�X
	@�?1	���@Ơx[��@�����@ɐ0~H�C@�9�ac@̾����@�l����@��C\�@���7G��@��ӻ�p@���Ɣ@��$)A��@��2��:@�g�5��@�#�A�t�@�J#4S�H@�zt�E#d@ڴ����@���@@��@�F�O�lw@ޞz8>C�@� 9�6�3@�;�v@�qD���@�1TE��@��hMoۥ@��{t���@䏄�U�        ?o���0c=?�;�[j��?�&�L%�?�]��(?�,|\�M�?���[�@�?��qم?��ّp%@M��ڭ@ͻ ʥ@�C!u,�@�?�%ߏ@��
�@�K���@(Q��!�@!��N�;@$wf�b)=@'( ^���@*�3(��@-�~��l@0 E���p@1��NlɈ@3�N;��	@5}9�.� @7x3]d,@9��w�d�@;���k�A@>6�x��@@2ݿq'{@Aql%�\@B��[��@Dr��$�@E�q��@F�V�5
@H|G�@J=�38@K�7Wb�@Mk��X�@O1�s�@P�=sc��@Q{3�
�@Rz��[��@S�#,I�=@T��/��s@U��!	��@V�v���@X�m�>t@YU1Ġ�@Z�����@[�< ��@]Nѓ�V@^����Tr@`z��@`Ҽ�g��@a����^@b^�9�_@c,3ђ�@c����j]@d�@�K̵@e��Mj��@f�X�[z@gz�]BZ�@hf_����        ?J�	E��?�W�j)�?��q���?���9�*?�k���n?����z}=?�Qy"�&?��a�4 ?�`�&G$@ ޔ�%� @	���5@�zl:�@a�)�S�@!n�\k��@'nD�C�z@.ݒNR�@3�?�\��@9`��
�D@?Ž����@C�0&N@G�T4�F@Lơ��~5@Q#�5n@T7�u���@W��O[��@[g,�@_�c�b�{@b�G3~�@dvʱ	�x@g���My@i���Y*@mO��@p%�%�^�@q�Z�ǥ�@s�I��@u���a�@w����@zi�jj@|m�I@~��:1@�ř^e0�@�'۝Q�@���ŵ95@�%��[�@��G��"@�r�/�@�8+!(��@�4���;@��p��;@�|;d8@���V0@�7(&w.@�am���@����Km�@��Xj�@�1'�H�a@�����v�@��m�@�����w�@�����@�����h�@�0�My� @�����        ?u'�q���?�G����E?��RP�N?����a:?�zwռ��?���Ln?����8@�K���@�v��6@�Q|�c@�Q��!�@ ��:I��@%�:��@+_�,�t�@1}�}�6@5N(Z��@9��z1�@?)ϐ���@B��*V�@F.ͬ�n�@J&#~���@N� �8�@Q�u�vm�@T��Qа@W����M�@Z��քS@^�/�E��@a]��b�V@c�m�x��@e��@�@h��R�d@kf���)�@np�] �$@p�W �U@r��@T�<@tz�x�
�@vz��>/�@x�-�jB�@z���\@}G`l+�@�L��@�A�Q�j�@��v��2@�,L�/��@���,��@�e��k�@�y��Y@��&�%$�@��J���@���j��@�j�\�l�@�{�HW��@��0U�C@��q�'4�@��Q��@�*��_Y�@�r_�Ͳ@��Q~?:�@�#�L2s@��R����@���z��@���N�m�@�nq,܊        ?�;�- �@/�ȯLR3@L���Xf@`���FK@n�6�п_@x�V�KO@�CTC�&7@�;1�ﶣ@�����@�A�S�@�g,oޱu@�+��	%@�&y��&@��P���@�#����@���-�@���d@�FbƸ�a@���t#_@�Ѡ�C@���(��@�hWNB0�@�%����J@��f�;p�@�B��J�@��i���R@ưj��v�@ȆQ�c@�p���s@�p2�Ot&@΅{<��@�W��Y>@�x/j|�@ң�]�;0@���^ߒ�@����O�@�l�<�@�Ƿ���@�/�x��S@ڦ��ѝ@�+8Bǯ�@��R+P*\@�f86!w�@����_�+@�r��;'@�`Q�?@�U����@�TVo(�@�[���� @�k��4�K@�sT)�@����@�Дa\s�@����w�@�@R�]M@텨4��z@��
��i�@��_��.@��##�)@�{*�H:@�4����@���V�@����        ?pꒌ?�Q �?�.l$�!?̪����?�x8�}��?���4��<?��
��\w?����>?���9B@ p���@b�"��@�e9(!{@�D;��i@~|�#$@i�2[@�����d@\�<?@���&?�@!^�/�Ø@#�!r�� @%����w@(E���Z@*�yǍڟ@-�k�gƊ@0P�#���@1���o�T@3��߳�@5D�z�>�@7oS��@9Ry*�@;��2@=$NR�@?WX��rP@@�UeB�@B��wJ@CA�_�@D�H�>�d@E��b�z�@GD�/=ݟ@H�\Sz�@J0=pK�-@K�j֙�@ML����@N���yB@PL�)1�%@Q(��B�@R
j2I�@R� ��@S�U�i�@T�]�b��@U�/�D@V�wh�<@W�|��@X�Q�D@Y�;w囬@Z��hu��@\�^Q�@]49�v(@^X�˸}@_�!�dU<@`Y��5\�@`�b7y�@a�;�p        ?(4m�R/A?Z��*hw�?|�M���?��~�s1�?�+���j?��-:*�?��\��?�a�H��?荃��#�?�\Ǳ��@ 1rM�a@|.9m@��z.Y@�/��su@!��h��@'��8���@/n2�/u-@4[�����@9��z9@@A��&�@DGY%�@H���B@M��^��6@Q��Ca�@U o�P��@X���"@\�?�ԇ@`�����F@c x�X��@e۝m�U@h�ީ�F@l�|�@o���>��@q�h�=�@s�<��(�@u�����@xCBL�+@zÈ4�	@}m�H~�|@�!bU�р@����f�@�9�����@����@������f@���qei@���9�M@�����B�@��oY���@���{��@��[�T[H@���M�Բ@�Jq��&@��˟��@��C:Z@��Q9�w�@�����@��,�@.�@�^4���@�M�&�J@�q]��@�^��j�@�T�m�!@�S\�4�        ?g��ʞ=?�Ra��|?����gL�?�D��@�?Ѽ}�+�?���?��2�)�q?���<zS?���m?����ѓn@�d%kz@S��RE@�錿P@��f_�@ �S��w�@%�q���6@+�O�wP@1z.�M��@5�����@:���R��@@>�!h�@C�M��,@GQ��.@K��DEFe@P#IqC@R���Q@U����&;@X�[�s�@\2�<�#�@_��=z�^@a�/�@r@dXMJ@fWe�IN@h��ԃ/@kS��b׭@n
�k��@ps�A`޼@q��5�@s�!M�/@u4lo(�@v��(�A@x��@ج�@z��ŭ�@|��|b�@~�Rug�@�pt��@��A��V�@��� �@��b�>4�@�2�s&��@��n�؂/@�܉��X@�D_ �@��2��k@�;G���e@����h2�@�h\�qs�@���t��l@�f�(W��@�K]�ғR@�7EL���@�*��C�	@�&<�k7        ?�0k�Vl@�)��@:(��	i@L�&���@Y�lAlq�@c�
�%@l~<�\U^@s9��@�:@x����@7�_!��@�0��@��
8ue@�.���a�@���O>��@�Yh��@�b0���@����x�@��݈��@�0��o�
@���Ո�+@�����v@���K�{@��_^)�@���5���@�K��ѯ�@�����@�0<\�N�@���T�M@�k%Aa@��{�
�`@�FDZ��@���!J�@��"��-@�S�k_��@�8�\@�0b�nHQ@��t1�9@���=��N@�ɝSz�@�����%@�<@m��@�X^"��@ǝ8GH5s@��� �b@�G�'R?�@˭���n"@��0m�@ΛH_�j�@��??��@�ۉI��@ѫ8V��L@Ҁ�cA�d@�\9?0#�@�=�� ,e@�%9h�q@����\u@�R��	d@� i��5@� ��� E@�|⒙@�ྫ�R@�*t�˕�@�E��        ?>�@�q�?rl:�*� ?�5���*?�Sj�?�ëg�?�?�U׹K?ȩM�?с��k��?�����M_?�Uw"��?�x��?�M�6�?�F��|[8?�
۬�[�?��'�Āa?�2����?��FL�@�ra��@��[�_F@æ����@Bsm݃@�R��@�~�L@V�����@�eh;j@[�R�¢@'Q�w"@&��6��@!-�s,U�@"���pD@$����� @&��Q��~@(�I�>.�@*�"��#@-C|g4UH@/���8�@1-���"@2��@F]I@4B4[@5��n�f@78[�4�@8�#�@:�"�0#�@<�Ny��@>��m@@uz�>�@A����z@B�p����@D�@ܕ�@E`w���@F��lF@H5>�ԸC@I�w?�G@KLUZYa@L��de��@N��'핺@P6~\���@Q"7*LC�@Rj{��>@SN��;@T$.<�@U%�TNFp@V;K�A�%        ?�M��&�?QBU
�|�?u�Ӈ�K?�OUp:�m?�W�s�?��~;F�?��՘�"?�p.��?�O�#r�k?�R`(��,@ )�}7�@������@y���@�/��l@!�*��N@'���`�,@/f6���@4?Y�K��@9���?3�@?��F^�@C�s��0@Gٚ�"�@L��&���@P�j4*��@S���0@WP7�@Z���s�@_���@a��.��2@d*&�;��@f������@i��%B��@l��܎v�@p�s�W@q�d~t�=@s�T�Np|@u���.�Q@x^�
��@zjv�2�@|�l1�@�g#��}@�<*�3�@��~��\@�Y�dZw�@�o�~�@�װ���@�����@��B��@��բ�!@���(�@�1-\��@�jv!�o)@��S���q@�F�7S@�u�m�2@���
 @�|�n1@��%�O2@��CR8f@��e�<�@�5�}�c@�,�C�`�@�.���0        ?�`�M��?J�E��a?rrX��m?�&&
�l?�7�	!O?��}Ψ�?�׮�B��?���]���?���R�v?�� ����@��g�j�@���m`�@F<�|�@ ��c	*6@&�=Ӵ�@/�f�s@4ws�5��@:~��,1�@@�i=�&9@E��v�@J �@Oޛ�_
@S;�Q
j6@V��?�s�@[0ao�u�@_��q�@b�#	w�Z@em���@h���1�@l�{���@o���s�@q�{:*-a@t�OG<)@vV6�e��@x�țh��@{n$���z@~8��[�@��q٭�@�%��O@��pb@���7,�@�X�,ȼ@�B8u�>@�B�=���@�[ry�@��{�F؆@��#n�w@��Ea@�X4��@��-@Q#�@���>�q@�\�Ƿ��@��[~zX@�K,�NS�@��(�h26@�n\�8^@��3E#{@�cE����@�CFԿ|�@�)�jo�.@�6B�-�@�$z/�@����}�        ?��R&��^?�!߃	@�!�P��@$F۟O��@3j�1�J;@@��@Hg����@Q\�� ��@W�j
K�@_!��\z�@c��#�@i ��s��@o��˭d@r�#��ve@v�K���D@z�l��@�<],@��m.���@�o4���@��쬢��@�!F���@���Kp��@�
G�[+�@�G��wY@����;D�@�L�B��@����@�HR��@�$�n��@��X�wA�@�����5n@��g�*F@����-n�@��a�0�@�3#���@��Um�F@�$�r��@��l+�x@�����܁@��{4	�@�10�5�`@��aԀ�@������o@����x�@��V]@�z�W�@��+#�r�@��T��.^@�>��@�oSqM�@��%��,@�Ibmv�@���/ag@�e2w_��@��w.��@��<��S@�E���@�1���@�&}ã?�@�#d=�+�@�(��2{@�6R�i�@�K����